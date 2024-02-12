import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messageapp/pages/login_page.dart';

void main() {
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
