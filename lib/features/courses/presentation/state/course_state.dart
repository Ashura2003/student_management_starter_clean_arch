import 'package:student_management_starter/features/courses/domain/entity/course_entity.dart';

class CourseState {
  final List<CourseEntity> lstCourses;
  final bool isLoading;
  final String? error;

  CourseState({
    required this.lstCourses,
    required this.isLoading,
    this.error,
  });

  factory CourseState.initial() {
    return CourseState(
      lstCourses: [],
      isLoading: false,
      error: null,
    );
  }

  CourseState copyWith({
    List<CourseEntity>? lstCourses,
    bool? isLoading,
    String? error,
  }) {
    return CourseState(
      lstCourses: lstCourses ?? this.lstCourses,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  CourseState deleleCourse(CourseState course, int index) {
    return CourseState(
      lstCourses: CourseEntity != null ? [lstCourses[index]] :lstCourses ..removeAt(index),
      isLoading: course.isLoading,
      error: course.error,
      
    );
  }
}
