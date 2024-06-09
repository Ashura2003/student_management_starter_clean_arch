import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/batch/presentation/navigator/batch_view_navigator.dart';
import 'package:student_management_starter/features/courses/presentation/navigator/course_view_navigator.dart';
import 'package:student_management_starter/features/home/presentation/view/home_view.dart';

final homeViewNavigatorProvider = Provider((ref) => HomeViewNavigator());

class HomeViewNavigator with BatchViewRoute, CourseViewRoute{}

mixin HomeViewRoute {
  openHomeView() {
    NavigateRoute.popAndPushRoute(const HomeView());
  }
}
