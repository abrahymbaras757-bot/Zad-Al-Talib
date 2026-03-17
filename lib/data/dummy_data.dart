import 'package:zad_altalib/model/course_model.dart';
import 'package:zad_altalib/model/pdf_model.dart';
import 'package:zad_altalib/model/youtube_model.dart';

// بيانات المواد
final List<CourseModel> courses = [
  CourseModel(
    id: '1',
    teacherId: '2',
    teacherName: 'عبدالله',
    title: "Flutter",
    description: "تعلم فلاتر",
    image: "assets/flutter.png",
    pdfs: [
      PdfModel(
        title: 'ملزمة تاسيس Dart and Flutter',
        filePath: 'assets/pdfs/Emailing Noor-Book.com flutter.pdf',
      ),
      PdfModel(title: 'تجريبي', filePath: 'assets/pdfs/Gemini.bkn.pdf'),
      PdfModel(
        title: ' شرح  Flutter',
        filePath: 'assets/pdfs/Presentation6.pdf',
      ),
    ],
    videos: [
      YoutubeModel(
        title: 'شرح Flutter',
        link: 'https://youtu.be/lb41ehf0Y4A?si=d5BasnCnk46qBLnV',
      ),
      YoutubeModel(
        title: 'Flutter Tutorial',
        link: 'https://youtu.be/LAPWBRlufHg?si=S5rYDrQh_uL_RdbJ',
      ),
    ],
  ),
  CourseModel(
    id: '2',
    teacherId: '2',
    teacherName: 'عبدالله',
    title: "Dart",
    description: "تعلم دارت",
    image: "assets/dart.png",
    pdfs: [
      PdfModel(
        title: 'ملزمة تاسيس Dart and Flutter',
        filePath: 'assets/pdfs/Emailing Noor-Book.com flutter.pdf',
      ),
      PdfModel(title: 'تجريبي', filePath: 'assets/pdfs/Gemini.bkn.pdf'),
      PdfModel(
        title: ' شرح  Flutter',
        filePath: 'assets/pdfs/Presentation6.pdf',
      ),
    ],

    videos: [
      YoutubeModel(
        title: 'شرح Dart',
        link: 'https://youtu.be/lb41ehf0Y4A?si=d5BasnCnk46qBLnV',
      ),
      YoutubeModel(
        title: 'Flutter Tutorial',
        link: 'https://youtu.be/LAPWBRlufHg?si=S5rYDrQh_uL_RdbJ',
      ),
    ],
  ),
  CourseModel(
    id: '3',
    teacherId: '3',
    teacherName: 'محمد',
    title: "Python",
    description: "تعلم بايثون",
    image: "assets/python.png",
    pdfs: [
      PdfModel(title: 'عشوائي', filePath: 'assets/pdfs/Gemini.bkn.pdf'),
      PdfModel(title: 'تجريبي', filePath: 'State Management.pdf'),
    ],
    videos: [
      YoutubeModel(
        title: 'شرح اساسيات Python',
        link: 'https://youtu.be/mvZHDpCHphk?si=2Z69tM0ln5CqKLRe',
      ),
      YoutubeModel(
        title: 'Python Tutorial',
        link: 'https://youtu.be/02a5T6ktx8M?si=Kpn_x5ZomlZzqUgp',
      ),
    ],
  ),
  CourseModel(
    id: '4',
    teacherId: '3',
    teacherName: 'محمد',
    title: "Java",
    description: "تعلم جافا",
    image: "assets/java.png",
    pdfs: [
      PdfModel(title: 'عشوائي', filePath: 'assets/pdfs/Gemini.bkn.pdf'),
      PdfModel(title: 'تجريبي', filePath: 'State Management.pdf'),
    ],
    videos: [
      YoutubeModel(
        title: 'شرح Java',
        link: 'https://youtu.be/mNvJipMTKSM?si=xEGkED686vnx1kYF',
      ),
      YoutubeModel(
        title: 'Java Tutorial',
        link: 'https://youtu.be/mY8yxPP9_AE?si=Dz9-iC8pnH-aE7A4',
      ),
    ],
  ),
  CourseModel(
    id: '5',
    teacherId: '3',
    teacherName: 'محمد',
    title: "C++",
    description: "تعلم C++",
    image: "assets/c++.jpg",
    pdfs: [
      PdfModel(title: 'عشوائي', filePath: 'assets/pdfs/Gemini.bkn.pdf'),
      PdfModel(title: 'تجريبي', filePath: 'State Management.pdf'),
    ],
    videos: [
      YoutubeModel(
        title: 'شرح C++',
        link: 'https://youtu.be/XDuWyYxksXU?si=-Xh-wd3QvfMXL4bp',
      ),
      YoutubeModel(
        title: 'C++ Tutorial',
        link: 'https://youtu.be/FVV4kTy0dJg?si=GOeepKX2R7wVfRNi',
      ),
    ],
  ),
  CourseModel(
    id: '6',
    teacherId: '4',
    teacherName: 'خالد',
    title: "React",
    description: "تعلم React",
    image: "assets/react.png",
    pdfs: [
      PdfModel(title: 'عشوائي', filePath: 'assets/pdfs/Gemini.bkn.pdf'),
      PdfModel(title: 'تجريبي', filePath: 'State Management.pdf'),
    ],
    videos: [
      YoutubeModel(
        title: 'شرح React',
        link: 'https://youtu.be/fJSFus0pxZI?si=yPkUiMFxmgbACaDc',
      ),
      YoutubeModel(
        title: 'React Tutorial',
        link: 'https://youtu.be/s2skans2dP4?si=CrOEurIx7e4uaDEV',
      ),
    ],
  ),
  CourseModel(
    id: '7',
    teacherId: '4',
    teacherName: 'خالد',
    title: "NodeJS",
    description: "تعلم NodeJS",
    image: "assets/nodejs.png",
    pdfs: [
      PdfModel(title: 'عشوائي', filePath: 'assets/pdfs/Gemini.bkn.pdf'),
      PdfModel(title: 'تجريبي', filePath: 'State Management.pdf'),
    ],
    videos: [
      YoutubeModel(
        title: 'شرح NodeJS',
        link: 'https://youtu.be/IXLhZ9cFS0E?si=VNwq7eLig0y3p0_o',
      ),
      YoutubeModel(
        title: 'NodeJS Tutorial',
        link: 'https://youtu.be/9609FNDOKqY?si=pg850UCNhBZKqgX3',
      ),
    ],
  ),
];
