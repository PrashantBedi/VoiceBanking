import "package:flutter/material.dart";
import "../colors/app_color.dart";
import "../colors/app_theme_context_extension.dart";

class VBPasswordFormField extends StatefulWidget {
  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final bool autoFocus;
  late final String hintText;
  final Icon? icon;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Function()? onSubmit;
  final ValueKey<String>? key;

  VBPasswordFormField({
    required this.hintText,
    this.validator,
    this.controller,
    this.autoFocus = false,
    this.icon,
    this.onChanged,
    this.onSubmit,
    this.key,
    this.keyboardType,
  });

  @override
  State<VBPasswordFormField> createState() => _VBPasswordFormFieldState();
}

class _VBPasswordFormFieldState extends State<VBPasswordFormField> {
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    var _submit = widget.onSubmit;
    return TextFormField(
      onFieldSubmitted: _submit != null ? (value) => _submit() : null,
      obscureText: _obscured,
      enableSuggestions: false,
      autocorrect: false,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      autofocus: widget.autoFocus,
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          child: GestureDetector(
            onTap: _toggleObscured,
            child: Icon(
              _obscured
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              size: 24,
              color: context.getColor(AppColor.icon),
            ),
          ),
        ),
        fillColor: context.getColor(AppColor.backgroundLight),
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: context.getColor(AppColor.hintText),
            ),
        errorStyle: TextStyle(
          color: context.getColor(AppColor.error),
        ),
        hintText: widget.hintText,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.getColor(AppColor.error),
            style: BorderStyle.solid,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.getColor(AppColor.error),
            style: BorderStyle.solid,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.getColor(AppColor.border),
            style: BorderStyle.solid,
            width: 1.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.getColor(AppColor.border),
            style: BorderStyle.solid,
            width: 1.5,
          ),
        ),
        filled: true,
      ),
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: context.getColor(AppColor.headlineText),
          ),
    );
  }
}
