import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/view_model/course_toc_view_model.dart';

class TocPlayerViewModel {
  String getEnrolledCourseId(BuildContext context, String id) {
    List<Course> enrolledCourses =
        Provider.of<CourseTocViewModel>(context, listen: false).enrollmentList;

    for (final course in enrolledCourses) {
      final languageEntries = course.languageMap.languages.entries;
      if (course.id == id) {
        return id;
      } else {
        for (final entry in languageEntries) {
          if (entry.value.id == id) {
            return course.id;
          }
        }
      }
    }
    return '';
  }
}
