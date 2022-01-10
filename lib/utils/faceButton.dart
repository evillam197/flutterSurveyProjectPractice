import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:survey_project/utils/myColors.dart';

class FaceButton extends StatelessWidget {
  FaceButton(
      {Key? key,
      required this.onPressed,
      required this.btnIcon,
      required this.btnText,
      required this.btnColor})
      : super(key: key);
  final GestureTapCallback onPressed;
  Icon btnIcon;
  Text btnText;
  Color btnColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: SizedBox(
            width: 100,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  btnIcon.icon,
                  size: 40,
                  color: btnIcon.color,
                ),
                Text(
                  btnText.data.toString(),
                  style: TextStyle(fontSize: 20, color: btnText.style?.color),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey.shade500),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: btnColor),
        ),
      ),
      onTap: onPressed,
    );
  }
}
