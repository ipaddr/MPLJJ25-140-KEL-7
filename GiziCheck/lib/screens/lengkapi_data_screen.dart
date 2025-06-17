import 'package:flutter/material.dart';

class LengkapiDataScreen extends StatefulWidget {
  const LengkapiDataScreen({super.key});

  @override
  State<LengkapiDataScreen> createState() => _LengkapiDataScreenState();
}

class _LengkapiDataScreenState extends State<LengkapiDataScreen> {
  final TextEditingController tinggiController = TextEditingController();
  final TextEditingController beratController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usiaController = TextEditingController();
  final TextEditingController mbgController = TextEditingController();

  String jenisKelamin = 'Perempuan';
  String status = 'Ibu Hamil';
  DateTime tanggal = DateTime(2025, 5, 14, 10, 0);

  @override
  void initState() {
    super.initState();
    tinggiController.text = '171 cm';
    beratController.text = '80 kg';
    namaController.text = 'Meli';
    usiaController.text = '28 tahun';
    mbgController.text = 'Kentang,Brokoli,Ikan';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lengkapi Data"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildField("Tinggi Badan (cm)", tinggiController),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildField("Berat Badan (kg)", beratController),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildDropdownField(
              label: "Jenis Kelamin",
              value: jenisKelamin,
              items: const ["Perempuan", "Laki-laki"],
              onChanged: (val) => setState(() => jenisKelamin = val!),
            ),
            const SizedBox(height: 16),
            _buildField("Nama", namaController),
            const SizedBox(height: 16),
            _buildField("Usia (tahun)", usiaController),
            const SizedBox(height: 16),
            _buildDropdownField(
              label: "Status",
              value: status,
              items: const ["Ibu Hamil", "Lajang", "Menikah", "Lainnya"],
              onChanged: (val) => setState(() => status = val!),
            ),
            const SizedBox(height: 16),
            _buildField("MBG", mbgController),
            const SizedBox(height: 16),
            _buildInfoBox(
              "Diterima pada tanggal ${tanggal.day} ${_getMonth(tanggal.month)} ${tanggal.year} pada pukul ${_formatTime(tanggal)}",
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Submit / Save data
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade100,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Accept"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Reset form
                      setState(() {
                        tinggiController.text = '';
                        beratController.text = '';
                        namaController.text = '';
                        usiaController.text = '';
                        mbgController.text = '';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.grey.shade800,
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Reset"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items:
          items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildInfoBox(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }

  String _getMonth(int month) {
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return months[month - 1];
  }

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}.${dateTime.minute.toString().padLeft(2, '0')}AM";
  }
}
