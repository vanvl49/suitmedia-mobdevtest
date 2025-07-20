// import 'package:flutter/material.dart';
// import 'package:paa_modul6/models/buku.dart';
// import 'package:paa_modul6/services/buku_service.dart';
// import 'package:paa_modul6/views/quotes_view.dart';
// import 'package:paa_modul6/views/home_screen.dart';
// import 'package:paa_modul6/views/buku_detail_view.dart';

// class BukuView extends StatelessWidget {
//   const BukuView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 30, 126, 67),
//         title: const Text(
//           "List Buku",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: FutureBuilder(
//         future: getBuku().catchError((value) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(value.toString()),
//               backgroundColor: Colors.red,
//             ),
//           );
//           return <Buku>[];
//         }),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(
//               child: Text('No Data Found. Error: ${snapshot.error}'),
//             );
//           }

//           final buku = snapshot.data!;
//           return ListView.builder(
//             padding: const EdgeInsets.all(12),
//             itemCount: buku.length,
//             itemBuilder:
//                 (context, index) => InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder:
//                             (context) => BukuDetailView(snapshot: buku[index]),
//                       ),
//                     );
//                   },
//                   borderRadius: BorderRadius.circular(20),
//                   child: Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     margin: const EdgeInsets.symmetric(
//                       vertical: 10,
//                       horizontal: 16,
//                     ),
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Icon(Icons.image, size: 50, color: Colors.grey),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   buku[index].title,
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   "Rilis: ${buku[index].releaseDate}",
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//           );
//         },
//       ),
//       bottomNavigationBar: Container(
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           color: Color.fromARGB(255, 30, 126, 67),
//         ),
//         height: 70,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
//                 child: const Icon(
//                   Icons.menu_book,
//                   size: 35,
//                   color: Color.fromARGB(255, 30, 126, 67),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => const HomeScreen()),
//                   );
//                 },
//                 icon: const Icon(Icons.home, size: 30, color: Colors.white),
//               ),
//               IconButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => const QuotesView()),
//                   );
//                 },
//                 icon: const Icon(Icons.book, size: 30, color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
