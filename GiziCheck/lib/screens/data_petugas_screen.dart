import 'package:flutter/material.dart';

class DataPetugasScreen extends StatelessWidget {
  const DataPetugasScreen({super.key});

  // Contoh data statis
  static const List<Map<String, String>> petugasList = [
    {'nama': 'Petugas A', 'email': 'petugasA@example.com'},
    {'nama': 'Petugas B', 'email': 'petugasB@example.com'},
    {'nama': 'Petugas C', 'email': 'petugasC@example.com'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Petugas'),
        backgroundColor: Colors.pink[100],
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: petugasList.length,
        itemBuilder: (context, index) {
          final petugas = petugasList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(petugas['nama']!),
              subtitle: Text(petugas['email']!),
              trailing: IconButton(
                icon: const Icon(Icons.info_outline, color: Colors.pink),
                onPressed: () => _showDetailPopup(context, petugas),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDetailPopup(BuildContext context, Map<String, String> petugas) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Detail Petugas'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama  : ${petugas['nama']}'),
                const SizedBox(height: 8),
                Text('Email : ${petugas['email']}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Tutup'),
              ),
            ],
          ),
    );
  }
}
