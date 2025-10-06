import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toc_module/toc/model/review_rating.dart';
import 'package:toc_module/toc/services/toc_services.dart';

class ReviewRatingRepository with ChangeNotifier {
  final TocServices _tocServices = TocServices();
  OverallRating? _courseRating;

  OverallRating? get courseRating => _courseRating;

  Future<OverallRating> getCourseReviewSummary(
      {required String courseId, required String primaryCategory}) async {
    try {
      final response = await _tocServices.getCourseReviewSummery(
          id: courseId, primaryCategory: primaryCategory);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final contents = data['result']['response'];
        _courseRating = OverallRating.fromJson(contents);
        notifyListeners();
        return _courseRating!;
      } else {
        throw Exception(
            'Failed to load course review summary. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching course review summary for $courseId: $e');
      throw Exception('Failed to load course review summary: $e');
    }
  }

  Future<List<TopReview>> getCourseReview(
      {required String courseId,
      required String primaryCategory,
      required int limit}) async {
    try {
      final response = await _tocServices.getCourseReview(
          courseId: courseId, primaryCategory: primaryCategory, limit: limit);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final contents = data['result']['response'];
        final List<dynamic> reviewsJson = contents ?? [];
        return reviewsJson
            .map((reviewJson) => TopReview.fromJson(reviewJson))
            .toList();
      } else {
        throw Exception(
            'Failed to load course reviews. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching course reviews for $courseId: $e');
      throw Exception('Failed to load course reviews: $e');
    }
  }

  Future<TopReview?> getYourRating({
    required String courseId,
    required String primaryCategory,
  }) async {
    try {
      final response = await _tocServices.getYourReviewRating(
        id: courseId,
        primaryCategory: primaryCategory,
      );

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to load your rating. Status code: ${response.statusCode}',
        );
      }

      final data = jsonDecode(response.body);
      final contents = data['result']?['content'];

      if (contents is List && contents.isNotEmpty) {
        return TopReview.fromJson(contents[0]);
      }

      return null;
    } catch (e) {
      debugPrint('Error fetching your rating for $courseId: $e');
      throw Exception('Failed to load your rating');
    }
  }

  Future<bool> postCourseReview({
    required String courseId,
    required String primaryCategory,
    required double rating,
    required String comment,
  }) async {
    try {
      final response = await _tocServices.postCourseReview(
          courseId: courseId,
          primaryCategory: primaryCategory,
          rating: rating,
          comment: comment);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('Error posting course review for $courseId: $e');
      return false;
    }
  }
}
