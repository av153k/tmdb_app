import 'package:tmdb_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  VoidCallback onPressed;
  String text = "App Button";
  Color color = AppConstants.colors.primaryColor;
  Color borderColor = AppConstants.colors.primaryColor;
  Color textColor = AppConstants.colors.primaryColor;
  AppButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.borderColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        height: 40,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
        color: color,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
