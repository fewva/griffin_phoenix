import 'package:flutter/material.dart';
import 'package:griffin_phoenix/internal/utils/extensions/theme.dart';
import 'package:griffin_phoenix/presentation/views/lessons_view/lessons_view.dart';
import 'package:griffin_phoenix/theme/app_colors.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final List _pages = const [
    LessonsView(groupId: 12244),
    LessonsView(groupId: 12244),
  ];

  int _activeIndex = 0;

  void _changeIndex(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_activeIndex],
      bottomNavigationBar: Container(
        decoration: Theme.of(context).isDarkTheme
            ? null
            : BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor.withOpacity(0.3),
                    blurRadius: 18,
                  )
                ],
              ),
        child: BottomNavigationBar(
          onTap: _changeIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
