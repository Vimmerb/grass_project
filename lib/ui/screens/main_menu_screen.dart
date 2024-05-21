import 'package:flutter/material.dart';
import 'package:grass_project/common/colors.dart';
import 'package:grass_project/common/text_styles.dart';
import 'package:grass_project/ui/screens/home_screen.dart';
import 'package:grass_project/ui/widgets/bottom_navigation_bar_widget.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      appBar: const MainMenuAppBar(),
      body: MainMenuGridWidget(),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: 0,
        onTap: (index) {
          // Обработка нажатия
        },
      ),
    );
  }
}

class MainMenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainMenuAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset(
        'assets/icons/c_photo_small.png',
        width: 34,
        height: 34,
      ),
      title: Row(
        children: [
          Text(
            'Александр',
            style: textStyleMyriadPro_600_20_white(),
          ),
          IconButton(
            onPressed: () {
              // Обработка нажатия
            },
            icon: Image.asset(
              'assets/icons/arrow_right.png',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      backgroundColor: CustomColors.greenColorBackground,
      actions: [
        IconButton(
          onPressed: () {
            // Обработка нажатия
          },
          icon: Image.asset(
            'assets/icons/search.png',
            width: 34,
            height: 34,
          ),
        ),
      ],
    );
  }
}

class MainMenuGridWidget extends StatelessWidget {
  const MainMenuGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 165 / 114,
            ),
            itemCount: menuElements.length,
            itemBuilder: (BuildContext context, int index) {
              return MainMenuElementWidget(
                data: menuElements[index],
                onTap: () {
                  // Обработка нажатия
                  print('Нажал на ${menuElements[index].text}');
                },
              );
            },
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              // Обработка нажатия
              print('Нажал на ${'Grass Википедия'}');
            },
            child: Container(
              width: double.infinity,
              height: 114,
              decoration: BoxDecoration(
                color: CustomColors.greenMenuColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Text(
                      'Grass Википедия',
                      style: textStyleMyriadPro_600_16_white(),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/icons/books.png',
                      width: 104,
                      height: 104,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainMenuElementModel {
  final String text;
  final Color color;
  final String image;
  final String path;

  MainMenuElementModel({
    required this.text,
    required this.color,
    required this.image,
    required this.path,
  });
}

List<MainMenuElementModel> menuElements = [
  MainMenuElementModel(
    text: 'Справки\nи заявления',
    color: CustomColors.turquoiseMenuColor,
    image: 'assets/icons/note.png',
    path: '',
  ),
  MainMenuElementModel(
    text: 'Бережливое\nпроизводство',
    color: CustomColors.blueMenuColor,
    image: 'assets/icons/thumbs_up.png',
    path: '',
  ),
  MainMenuElementModel(
    text: 'График\nотпусков',
    color: CustomColors.purpleMenuColor,
    image: 'assets/icons/airplane_tilt.png',
    path: '',
  ),
  MainMenuElementModel(
    text: 'Командировки',
    color: CustomColors.yellowMenuColor,
    image: 'assets/icons/globe_hemisphere_east.png',
    path: '',
  ),
  MainMenuElementModel(
    text: 'Расписание\nавтобусов',
    color: CustomColors.greyBlueMenuColor,
    image: 'assets/icons/bus.png',
    path: '',
  ),
  MainMenuElementModel(
    text: 'Режим работы',
    color: CustomColors.lightBlueMenuColor,
    image: 'assets/icons/alarm.png',
    path: '',
  ),
  MainMenuElementModel(
    text: 'Структура\nорганизации',
    color: CustomColors.lightOrangeMenuColor,
    image: 'assets/icons/tree_structure.png',
    path: '',
  ),
  MainMenuElementModel(
    text: 'Интерактивная\nкарта помещений',
    color: CustomColors.orangeMenuColor,
    image: 'assets/icons/map_trifold.png',
    path: '',
  ),
];

class MainMenuElementWidget extends StatelessWidget {
  final MainMenuElementModel data;
  final VoidCallback onTap;

  const MainMenuElementWidget({
    super.key,
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 165,
        height: 114,
        decoration: BoxDecoration(
          color: data.color,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: Text(
                data.text,
                style: textStyleMyriadPro_600_16_white(),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                data.image,
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
