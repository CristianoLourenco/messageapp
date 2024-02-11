import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .05),
            child: Column(
              children: [
                const Spacer(),
                Expanded(
                    flex: 6,
                    child: Image.asset('assets/images/logo.png', scale: 3)),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Bem vindo ao \"",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextSpan(
                        text: "Sms",
                        style:
                            GoogleFonts.robotoTextTheme().titleLarge?.copyWith(
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
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "Nome de Usuário",
                          hintText: "ex: Crstiano Lourenco",
                          prefixIcon: const Icon(Icons.person_pin_rounded),
                          floatingLabelStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
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
                          floatingLabelStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
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
