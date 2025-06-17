import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? selectedRole;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _handleLogin() {
    final password = passwordController.text.trim();
    final email = emailController.text.trim();

    if (selectedRole == 'Admin') {
      if (password == '12345') {
        Navigator.pushNamed(context, '/admin_home');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Login sebagai Admin')));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Password admin salah')));
      }
    } else if (selectedRole == 'Petugas') {
      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email dan password wajib diisi')),
        );
        return;
      }

      Navigator.pushNamed(context, '/home');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login sebagai Petugas')));
    }
  }

  void _forgotPassword() {
    Navigator.pushNamed(context, '/forgot_password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/foodsafety.png', height: 200),
              const SizedBox(height: 16),
              const Text(
                'GIZI CHECK',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 32),

              const Text('Masuk Sebagai:', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              _roleButton(Icons.person, 'Petugas'),
              const SizedBox(height: 12),
              _roleButton(Icons.admin_panel_settings, 'Admin'),

              const SizedBox(height: 24),

              if (selectedRole != null) ...[
                if (selectedRole == 'Petugas') ...[
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12),
                ],
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),

                const SizedBox(height: 8),

                // Lupa Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _forgotPassword,
                    child: const Text(
                      'Lupa Password?',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Tombol Masuk dan Kembali
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Kembali'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[200],
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 40,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Masuk'),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 32),
              const Text(
                'Aplikasi mobile untuk mendukung program makan siang ...',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roleButton(IconData icon, String roleName) {
    bool isSelected = selectedRole == roleName;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = roleName;
          emailController.clear();
          passwordController.clear();
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink[100] : Colors.pink[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.pink : Colors.transparent,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.pink),
            const SizedBox(width: 12),
            Text(roleName, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
