import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ReadMoreText({
    super.key,
    required this.text,
    this.maxLines = 4,
  });

  @override
  ReadMoreTextState createState() => ReadMoreTextState();
}

class ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.text;
    final maxLines = widget.maxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          maxLines: isExpanded ? null : maxLines,
          overflow: isExpanded ? null : TextOverflow.ellipsis,
          style: AppStyles.medium12.copyWith(
            color: AppColors.greyLighterColor,
          ),
        ),
        if (text.isNotEmpty)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color(0xff00ff66),
                  Color(0xff00f0ff),
                ],
              ).createShader(bounds),
              child: Text(
                isExpanded ? 'Read Less' : 'Read More....',
                style: AppStyles.regular12.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
