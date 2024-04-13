import 'package:flutter/material.dart';

// Custom TextField for global uses
class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final bool isPassword;
  final TextInputType? keyboardType;
  final bool enabled;
  final FormFieldValidator<String>? validator;
  final bool isMultiline;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final bool autofocus;
  final bool capitalizeFirstCharacter;
  final void Function()? onTap;
  final TextStyle? hintTextStyle;

  const AppTextField({
    super.key,
    this.hintTextStyle,
    this.controller,
    this.hint,
    this.isPassword = false,
    this.keyboardType,
    this.enabled = true,
    this.validator,
    this.isMultiline = false,
    this.suffixIcon,
    this.onChanged,
    this.textInputAction,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.onTap,
    this.prefixIcon,
    this.capitalizeFirstCharacter = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = false;

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      customBorder: Theme.of(context).inputDecorationTheme.border,
      child: IgnorePointer(
        ignoring: widget.onTap != null,
        child: TextFormField(
          textCapitalization: widget.capitalizeFirstCharacter
              ? TextCapitalization.sentences
              : TextCapitalization.none,
          autofocus: widget.autofocus,
          maxLines: widget.isMultiline ? 5 : 1,
          controller: widget.controller,
          onChanged: widget.onChanged,
          enabled: widget.enabled,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: widget.hintTextStyle,
            prefixIcon: widget.prefixIcon,
            errorMaxLines: 2,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: _obscureText ? Colors.grey : Colors.deepPurple),
                    onPressed: _togglePassword,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
