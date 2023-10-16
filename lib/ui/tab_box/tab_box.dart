import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paradoxs_coffee/ui/tab_box/home/home_screen.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/icons.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  int initialPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[initialPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: initialPage,
        onTap: (value) {
          setState(() {
            initialPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.home,
              colorFilter:
                  ColorFilter.mode(AppColors.c_8D8D8D, BlendMode.srcIn),
            ),
            label: "",
            activeIcon: SvgPicture.asset(AppIcons.home),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.favorite),
            label: "",
            activeIcon: SvgPicture.asset(
              AppIcons.favorite,
              colorFilter:
                  ColorFilter.mode(AppColors.c_C67C4E, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.cart),
            label: "",
            activeIcon: SvgPicture.asset(
              AppIcons.cart,
              colorFilter:
                  ColorFilter.mode(AppColors.c_C67C4E, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
