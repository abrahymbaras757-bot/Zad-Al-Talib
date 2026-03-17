import 'package:flutter/material.dart';
import 'package:zad_altalib/shared/custom_text.dart';

class CardSubject extends StatelessWidget {
  const CardSubject({
    super.key,
    required this.title,
    required this.icontitle,
    this.icon,
    this.text = '',
  });
  final String title;
  final String? text;
  final IconData icontitle;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      // ignore: deprecated_member_use
      color: Theme.of(context).colorScheme.surfaceVariant,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(5),
        ),
      ),
      elevation: 4,
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Center(
        child: ListTile(
          leading: Icon(
            icontitle,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          title: CustomText(
            text: title,
            size: 20,
            color: Theme.of(context).textTheme.titleMedium?.color,
          ),
          trailing: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              iconSize: 30,
              elevation: 0,
              // ignore: deprecated_member_use
              backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(icon, color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          subtitle: CustomText(
            text: text!,
            size: 17,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
      ),
    );
  }
}
