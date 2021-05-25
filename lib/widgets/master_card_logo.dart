import 'package:flutter/material.dart';

class MasterCardLogo extends StatelessWidget {
  const MasterCardLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 50.0,
      child: Stack(
        children: [
          Container(
            width: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red.withOpacity(.8),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Colors.yellow.withOpacity(.8),
              ),
            ),
          )
        ],
      ),
    );
  }
}