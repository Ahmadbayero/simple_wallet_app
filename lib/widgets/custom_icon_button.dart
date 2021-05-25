import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key key,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: 35.0,
      height: 35.0,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.2),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: IconButton(
        padding: EdgeInsets.all(0),
        iconSize: 32.0,
        icon: Icon(icon),
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}
