import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/courses/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/courses/presentation/viewmodel/course_view_model.dart';

class CourseView extends ConsumerStatefulWidget {
  const CourseView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CourseViewState();
}

class _CourseViewState extends ConsumerState<CourseView> {
  final _courseNameController = TextEditingController();

  final gap = const SizedBox(height: 20);
  @override
  Widget build(BuildContext context) {
    var courseState = ref.watch(courseViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                "Add Course",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              gap,
              TextFormField(
                controller: _courseNameController,
                decoration: const InputDecoration(
                  labelText: "Course Name",
                  border: OutlineInputBorder(),
                ),
              ),
              gap,
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ref
                        .read(courseViewModelProvider.notifier)
                        .addCourse(CourseEntity(
                          courseName: _courseNameController.text,
                        ));
                  },
                  child: const Text("Add Course"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "List of Courses",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              gap,
              if (courseState.isLoading) ...{
                const Center(
                  child: CircularProgressIndicator(),
                ),
              } else if (courseState.error != null) ...{
                Text(
                  courseState.error.toString(),
                ),
              } else if (courseState.lstCourses.isEmpty) ...{
                const Text("No Courses Found"),
              } else ...{
                Expanded(
                  child: ListView.builder(
                    itemCount: courseState.lstCourses.length,
                    itemBuilder: (context, index) {
                      var course = courseState.lstCourses[index];
                      return ListTile(
                        title: Text(course.courseName),
                        subtitle: Text(course.courseId ?? ""),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {},
                        ),
                      );
                    },
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}
