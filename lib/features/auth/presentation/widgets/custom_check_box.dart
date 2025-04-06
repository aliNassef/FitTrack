import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          if (isChecked) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        });
        widget.onChanged(isChecked);
      },
      child: Container(
        width: 16.w,
        height: 16.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor, width: 0.8.w),
          borderRadius: BorderRadius.circular(3.r),
        ),
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: isChecked
                  ? Icon(
                      Icons.check,
                      color: AppColors.secondaryColor,
                      size: 16.sp,
                    )
                  : const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
