import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/common/my_snackbar.dart';
import 'package:student_management_starter/features/courses/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/courses/domain/usecases/course_usecase.dart';
import 'package:student_management_starter/features/courses/presentation/state/course_state.dart';

final courseViewModelProvider =
    StateNotifierProvider<CourseViewModel, CourseState>(
  (ref) {
    return CourseViewModel(ref.read(courseUseCaseProvider));
  },
);

class CourseViewModel extends StateNotifier<CourseState> {
  final CourseUsecase courseUsecase;

  CourseViewModel(this.courseUsecase) : super(CourseState.initial()) {
    getAllCourses();
  }

  addCourse(CourseEntity course) async {
    state = state.copyWith(isLoading: true);
    var data = await courseUsecase.addCourse(course);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: "Course added Successfully");
      },
    );

    getAllCourses();
  }

  getAllCourses() async {
    state = state.copyWith(isLoading: true);
    var data = await courseUsecase.getAllCourses();

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state = state.copyWith(isLoading: false, lstCourses: r, error: null);
      },
    );
  }
}
