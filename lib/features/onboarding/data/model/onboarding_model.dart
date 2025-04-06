import '../../../../core/utils/app_images.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;
  final double progress;
  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
    required this.progress,
  });
}

List<OnboardingModel> boardingItems = [
  OnboardingModel(
    progress: 1 / 4,
    image: AppImages.boarding1,
    title: 'Track Your Goal',
    description:
        'Don\'t worry if you have trouble determining your goals, We can help you determine your goals and track your goals',
  ),
  OnboardingModel(
    progress: 2 / 4,
    image: AppImages.boarding2,
    title: 'Get Burn',
    description:
        'Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever',
  ),
  OnboardingModel(
    progress: 3 / 4,
    image: AppImages.boarding3,
    title: 'Eat Well',
    description:
        'Let\'s start a healthy lifestyle with us, we can determine your meal and recipes every day. healthy eating is fun',
  ),
  OnboardingModel(
    progress: 4 / 4,
    image: AppImages.boarding4,
    title: 'Train Easy',
    description:
        'Let’s train! We’ve provided exercises that you can train with easily and smoothly at home or outdoors.',
  ),
];
