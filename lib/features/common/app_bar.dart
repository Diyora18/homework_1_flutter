import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson_1/features/common/app_bar_bottom.dart';
import 'package:lesson_1/features/recipes/pages/categories_page.dart';
import 'package:lesson_1/features/recipes/widgets/bottom_item.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final int selectedIndex;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
    required this.selectedIndex,
  });

  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF1C0F0D),
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoriesPage()),
          );
        },
        icon: SvgPicture.asset("assets/arrow.svg"),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFD5D69),
        ),
      ),
      actions: actions,
      bottom: RecipeAppBarBottom(),
    );
  }
}
