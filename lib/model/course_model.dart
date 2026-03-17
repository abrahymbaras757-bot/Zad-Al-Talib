// كلاس جميع بيانات المادة
import 'package:zad_altalib/model/pdf_model.dart';
import 'package:zad_altalib/model/rating_model.dart';
import 'package:zad_altalib/model/youtube_model.dart';

class CourseModel {
  String id;
  String title;
  String description;
  String image;
  String teacherName;
  List<PdfModel> pdfs;
  List<YoutubeModel> videos;
  String teacherId;
  List<RatingModel> ratings;
  bool isFavorite;
  CourseModel({
    required this.title,
    required this.description,
    required this.image,

    this.isFavorite = false,
    required this.teacherId,
    required this.id,
    required this.teacherName,

    List<PdfModel>? pdfs,
    List<YoutubeModel>? videos,
    this.ratings = const [],
  }) : pdfs = pdfs ?? [],
       videos = videos ?? [];
}
