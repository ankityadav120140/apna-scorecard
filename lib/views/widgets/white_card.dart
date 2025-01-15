import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/app_theme.dart';

Widget whiteCard({
  List<Widget>? children,
  Widget? child,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
  Color? color,
  List<BoxShadow>? shadows,
  Decoration? decoration,
  Function()? onTap,
  double? height,
  double? width,
  MainAxisAlignment? mainAxisAlignment,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width ?? 100.w,
      height: height,
      margin: margin,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: decoration ??
          ShapeDecoration(
            color: color ?? AppColors.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: shadows ??
                [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: children ?? [child ?? const SizedBox()],
      ),
    ),
  );
}
