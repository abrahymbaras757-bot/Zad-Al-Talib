import 'package:flutter/material.dart';
import 'package:zad_altalib/shared/custom_text.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({
    super.key,
    required this.title,
    required this.nameTeacher,
    required this.sumpdf,
    required this.sumyoutube,
    required this.image,
  });
  final String title;
  final String nameTeacher;
  final int? sumpdf;
  final int? sumyoutube;
  final String image;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 2,
      shadowColor: Colors.blue,
      color: theme.colorScheme.outline,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.colorScheme.primary, width: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(
                    image,
                    //width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'المادة : $title',
                              size: 18,
                              color: theme.textTheme.titleMedium?.color,
                            ),

                            // remove icon
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.star,
                                color: theme.colorScheme.tertiary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 72.0),
                        child: CustomText(
                          text: 'المعلم : $nameTeacher',
                          size: 19,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: theme.colorScheme.tertiary.withOpacity(
                                0.30,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6.0,
                                vertical: 3.5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.description,
                                    color: theme.colorScheme.tertiary,
                                  ),
                                  SizedBox(width: 5),
                                  CustomText(
                                    text: 'pdf ${sumpdf ?? 0}',
                                    size: 16,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              // ignore: deprecated_member_use
                              color: theme.colorScheme.tertiary.withOpacity(
                                0.30,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6.0,
                                vertical: 3.5,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.ondemand_video,
                                    color: theme.colorScheme.tertiary,
                                  ),
                                  SizedBox(width: 5),
                                  CustomText(
                                    text: 'فيديو ${sumyoutube ?? 0}',
                                    size: 16,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
