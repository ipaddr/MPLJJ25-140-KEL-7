import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart'; // ⬅️ pastikan file ini ada

class PendataanScreen extends StatefulWidget {
  const PendataanScreen({super.key});

  @override
  State<PendataanScreen> createState() => _PendataanScreenState();
}

class _PendataanScreenState extends State<PendataanScreen> {
  final _formKey = GlobalKey<FormState>();

  String? nama;
  String? jenisKelamin;
  double? tinggiBadan;
  double? beratBadan;
  int? usia;
  String? status;
  String? bantuan;
  DateTime? tanggalPenerimaan;

  final _namaController = TextEditingController();
  final _tinggiController = TextEditingController();
  final _beratController = TextEditingController();
  final _usiaController = TextEditingController();

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print("Nama: $nama");
      print("Jenis Kelamin: $jenisKelamin");
      print("Tinggi Badan: $tinggiBadan");
      print("Berat Badan: $beratBadan");
      print("Usia: $usia");
      print("Status: $status");
      print("Bantuan: $bantuan");
      print("Tanggal Penerimaan: $tanggalPenerimaan");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Data berhasil disimpan!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendataan Penerima Bantuan'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Wajib diisi' : null,
                onSaved: (value) => nama = value,
              ),
              const SizedBox(height: 16),

              const Text('Jenis Kelamin'),
              Row(
                children: [
                  Radio<String>(
                    value: 'Laki-laki',
                    groupValue: jenisKelamin,
                    onChanged: (value) => setState(() => jenisKelamin = value),
                  ),
                  const Text('Laki-laki'),
                  Radio<String>(
                    value: 'Perempuan',
                    groupValue: jenisKelamin,
                    onChanged: (value) => setState(() => jenisKelamin = value),
                  ),
                  const Text('Perempuan'),
                ],
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _tinggiController,
                decoration: const InputDecoration(
                  labelText: 'Tinggi Badan (cm)',
                ),
                keyboardType: TextInputType.number,
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Wajib diisi' : null,
                onSaved: (value) => tinggiBadan = double.tryParse(value!),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _beratController,
                decoration: const InputDecoration(
                  labelText: 'Berat Badan (kg)',
                ),
                keyboardType: TextInputType.number,
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Wajib diisi' : null,
                onSaved: (value) => beratBadan = double.tryParse(value!),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _usiaController,
                decoration: const InputDecoration(labelText: 'Usia (tahun)'),
                keyboardType: TextInputType.number,
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Wajib diisi' : null,
                onSaved: (value) => usia = int.tryParse(value!),
              ),
              const SizedBox(height: 16),

              const Text('Status'),
              DropdownButtonFormField<String>(
                value: status,
                hint: const Text('Pilih Status'),
                items: const [
                  DropdownMenuItem(
                    value: 'Ibu Hamil',
                    child: Text('Ibu Hamil'),
                  ),
                  DropdownMenuItem(
                    value: 'Anak-anak',
                    child: Text('Anak-anak'),
                  ),
                ],
                onChanged: (value) => setState(() => status = value),
                validator: (value) => value == null ? 'Wajib dipilih' : null,
              ),
              const SizedBox(height: 16),

              const Text('Bantuan Telah Diterima'),
              DropdownButtonFormField<String>(
                value: bantuan,
                hint: const Text('Pilih'),
                items: const [
                  DropdownMenuItem(value: 'Ya', child: Text('Ya')),
                  DropdownMenuItem(value: 'Tidak', child: Text('Tidak')),
                ],
                onChanged: (value) => setState(() => bantuan = value),
                validator: (value) => value == null ? 'Wajib dipilih' : null,
              ),
              const SizedBox(height: 16),

              const Text('Tanggal Penerimaan'),
              TextButton(
                onPressed: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() => tanggalPenerimaan = pickedDate);
                  }
                },
                child: Text(
                  tanggalPenerimaan == null
                      ? 'Pilih Tanggal'
                      : '${tanggalPenerimaan!.day}/${tanggalPenerimaan!.month}/${tanggalPenerimaan!.year}',
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _submitData,
                  child: const Text('Simpan Data'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        currentIndex: 2,
      ), // ⬅️ tambahkan navigasi bawah
    );
  }
}
