import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants.dart';

class EditText extends StatefulWidget {
  final String? initialValue;

  final String? labelText;
  final String? hintText;
  final String? errorText;

  // final bool autocorrect;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;

  // final AutovalidateMode? autovalidateMode;
  // final bool usePasswordValidator;
  final bool isPassword;
  final bool isCanClear;
  final bool isForSend;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final int? maxLines;
  final int? maxLength;
  final VoidCallback? onPressedSend;

  // final VoidCallback? onTap;
  // final Color backgroundColor;
  // final double height;

  const EditText({
    super.key,
    this.initialValue,
    this.controller,
    this.labelText,
    this.hintText,
    this.errorText,
    // this.autocorrect = false,
    this.obscureText = false,
    this.textInputAction,
    this.validator,
    this.onSaved,
    this.onChanged,
    // this.onTap,
    this.keyboardType,
    // this.autovalidateMode,
    // this.usePasswordValidator = false,
    this.isPassword = false,
    this.isCanClear = false,
    this.isForSend = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputFormatters,
    this.prefixText,
    // this.backgroundColor = Colors.white,
    this.maxLines = 1,
    this.maxLength = 250,
    this.onPressedSend,
    // this.height = 60,
  });

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // onTap: widget.onTap,
        initialValue: widget.initialValue,
        controller: widget.controller,
        // autocorrect: widget.autocorrect,
        obscureText: widget.isPassword ? _obscureText : widget.obscureText,
        textInputAction: widget.textInputAction,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        // maxLength: widget.maxLength,
        // autovalidateMode: widget.autovalidateMode,
        textCapitalization: widget.textCapitalization,
        // inputFormatters: widget.inputFormatters,
        inputFormatters:[
          LengthLimitingTextInputFormatter(widget.maxLength),
        ],
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          fillColor: Palette.edit,
          filled: true,
          contentPadding: const EdgeInsets.all(20),
          hintText: widget.hintText,
          labelText: widget.labelText,
          prefixText: widget.prefixText,
          errorText: widget.errorText,
          // labelStyle: const TextStyle(color: Palette.grey),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Palette.gray),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Palette.gray),
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Palette.gray),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Palette.accent),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Palette.accent),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Palette.accent),
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: getSuffixIcon(),
          // suffixIconConstraints:
          // const BoxConstraints.expand(width: 24, height: 24)
        ),
        validator: (v) {
          return widget.validator?.call(v);
        });
  }

  Widget? getSuffixIcon() {
    if (widget.isPassword) {
      return IconButton(
        splashColor: Colors.transparent,
        padding: const EdgeInsets.all(4),
        iconSize: 16,
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: Palette.accent,
        ),
        onPressed: () => setState(() => _obscureText = !_obscureText),
      );
    } else if (widget.isForSend) {
      return IconButton(
        splashColor: Colors.transparent,
        padding: const EdgeInsets.all(4),
        icon: const Icon(Icons.send, color: Palette.accent),
        onPressed: widget.onPressedSend,
      );
    }

    if (widget.isCanClear && widget.controller?.text.isNotEmpty == true) {
      return IconButton(
        padding: const EdgeInsets.all(4),
        iconSize: 16,
        icon: const Icon(
          Icons.clear_rounded,
          color: Colors.grey,
        ),
        onPressed: () => setState(() {
          widget.controller?.clear();
          widget.onChanged?.call('');
        }),
      );
    }
    return null;
  }
}
