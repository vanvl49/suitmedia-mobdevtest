import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia_test/models/users.dart';

class UserProvider extends ChangeNotifier {
  List<Users> _users = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  String? _error;
  int _currentPage = 1;
  final int _perPage = 6;
  bool _hasMoreData = true;
  String? _selectedUser;
  String _Name = '';

  List<Users> get users => _users;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  String? get error => _error;
  bool get hasMoreData => _hasMoreData;
  String? get selectedUser => _selectedUser;
  String get name => _Name;

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (_isLoading || _isLoadingMore) return;

    if (isRefresh) {
      _currentPage = 1;
      _hasMoreData = true;
      _users.clear();
      _isLoading = true;
    } else {
      _isLoadingMore = true;
      _currentPage++;
    }

    _error = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse(
          "https://reqres.in/api/users?page=$_currentPage&per_page=$_perPage",
        ),
        headers: {"x-api-key": "reqres-free-v1"},
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> data = jsonData['data'];

        final List<Users> fetchedUsers = data
            .map((user) => Users.fromJson(user))
            .toList();

        if (isRefresh) {
          _users = fetchedUsers;
        } else {
          _users.addAll(fetchedUsers);
        }

        if (fetchedUsers.length < _perPage) {
          _hasMoreData = false;
        }
      } else {
        _error = 'Gagal fetch data user: ${response.statusCode}';
      }
    } catch (e) {
      _error = 'Error: $e';
    } finally {
      _isLoading = false;
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> refreshUsers() async {
    await fetchUsers(isRefresh: true);
  }

  void updateSelectedUser(String name) {
    _selectedUser = name;
    notifyListeners();
  }

  void setUserName(String name) {
    _Name = name;
    notifyListeners();
  }
}
