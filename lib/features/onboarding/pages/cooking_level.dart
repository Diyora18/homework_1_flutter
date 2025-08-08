import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson_1/features/onboarding/widgets/reusable_container_cooking.dart';

class CookingPage extends StatefulWidget {
  CookingPage({super.key});

  @override
  State<CookingPage> createState() => _CookingPageState();
}

class _CookingPageState extends State<CookingPage> {
  int selectedIndex = -1;

  final List<Map<String, String>> levels = [
    {
      'title': 'Novice',
      'description':
          'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.',
    },
    {
      'title': 'Intermediate',
      'description':
          'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque pulvinar diam.',
    },
    {
      'title': 'Advanced',
      'description':
          'Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.',
    },
    {
      'title': 'Professional',
      'description':
          'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C0F0D),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C0F0D),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/arrow.svg"),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Padding(
            padding: EdgeInsets.only(bottom: 45),
            child: Container(
              width: 230,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 65,
                  height: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xFFFD5D69),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "¿What is your cooking level?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 356,
                  child: Text(
                    "Please select you cooking level for a better recommendations.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: ReusableContainer(
                      title: levels[index]['title']!,
                      description: levels[index]['description']!,
                      isSelected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 48),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFFD5D69),
                  fixedSize: Size(207, 45),
                ),
                onPressed: () {
                  context.push("/cuisinePage");
                },
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
