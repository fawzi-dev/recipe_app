import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:recipe_app/models/grocery_item.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem item;

  final Function(bool?)? onComplete;

  final TextDecoration textDecoration;

  GroceryTile({Key? key, required this.item, this.onComplete})
      : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Container(
              width: 10,
              color: item.color,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: GoogleFonts.lato(
                      decoration: textDecoration,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                buildDate(),
                buildImportance()
              ],
            )
          ],
        ),
        Row(
          children: [
            Text(
              '${item.quantity}',
              style: GoogleFonts.lato(
                decoration: textDecoration,
                fontSize: 18),
            ),
            buildCheckbox()
          ],
        )
      ]),
    );
  }

  // TODO: Add BuildImportance()
  Widget buildImportance() {
    if (item.importance == Importance.low) {
      return Text(
        'Low',
        style: GoogleFonts.lato(decoration: textDecoration),
      );
    } else if (item.importance == Importance.medium) {
      return Text(
        'Medium',
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w800, decoration: textDecoration),
      );
    } else if (item.importance == Importance.high) {
      return Text(
        'High',
        style: GoogleFonts.lato(
            color: Colors.red,
            fontWeight: FontWeight.w900,
            decoration: textDecoration),
      );
    } else {
      throw Exception('This importance type does not exist');
    }
  }

  // TODO: Add buildDate()
  Widget buildDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(item.dateTime);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  // TODO: Add buildCheckbox()
  Widget buildCheckbox() {
    return Checkbox(value: item.isComplete, onChanged: onComplete);
  }
}
