import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback onpressed;

  const ContinueButton({super.key, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFFFFC6C9),
          fixedSize: Size(162, 45),
        ),

        onPressed: onpressed,
        child: Text(
          "Continue",
          style: TextStyle(color: Colors.pink, fontSize: 20),
        ),
      ),
    );
  }
}
