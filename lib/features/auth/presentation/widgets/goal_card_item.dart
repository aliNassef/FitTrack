import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/model/goal_model.dart';

class GoalCardItem extends StatelessWidget {
  const GoalCardItem({
    super.key,
    required this.goalModel,
  });
  final GoalModel goalModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppGradients.pinkGradient,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          const VerticalSpace(40),
          Image.asset(
            goalModel.image,
            height: context.height * 0.34,
            width: context.width,
          ),
          const VerticalSpace(20),
          Text(
            goalModel.title,
            style: AppStyles.semiBold14.copyWith(
              color: Colors.white,
            ),
          ),
          const Divider(
            indent: 90,
            endIndent: 90,
            color: Color(0xffF7F8F8),
          ),
          const VerticalSpace(20),
          Expanded(
            child: Text(
              goalModel.description,
              style: AppStyles.regular12.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ).withHorizontalPadding(20),
    );
  }
}
