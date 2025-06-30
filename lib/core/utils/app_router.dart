import '../../features/meal_planner/data/model/meal_category_model/meal_item_model.dart';
import '../../features/progress/data/model/progress_comparison_model.dart';
import '../../features/progress/presentation/views/compare_result_view.dart';
import '../../features/workout/data/model/workout_model.dart';

import '../../features/auth/data/model/signup_input_model.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/views/complete_profile_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/auth/presentation/views/signup_welcome_view.dart';
import '../../features/auth/presentation/views/sucess_registration_view.dart';
import '../../features/home/presentation/views/notification_view.dart';
import '../../features/layout/presentation/layout_view.dart';
import '../../features/meal_planner/presentation/view/category_meal_view.dart';
import '../../features/meal_planner/presentation/view/meal_details_view.dart';
import '../../features/meal_planner/presentation/view/meal_planner_view.dart';
import '../../features/meal_planner/presentation/view/meal_scheduale_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/onboarding/presentation/views/welcome_view.dart';
import '../../features/profile/presentation/views/statistics_view.dart';
import '../../features/store/presentation/views/checkout_view.dart';
import '../../features/store/presentation/views/store_view.dart';
import '../../features/workout/presentation/view/workout_details_view.dart';
import '../../features/workout/presentation/view/workout_excersises_view.dart'
    show WorkoutExerciseView;
import '../../features/workout/presentation/view/workout_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case CompleteProfileView.routeName:
      var signupInputModel = settings.arguments as SignupInputModel;
      return MaterialPageRoute(
        builder: (context) =>
            CompleteProfileView(signupInputModel: signupInputModel),
      );
    case OnboardingView.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnboardingView(),
      );
    case WelcomeView.routeName:
      return MaterialPageRoute(
        builder: (context) => const WelcomeView(),
      );
    case SignupWelcomeView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignupWelcomeView(),
      );
    case SuccessfulRegistrationView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SuccessfulRegistrationView(),
      );
    case LayoutView.routeName:
      return MaterialPageRoute(
        builder: (context) => const LayoutView(),
      );
    case NotificationView.routeName:
      return MaterialPageRoute(
        builder: (context) => const NotificationView(),
      );

    case WorkoutView.routeName:
      return MaterialPageRoute(
        builder: (context) => const WorkoutView(),
      );
    case WorkoutDetailsView.routeName:
      var workout = settings.arguments as WorkoutModel;
      return MaterialPageRoute(
        builder: (context) => WorkoutDetailsView(workout: workout),
      );
    case WorkoutExerciseView.routeName:
      final id = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => WorkoutExerciseView(
          id: id,
        ),
      );
    case MealPlannerView.routeName:
      return MaterialPageRoute(
        builder: (context) => const MealPlannerView(),
      );
    case CompareResultView.routeName:
      final progressComparisonModel =
          settings.arguments as ProgressComparisonModel;
      return MaterialPageRoute(
        builder: (context) => CompareResultView(
          comparisonModel: progressComparisonModel,
        ),
      );
    case CategoryMealView.routeName:
      var id = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => CategoryMealView(
          id: id,
        ),
      );
    case MealDetailsView.routeName:
      var meal = settings.arguments as MealItemModel;
      return MaterialPageRoute(
        builder: (context) => MealDetailsView(
          meal: meal,
        ),
      );
    case MealSchedualeView.routeName:
      return MaterialPageRoute(
        builder: (context) => const MealSchedualeView(),
      );
    case StatisticsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const StatisticsView(),
      );
    case CheckoutView.routeName:
      var productDetails = settings.arguments as Map<String, dynamic>?;
      return MaterialPageRoute(
        builder: (context) => CheckoutView(
          productDetails: productDetails,
        ),
      );
    case StoreView.routeName:
      return MaterialPageRoute(
        builder: (context) => const StoreView(),
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

PageRouteBuilder<dynamic> goToPageWithAnimation(
  Widget page,
) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Durations.medium2,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
