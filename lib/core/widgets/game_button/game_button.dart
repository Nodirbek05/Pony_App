import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';

class StartGameButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool stateLaoding;
  final String label;
  LinearGradient? primary;
  Border? side;
  final TextStyle style;
  Color? colorOfButton;

  StartGameButton(
      {Key? key,
      required this.onPressed,
      this.colorOfButton,
      required this.style,
      this.side,
      required this.label,
      this.primary,
      this.stateLaoding = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
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
                Size(ScreenUtil().setWidth(140), ScreenUtil().setHeight(40))),
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
            child: Text(
              label,
              style: style,
            ),
          ),
        ),
      ),
    );
    //  GestureDetector(
    //   onTap: onPressed,
    //   child: Container(
    //     alignment: Alignment.center,
    //     height: 56.h,
    //     width: 328.w,
    //     padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 11.h),

    //     decoration: BoxDecoration(
    //       color: colorOfButton,
    //       border: side,
    //       gradient: primary,
    //       borderRadius: BorderRadius.circular(10.r),
    //     ),
    //     child: !stateLaoding
    //         ? Text(
    //             label,
    //             style: style,
    //           )
    //         : const CircularProgressIndicator(color: Colors.white),
    //   ),
    // );
  }
}
