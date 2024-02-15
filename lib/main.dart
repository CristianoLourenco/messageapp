import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messageapp/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: defaultFirebaseAppName,
    options: const FirebaseOptions(
      appId: "1:856970606724:android:f6697129ce9a0c6e03ead1",
      messagingSenderId: "856970606724",
      projectId: "messageapp-3afe0",
      apiKey: "AIzaSyA4P5NuXZD89A5X0lfS92NF3pKr109drBg",
      measurementId: "G-MRVD6PRLE8",
    ),
  );
  runApp(const SMSapp());
}

class SMSapp extends StatelessWidget {
  const SMSapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sms app',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
