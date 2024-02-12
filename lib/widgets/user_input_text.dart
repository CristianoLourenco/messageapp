import 'package:flutter/material.dart';

class UserTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String? labelText;
  final Widget? prefixIcon;

  const UserTextFieldWidget({
    super.key,
    this.controller,
    this.labelText,
    this.prefixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
        labelText: labelText,
        floatingLabelStyle: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.outline,
        ),
      ),
    );
  }
}
