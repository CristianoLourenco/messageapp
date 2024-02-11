import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Image.asset('assets/images/logo.png', scale: 3),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Bem vindo ao \"",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextSpan(
                  text: "Sms",
                  style: GoogleFonts.robotoTextTheme().titleLarge?.copyWith(
                        fontSize: 28,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(
                  text: "\"",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 4,
            child: AnimatedPadding(
              duration: const Duration(seconds: 3),
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Nome de Usuário",
                      hintText: "ex: Megan Sousa",
                      prefixIcon: const Icon(Icons.person_pin_rounded),
                      floatingLabelStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                    ),
                  ),
                  const Divider(color: Colors.transparent),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock_person_rounded),
                      labelText: "Palavra-passe",
                      floatingLabelStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
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
                    child: const Text("Entrar"),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Ainda não possui uma conta?"),
              TextButton(
                onPressed: () {},
                /*style: TextButton.styleFrom(
                          minimumSize: const Size(double.maxFinite, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: BorderSide(
                              color:
                                  Theme.of(context).primaryColor.withOpacity(0.5),
                            ),
                          ),
                        ),*/
                child: const Text("Criar conta"),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
