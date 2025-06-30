import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/model/step_model.dart';

class StepItem extends StatelessWidget {
  final StepModel stepModel;
  final bool isLast;
  const StepItem({
    super.key,
    required this.stepModel,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: true
                ? AppGradients.pinkGradient
                // ignore: dead_code
                : [
                    Color(0xffA5A3B0),
                    Color(0xffA5A3B0),
                  ],
          ).createShader(bounds),
          child: SizedBox(
            width: 15.w,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '0${stepModel.stepNumber}',
                style: AppStyles.regular14.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const HorizontalSpace(13),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: true
                      ? AppGradients.pinkGradient
                      // ignore: dead_code
                      : [
                          Color(0xffA5A3B0),
                          Color(0xffA5A3B0),
                        ],
                ),
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Container(
                width: 15.w,
                height: 15.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: AppGradients.pinkGradient,
                  ),
                ),
              ),
            ),
            if (!isLast)
              DottedBorder(
                // ignore: dead_code
                color: true ? Colors.purple : const Color(0xffA5A3B0),
                strokeWidth: 2,
                dashPattern: const [4, 4],
                customPath: (size) {
                  return Path()
                    ..moveTo(size.width / 2, 0)
                    ..lineTo(size.width / 2, size.height);
                },
                child: const SizedBox(
                  width: 0,
                  height: 120,
                ),
              ),
          ],
        ),
        const HorizontalSpace(15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stepModel.title.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const VerticalSpace(8),
              Text(
                stepModel.instruction,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const VerticalSpace(16),
            ],
          ),
        ),
      ],
    );
  }
}
