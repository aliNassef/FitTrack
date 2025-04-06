import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';
import '../../data/model/goal_model.dart';
import 'goal_card_item.dart';

class GoalCardItemsList extends StatelessWidget {
  const GoalCardItemsList({
    super.key,
    required this.controller,
    this.onPageChanged,
  });
  final CarouselSliderController controller;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  static List<GoalModel> goalList = [
    GoalModel(
      title: 'Improve Shape',
      description:
          'I have a low amount of body fat and need / want to build more muscle',
      image: AppImages.register1,
    ),
    GoalModel(
      title: 'Lean & Tone',
      description:
          'I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way',
      image: AppImages.register2,
    ),
    GoalModel(
      title: 'Lose a Fat',
      description:
          'I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass',
      image: AppImages.register3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.65,
      width: double.infinity,
      child: CarouselSlider.builder(
        carouselController: controller,
        itemCount: goalList.length,
        options: CarouselOptions(
          onPageChanged: onPageChanged,
          height: context.height * 0.65,
          initialPage: 0,
          viewportFraction: 0.8,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
        ),
        itemBuilder: (context, index, realIndex) {
          return GoalCardItem(
            goalModel: goalList[index],
          );
        },
      ),
    );
  }
}
