import 'package:apna_scorecard/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget customButton({
  String? text,
  Color? color,
  Color? iconColor,
  TextStyle? style,
  Function()? onTap,
  bool? outlineBtn = false,
  double borderRadius = 15.0,
  IconData? icon,
  double? iconSize = 24.0,
  double? width,
  double? height,
  Widget? child,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
  List<BoxShadow>? shadows,
}) {
  return InkWell(
    onTap: onTap,
    splashColor: Colors.transparent,
    child: Container(
      height: height ?? 6.h,
      width: width ?? 80.w,
      alignment: Alignment.center,
      padding: padding ?? EdgeInsets.all(2.w),
      margin: margin,
      decoration: BoxDecoration(
        color: outlineBtn == true
            ? Colors.transparent
            : color ?? AppColors.primary,
        border: Border.all(
          color: outlineBtn == true
              ? (color ?? AppColors.primaryDark)
              : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: shadows,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: iconColor ?? Colors.white,
              size: iconSize,
            ),
          if (icon != null && text != null) SizedBox(width: 4.w),
          if (text != null)
            Text(
              text,
              style: style ??
                  ThemeData.light()
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          if (child != null) child,
        ],
      ),
    ),
  );
}
