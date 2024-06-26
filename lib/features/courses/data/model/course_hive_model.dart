import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management_starter/app/constants/hive_table_constant.dart';
import 'package:student_management_starter/features/courses/domain/entity/course_entity.dart';
import 'package:uuid/uuid.dart';

part 'course_hive_model.g.dart';

final courseHiveModelProvider = Provider(
  (ref) => CourseHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHiveModel {
  @HiveField(0)
  final String? courseId;
  @HiveField(1)
  final String courseName;

  CourseHiveModel({
    String? courseId,
    required this.courseName,
  }) : courseId = courseId ?? const Uuid().v4();

  CourseHiveModel.empty()
      : courseId = '',
        courseName = '';

  CourseEntity toEntity() => CourseEntity(
        courseId: courseId,
        courseName: courseName,
      );

  CourseHiveModel fromEntity(CourseEntity entity) => CourseHiveModel(
        courseId: entity.courseId,
        courseName: entity.courseName,
      );

  List<CourseEntity> toEntityList(List<CourseHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
