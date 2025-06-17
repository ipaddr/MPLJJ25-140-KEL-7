import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class RiwayatPendataanScreen extends StatelessWidget {
  const RiwayatPendataanScreen({super.key});

  static const List<Map<String, dynamic>> riwayatData = [
    {
      'nama': 'Ani',
      'jenisKelamin': 'Perempuan',
      'usia': 5,
      'status': 'Anak-anak',
      'tinggi': 105,
      'berat': 17,
      'bantuan': 'Susu dan Vitamin',
      'tanggal': '17 Juni 2025',
    },
    {
      'nama': 'Ibu Siti',
      'jenisKelamin': 'Perempuan',
      'usia': 28,
      'status': 'Ibu Hamil',
      'tinggi': 158,
      'berat': 54,
      'bantuan': 'Makanan Tambahan',
      'tanggal': '10 Juni 2025',
    },
  ];

  void _showRiwayatDetailDialog(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text('Detail Riwayat'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('👤 Nama: ${data['nama']}'),
                Text('⚧️ Jenis Kelamin: ${data['jenisKelamin']}'),
                Text('🎂 Usia: ${data['usia']} tahun'),
                Text('📌 Status: ${data['status']}'),
                Text('📏 Tinggi Badan: ${data['tinggi']} cm'),
                Text('⚖️ Berat Badan: ${data['berat']} kg'),
                Text('🎁 Bantuan: ${data['bantuan']}'),
                Text('📅 Tanggal: ${data['tanggal']}'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pendataan'),
        backgroundColor: Colors.pink[100],
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: riwayatData.length,
        itemBuilder: (context, index) {
          final data = riwayatData[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.pink),
              title: Text(data['nama']),
              subtitle: Text('Status: ${data['status']}'),
              trailing: const Icon(Icons.info_outline),
              onTap: () => _showRiwayatDetailDialog(context, data),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(
        currentIndex: 1,
      ), // ← tambahkan ini
    );
  }
}
