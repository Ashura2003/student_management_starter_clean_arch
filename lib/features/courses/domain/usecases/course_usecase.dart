import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/courses/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/courses/domain/repository/course_domain_repository.dart';

final courseUseCaseProvider = Provider<CourseUsecase>(
  (ref) => CourseUsecase(
    courseRepository: ref.read(courseRepositoryProvider),
  ),
);

class CourseUsecase {
  final ICourseRepository courseRepository;

  CourseUsecase({required this.courseRepository});

  // Adding a course
  Future<Either<Failure, bool>> addCourse(CourseEntity course) {
    return courseRepository.addCourse(course);
  }

  // Getting all courses
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    return courseRepository.getAllCourses();
  }
}
