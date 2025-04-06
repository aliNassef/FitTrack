import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtension on Widget {
  Padding withHorizontalPadding(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding.w),
        child: this,
      );

  Padding withVerticalPadding(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding.h),
        child: this,
      );

  Padding withAllPadding(double padding) => Padding(
        padding: EdgeInsets.all(padding.r),
        child: this,
      );
}
