import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/views/second_screen.dart';
import 'package:suitmedia_test/providers/user_provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();
  String? nameErrorText;
  String? palindromeErrorText;

  bool isPalindrome(String text) {
    String Text = text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();

    for (int i = 0; i < Text.length ~/ 2; i++) {
      if (Text[i] != Text[Text.length - 1 - i]) {
        return false;
      }
    }
    return true;
  }

  void _showPalindromeDialog(bool isPalindrome) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                palindromeController.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                isPalindrome ? 'Palindrom!' : 'Bukan Palindrom!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isPalindrome ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              Icon(
                isPalindrome
                    ? Icons.check_circle_rounded
                    : Icons.cancel_rounded,
                color: isPalindrome ? Colors.green : Colors.red,
                size: 64,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E5266),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('OK'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    palindromeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: const Icon(
                        Icons.person_add,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 80),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.9),
                      ),
                      child: TextField(
                        onChanged: (value) => setState(() {
                          nameErrorText = null;
                        }),
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),
                    if (nameErrorText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            nameErrorText!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),

                    const SizedBox(height: 16),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.9),
                      ),
                      child: TextField(
                        onChanged: (value) => setState(() {
                          palindromeErrorText = null;
                        }),
                        controller: palindromeController,
                        decoration: InputDecoration(
                          hintText: 'Palindrome',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),
                    if (palindromeErrorText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            palindromeErrorText!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),

                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            palindromeErrorText =
                                palindromeController.text.isEmpty
                                ? 'Input palindrome tidak boleh kosong'
                                : null;
                          });

                          if (palindromeController.text.isNotEmpty) {
                            bool result = isPalindrome(
                              palindromeController.text,
                            );
                            _showPalindromeDialog(result);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E5266),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'CHECK',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nameErrorText = nameController.text.isEmpty
                                ? 'Input nama tidak boleh kosong'
                                : null;
                          });
                          if (!nameController.text.isEmpty) {
                            provider.setUserName(nameController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SecondScreen(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E5266),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'NEXT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
