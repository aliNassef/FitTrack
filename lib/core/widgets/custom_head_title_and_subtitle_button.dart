import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class CustomHeadTittleAndSubTitleButton extends StatelessWidget {
  const CustomHeadTittleAndSubTitleButton({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.semiBold16,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            subtitle,
            style: AppStyles.medium12.copyWith(
              color: const Color(0xffA5A3B0),
            ),
          ),
        ),
      ],
    );
  }
}
