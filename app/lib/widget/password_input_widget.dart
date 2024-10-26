import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

String? defaultValidationFunction(String value) {
  if (value.isEmpty && value != "") {
    return 'パスワードを入力してください';
  }

  return null;
}

class PasswordFormInput extends StatefulWidget {
  final TextEditingController controller;
  final Widget? placeholder;
  final Widget? label;
  final bool withVisibility;
  final String id;
  final String? Function(String)? validator;

  const PasswordFormInput({
    super.key,
    required this.controller,
    this.placeholder,
    this.label,
    this.withVisibility = true,
    this.id = 'password',
    this.validator = defaultValidationFunction,
  });

  @override
  State<PasswordFormInput> createState() => _PasswordFormInputState();
}

class _PasswordFormInputState extends State<PasswordFormInput> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return ShadInputFormField(
      id: widget.id,
      placeholder: widget.placeholder ?? const Text('パスワード'),
      obscureText: obscure,
      controller: widget.controller, // Controller assigned here
      prefix: const Padding(
        padding: EdgeInsets.all(4.0),
        child: ShadImage.square(size: 16, LucideIcons.lock),
      ),
      validator: widget.validator,
      suffix: widget.withVisibility
          ? ShadButton(
              width: 25,
              height: 25,
              padding: EdgeInsets.zero,
              decoration: const ShadDecoration(
                secondaryBorder: ShadBorder.none,
                secondaryFocusedBorder: ShadBorder.none,
              ),
              icon: ShadImage.square(
                size: 16,
                obscure ? LucideIcons.eyeOff : LucideIcons.eye,
              ),
              onPressed: () {
                setState(() => obscure = !obscure);
              },
            )
          : null,
    );
  }
}
