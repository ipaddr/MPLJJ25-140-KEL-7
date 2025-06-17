import 'package:flutter/material.dart';

// Import semua screen
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/home_screen_admin.dart';
import 'screens/login_screen.dart';
import 'screens/user_selection_screen.dart';
import 'screens/register_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/pendataan_screen.dart';
import 'screens/riwayat_pendataan_screen.dart';
import 'screens/data_petugas_screen.dart';
import 'screens/forgot_password_screen.dart'; // ✅ Tambahkan ini

void main() {
  runApp(const GiziCheckApp());
}

class GiziCheckApp extends StatelessWidget {
  const GiziCheckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GiziCheck',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const UserSelectionScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/admin_home': (context) => const HomeScreenAdmin(),
        '/register': (context) => const RegisterScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/pendataan': (context) => const PendataanScreen(),
        '/riwayat': (context) => const RiwayatPendataanScreen(),
        '/data_petugas': (context) => const DataPetugasScreen(),
        '/forgot_password':
            (context) => const ForgotPasswordScreen(), // ✅ Ditambahkan
      },
    );
  }
}
