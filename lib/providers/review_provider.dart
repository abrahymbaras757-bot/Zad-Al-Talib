import 'package:flutter/material.dart';
import 'package:zad_altalib/data/app_reviews.dart';
import 'package:zad_altalib/model/review_model.dart';

class ReviewProvider extends ChangeNotifier {
  final List<ReviewModel> _reviews = appReviews;
  List<ReviewModel> get reviews => _reviews;

  // عدد التقييمات لمادة معينة
  List<ReviewModel> getCourseReviews(String courseId) {
    return _reviews
        .where((review) => review.courseId == courseId && review.isApproved)
        .toList();
  }

  // اضافة تقييم
  void addReview(ReviewModel review) {
    final existingReviewIndex = _reviews.indexWhere(
      (r) => r.userId == review.userId && r.courseId == review.courseId,
    );

    if (existingReviewIndex != -1) {
      // تحديث التقييم القديم
      _reviews[existingReviewIndex] = review;
    } else {
      // إضافة تقييم جديد
      _reviews.add(review);
    }

    notifyListeners();
  }

  // حذف تقييم
  void deleteReview(String id) {
    _reviews.removeWhere((review) => review.id == id);
    notifyListeners();
  }

  // اخفا و اظهار تقييم
  void toggleReview(String id) {
    final review = _reviews.firstWhere((r) => r.id == id);
    review.isApproved = !review.isApproved;
    notifyListeners();
  }

  // حساب متوسط التقييمات لمادة معينة
  double getCourseAverageRating(String courseId) {
    final courseReviews = _reviews
        .where((review) => review.courseId == courseId && review.isApproved)
        .toList();

    if (courseReviews.isEmpty) return 0;

    final total = courseReviews.fold(0.0, (sum, r) => sum + r.rating);

    return total / courseReviews.length;
  }

  // التحقق من التقييم اذا وجد من قبل المستخدم
  ReviewModel? getUserReview(String userId, String courseId) {
    try {
      return _reviews.firstWhere(
        (r) => r.userId == userId && r.courseId == courseId && r.isApproved,
      );
    } catch (e) {
      return null;
    }
  }
}
