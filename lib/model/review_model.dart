class ReviewModel {
  final String id;
  final String userId;
  final String courseId;
  final String comment;
  final int rating;
  final DateTime date;
  bool isApproved;
  ReviewModel({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.comment,
    required this.rating,
    required this.date,
    this.isApproved = true,
  });
}
