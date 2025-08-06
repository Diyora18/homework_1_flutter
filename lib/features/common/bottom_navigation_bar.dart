import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator>{
  int selectedIndex = 0;
  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 74, right: 74),
      child: Container(
        width: 281,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(33),
          color: Color(0xFFFD5D69),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/home.svg"),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/message.svg"),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/romb.svg"),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/profile.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
