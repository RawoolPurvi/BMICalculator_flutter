import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  const RoundedButton({required this.child, required this.onpressed});
  final Widget child;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      onPressed: onpressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 10.0,
      child: child,
    );
  }
}