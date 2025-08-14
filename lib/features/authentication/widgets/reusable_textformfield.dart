import 'package:flutter/material.dart';
import 'package:lesson_1/core/utils/app_colors.dart';

class ReusableTextForm extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  ReusableTextForm({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<ReusableTextForm> createState() => _ReusableTextFormState();
}

class _ReusableTextFormState extends State<ReusableTextForm> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? obscureText : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.pink,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: AppColors.background,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.background,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
