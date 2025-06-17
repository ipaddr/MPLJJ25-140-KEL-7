import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/foodsafety.png',
                    height: 100,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error,
                        size: 100,
                        color: Colors.red,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "GIZI CHECK",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 20),

                  const TextField(
                    decoration: InputDecoration(labelText: "Nama"),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    decoration: InputDecoration(labelText: "Jenis Kelamin"),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    decoration: InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    decoration: InputDecoration(labelText: "Asal Puskesmas"),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (val) {}),
                      const Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "Saya telah membaca dan menyetujui ",
                            children: [
                              TextSpan(
                                text: "syarat dan ketentuan",
                                style: TextStyle(color: Colors.blue),
                              ),
                              TextSpan(text: " dan "),
                              TextSpan(
                                text: "kebijakan privasi",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Daftar"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text("Versi aplikasi 1.0"),
          ],
        ),
      ),
    );
  }
}
