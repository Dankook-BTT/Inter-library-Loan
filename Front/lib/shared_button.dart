import 'package:flutter/material.dart';
import 'package:inter_library_loan_new/color.dart';

class OrangeButton extends StatelessWidget {
  const OrangeButton({
    Key? key,
    required this.text,
    required this.route,
  }) : super(key: key);

  final String text;
  final String route;

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.8;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: colorGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        fixedSize: Size(buttonWidth, 54), // 버튼 너비를 동적으로 설정
      ),
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class OrangeActionButton extends StatelessWidget {
  const OrangeActionButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.8;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: colorGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        fixedSize: Size(buttonWidth, 54), // 버튼 너비를 동적으로 설정
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}