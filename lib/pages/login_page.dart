import 'package:flutter/material.dart';
import 'package:messageapp/config/app_text_config.dart';
import 'package:messageapp/controllers/user_controller.dart';
import 'package:messageapp/models/user_model.dart';
import 'package:messageapp/pages/home_page.dart';
import 'package:messageapp/widgets/user_input_text.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController nameController, passwordController;
  late UserModel? logedUser;
  late bool isLogedUserExist, loadCircular;

  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    logedUser = UserModel();
    isLogedUserExist = false;
    loadCircular = false;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final appText = AppTextConfig();

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
                        text: "${appText.welcomeTo} \"",
                        style: theme.textTheme.titleLarge,
                      ),
                      TextSpan(
                        text: appText.sms,
                        style: theme.textTheme.displayMedium?.copyWith(
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
                Flexible(
                  flex: 4,
                  child: Column(
                    children: [
                      UserTextFieldWidget(
                        prefixIcon: const Icon(Icons.person_pin_rounded),
                        controller: nameController,
                        labelText: appText.identificationNumber,
                      ),
                      const Divider(color: Colors.transparent),
                      UserTextFieldWidget(
                        prefixIcon: const Icon(Icons.lock_person_rounded),
                        controller: passwordController,
                        labelText: appText.passWord,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                FilledButton(
                  onPressed: _login,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.maxFinite, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(color: Colors.black12),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        heightFactor: 2,
                        alignment: Alignment.center,
                        child: Text(appText.enter, textAlign: TextAlign.center),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: loadCircular
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeAlign: -3,
                              )
                            : const SizedBox.shrink(),
                      )
                    ],
                  ),
                ),
                const Divider(color: Colors.transparent),
                const Divider(color: Colors.transparent),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(appText.dontHaveAccount),
                      TextButton(
                        onPressed: () {},
                        child: Text(appText.createAcount),
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

  Future<void> getResponse(UserController userController) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    http.Response response = await http.get(userController.getUsers());
    userController.convertJsonUsers(response.body);
    isLogedUserExist =
        userController.logIn(nameController.text, passwordController.text);
    logedUser = userController.logedUser();
  }

  void _login() async {
    final userController = UserController();
    final appText = AppTextConfig();

    setState(() => loadCircular = true);
    await getResponse(userController).whenComplete(() {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          elevation: 8,
          behavior: SnackBarBehavior.floating,
          backgroundColor: isLogedUserExist
              ? Colors.green
              : Theme.of(context).colorScheme.error,
          content: Text(
            isLogedUserExist
                ? '${appText.welcome}: ${logedUser?.name ?? ''}'
                : appText.invalidUser,
          ),
        ),
      );
    });

    setState(() {
      loadCircular = false;
      isLogedUserExist
          ? Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false)
          : () {};
    });
  }
}
