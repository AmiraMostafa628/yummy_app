import 'package:flutter/material.dart';
import 'package:yummy_app/core/resources/color_manager.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key,
    this.borderRadius,
    required this.text,
    this.fontSize,
    this.onPressed, this.height,
    this.upperCase=true,
    this.fontWeight = FontWeight.bold,
    this.backGroundColor,
    this.fontColor, this.width});

  final BorderRadius? borderRadius;
  final String text;
  final double? fontSize;
  final Color? fontColor;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  final bool upperCase;
  final FontWeight fontWeight;
  final Color? backGroundColor;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??60,
      width: width??double.infinity,
      child: TextButton(
          onPressed:onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backGroundColor?? ColorManager.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius??BorderRadius.circular(10),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
             text,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: fontSize??17.0,
              color: fontColor??Colors.white,
            ),),
          )),
    );
  }
}


