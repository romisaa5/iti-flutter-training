import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final String? labelText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool isBorder;

  const AppInput({
    super.key,
    this.labelText,
    this.isObscureText,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.isBorder = true,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Color(0xffF3F3F3)),
    );

    return TextFormField(
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textAlign: TextAlign.start,
      maxLines: 1,
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: _isObscure,
      cursorColor: Color(0xffFF5E00),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: Color(0xffFF5E00)),
        ),
        enabledBorder: border,
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: colorScheme.error, width: 1.2),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: colorScheme.error, width: 1.2),
        ),

        labelText: widget.labelText,
        labelStyle: TextStyle(color: Color(0xff6D3805), fontSize: 16),
        suffixIcon: widget.isObscureText == true
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Color(0xffFF5E00),
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : widget.suffixIcon,
        fillColor: Color(0xffF3F3F3),
        filled: true,
      ),
      style: TextStyle(color: Color(0xff6D3805), fontSize: 16),
    );
  }
}
