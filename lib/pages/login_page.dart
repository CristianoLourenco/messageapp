import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messageapp/widgets/user_input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController nameController, passwordController;
/*
  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }
*/
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .05),
            child: Column(
              children: [
                const Spacer(),
                Expanded(
                  flex: 6,
                  child: Image.asset(
                    'assets/images/logo.png',
                    scale: 3,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Bem vindo ao \"",
                        style: theme.textTheme.titleLarge,
                      ),
                      TextSpan(
                        text: "Sms",
                        style: GoogleFonts.roboto().copyWith(
                          fontSize: 28,
                          color: theme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "\"",
                        style: theme.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Flexible(
                  flex: 4,
                  child: Column(
                    children: [
                      UserTextFieldWidget(
                        labelText: "Nome de Usuário",
                        prefixIcon: Icon(Icons.person_pin_rounded),
                      ),
                      Divider(color: Colors.transparent),
                      UserTextFieldWidget(
                        prefixIcon: Icon(Icons.lock_person_rounded),
                        labelText: "Palavra-passe",
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.maxFinite, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(color: Colors.black12),
                    ),
                  ),
                  child: const Stack(
                    children: [
                      Align(
                        heightFactor: 2,
                        alignment: Alignment.center,
                        child: Text("Entrar", textAlign: TextAlign.center),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeAlign: -3,
                        ),
                      )
                      // Icon(Icons.check)
                    ],
                  ),
                ),
                const Divider(color: Colors.transparent),
                const Divider(color: Colors.transparent),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Ainda não possui uma conta?"),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Criar conta"),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.transparent),
                const Divider(color: Colors.transparent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
