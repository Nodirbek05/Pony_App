import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBlueButton1 extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool stateLaoding;

  final LinearGradient? primary;
  final Widget child;
  final Border? side;

  final Color? colorOfButton;

  const AppBlueButton1(
      {Key? key,
      required this.onPressed,
      this.colorOfButton,
      required this.child,
      this.side,
      this.primary,
      this.stateLaoding = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: primary,
          color: colorOfButton,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
                Size(ScreenUtil().setWidth(328), ScreenUtil().setHeight(56))),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            // elevation: MaterialStateProperty.all(3),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: onPressed,
          child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: child),
        ),
      ),
    );
  }
}
