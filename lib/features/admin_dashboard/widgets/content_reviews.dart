import 'package:flutter/material.dart';
import 'package:zad_altalib/shared/custom_text.dart';

class ContentReviews extends StatefulWidget {
  const ContentReviews({
    super.key,
    required this.selectedIndex,
    required this.contentReviews,
  });
  final int selectedIndex;
  final List contentReviews;

  @override
  State<ContentReviews> createState() => _ContentReviewsState();
}

class _ContentReviewsState extends State<ContentReviews> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.contentReviews.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? Theme.of(context).colorScheme.tertiary
                    : Color(0xff344955),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 27, vertical: 15),
              child: CustomText(
                text: widget.contentReviews[index],
                size: 16,
                color: selectedIndex == index
                    ? Theme.of(context).colorScheme.inversePrimary
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          );
        }),
      ),
    );
  }
}
