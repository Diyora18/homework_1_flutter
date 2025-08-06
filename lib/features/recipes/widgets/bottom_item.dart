import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson_1/features/recipes/pages/recipe_page.dart';

class BottomItem extends StatefulWidget {
  const BottomItem({
    super.key,
    required this.id,
    required this.title,
    required this.isSelected,
  });

  final int id;
  final String title;
  final bool isSelected;

  @override
  State<BottomItem> createState() => _BottomItemState();
}

class _BottomItemState extends State<BottomItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {

        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                RecipesPage(categoryId: widget.id, title: widget.title, selectedIndex: 0),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: widget.isSelected ? Color(0xFFFD5D69) : Colors.transparent,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.isSelected ? Colors.white : Color(0xFFFD5D69),
            ),
          ),
        ),
      ),
    );
  }
}
