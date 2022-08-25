import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';

class CloseButtons extends StatelessWidget {
  final VoidCallback onPressed;
  final bool stateLaoding;
  final String label;
  LinearGradient? primary;
  Border? side;
  final TextStyle style;
  Color? colorOfButton;

  CloseButtons(
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
          // border: Border.all(
          //   color:AppColors.activeColorOfPin,
          // ),
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
                Size(ScreenUtil().setWidth(174), ScreenUtil().setHeight(56))),
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
    
  }
}
