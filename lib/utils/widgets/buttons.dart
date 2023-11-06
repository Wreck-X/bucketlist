import 'package:bucketlist/resources/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  // Declare the variables you want your custom
  // button to have.
  final Color color;
  final String text;
  final VoidCallback function;

  const CustomButton({
    super.key,
    required this.color,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(210, 51),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: ColorsClass.white, fontSize: 20),
      ),
    );
  }
}
