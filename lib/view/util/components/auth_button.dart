import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:clickjobs/controller/auth_controller.dart';
import 'package:clickjobs/view/util/style/style.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  final String text;
  const Button({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 327.w,
      decoration: BoxDecoration(
          color: const Color(0xff0E9D57),
          borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: context.watch<AuthController>().isLoading
            ? LoadingAnimationWidget.fallingDot(
                color: Style.whiteColor, size: 35)
            : Text(
                text,
                style: Style.textStyleRegular2(textColor: Style.whiteColor),
              ),
      ),
    );
  }
}
