import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomGradientSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomGradientSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: value
            ? const LinearGradient(
                colors: [
                  Color(0xff00F0FF),
                  Color(0xff00FF66),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        color: value ? null : Colors.white,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: Colors.transparent,
        activeColor: Colors.white,
        inactiveThumbColor: AppColors.greenLightColor,
        inactiveTrackColor: Colors.transparent,
      ),
    );
  }
}
