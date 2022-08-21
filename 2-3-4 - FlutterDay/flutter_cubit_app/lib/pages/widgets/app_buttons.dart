import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/pages/widgets/app_text.dart';

class AppButtons extends StatelessWidget {

  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButtons({Key? key, 
    this.isIcon = false,
    this.text = "hi",
    this.icon,
    required this.color, 
    required this.backgroundColor, 
    required this.size, 
    required this.borderColor,
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: isIcon == false? AppText(text: text!, color: Colors.black,) : Icon(icon, color: color,),
    );
  }
}