import 'package:flutter/material.dart';

class CirleIconBtn extends StatelessWidget {
  const CirleIconBtn({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        height: 40,
        width: 30,
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
