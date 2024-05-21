import 'package:flutter/material.dart';
import 'package:grass_project/common/colors.dart';
import 'package:grass_project/common/text_styles.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomNavBarItems,
      type: BottomNavigationBarType.fixed,
      backgroundColor: CustomColors.whiteColor,
      elevation: 25,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      selectedItemColor: CustomColors.lightGreenButtonsColor,
      unselectedItemColor: CustomColors.greyButtonsColor,
      selectedLabelStyle: textStyleMyriadPro_400_10_green(),
      unselectedLabelStyle: textStyleMyriadPro_400_10_grey(),
      onTap: onTap,
    );
  }
}

final List<BottomNavigationBarItem> bottomNavBarItems = [
  // Главная
  BottomNavigationBarItem(
    icon: Image.asset(
      'assets/icons/shape.png',
      width: 30,
      height: 30,
    ),
    activeIcon: Image.asset(
      'assets/icons/shape_green.png',
      width: 30,
      height: 30,
    ),
    label: 'Главная',
  ),
  // Grass Coin
  BottomNavigationBarItem(
    icon: Image.asset(
      'assets/icons/grass_coin.png',
      width: 30,
      height: 30,
    ),
    activeIcon: Image.asset(
      'assets/icons/grass_coin_green.png',
      width: 30,
      height: 30,
    ),
    label: 'Grass Coin',
  ),
  // Новости
  BottomNavigationBarItem(
    icon: Image.asset(
      'assets/icons/mdi_newspaper.png',
      width: 30,
      height: 30,
    ),
    activeIcon: Image.asset(
      'assets/icons/mdi_newspaper_green.png',
      width: 30,
      height: 30,
    ),
    label: 'Новости',
  ),
  // Профиль
  BottomNavigationBarItem(
    icon: Image.asset(
      'assets/icons/user_circle.png',
      width: 30,
      height: 30,
    ),
    activeIcon: Image.asset(
      'assets/icons/user_circle_green.png',
      width: 30,
      height: 30,
    ),
    label: 'Профиль',
  ),
];
