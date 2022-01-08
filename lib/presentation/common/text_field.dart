import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.callback,
    required this.label,
    required this.isPassword,
  }) : super(key: key);

  final void Function(String) callback;
  final String label;
  final bool isPassword;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController controller = TextEditingController();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).colorScheme.primaryVariant,
      onChanged: widget.callback,
      controller: controller,
      obscureText: widget.isPassword && !isVisible,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: isVisible
                      ? Theme.of(context).colorScheme.primaryVariant
                      : Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              )
            : null,
        label: Text(widget.label),
      ),
    );
  }
}
