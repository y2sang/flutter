import 'package:flutter/material.dart';
import 'constants.dart';

class ColumnWidget extends StatelessWidget {
  final IconData icon;
  final String iconText;
  ColumnWidget(this.icon, this.iconText);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          this.iconText,
          style: labelTextStyle,
        )
      ],
    );
  }
}
