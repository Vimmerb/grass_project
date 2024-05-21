import 'package:flutter/material.dart';
import 'package:grass_project/common/colors.dart';

class HomeScreen extends StatelessWidget {
  final Widget body;
  final Widget bottomNavigationBar;
  final PreferredSizeWidget appBar;

  const HomeScreen({
    super.key,
    required this.body,
    required this.bottomNavigationBar,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Аппбар
      appBar: appBar,
      // Тело страницы
      body: Container(
        color: CustomColors.greenColorBackground,
        child: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 12.0),
            decoration: const BoxDecoration(
              color: CustomColors.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: body,
          ),
        ),
      ),
      // Нижнее меню
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
