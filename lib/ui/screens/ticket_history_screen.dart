import 'package:flutter/material.dart';
import 'package:grass_project/common/colors.dart';
import 'package:grass_project/common/text_styles.dart';
import 'package:grass_project/ui/screens/home_screen.dart';
import 'package:grass_project/ui/widgets/bottom_navigation_bar_widget.dart';

class TicketHistoryScreen extends StatelessWidget {
  const TicketHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      appBar: const TicketHistoryAppBar(),
      body: const TicketHistoryWidget(),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: 0,
        onTap: (index) {
          // Обработка нажатия
        },
      ),
    );
  }
}

class TicketHistoryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const TicketHistoryAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Image.asset(
          'assets/icons/arrow_left.png',
          width: 24,
          height: 24,
        ),
      ),
      title: Text(
        'Справки и заявления',
        style: textStyleMyriadPro_600_20_white(),
      ),
      backgroundColor: CustomColors.greenColorBackground,
    );
  }
}

class TicketHistoryWidget extends StatelessWidget {
  const TicketHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleScreenTextWidget(),
          SizedBox(height: 16),
          ConteinersWidget(),
          SizedBox(height: 16),
          ButtonWidget(),
        ],
      ),
    );
  }
}

class ConteinersWidget extends StatelessWidget {
  const ConteinersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < 5; i++)
              GestureDetector(
                onTap: () {
                  // При нажатии отображаем диалог
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const CustomDialog();
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: CustomColors.whiteColor,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class TitleScreenTextWidget extends StatelessWidget {
  const TitleScreenTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'История заявок',
      style: textStyleMyriadPro_600_20_black(),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Обработка нажатия
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.greenColorBackground,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          minimumSize: const Size(double.infinity, 0),
        ),
        child: Text(
          'СОЗДАТЬ ЗАЯВКУ',
          style: textStyleMyriadPro_600_14_white(),
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.whiteColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(24.0),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            TitleDialogWidget(),
            SizedBox(height: 32),
            // Количество дней отпуска
            DaysTitleWidget(),
            SizedBox(height: 8),
            DaysSumWidget(),
            SizedBox(height: 32),
            // Даты отпуска
            DatesTitleWidget(),
            SizedBox(height: 8),
            DatesWidget(),
            SizedBox(height: 32),
            // Ввод кода
            CodeTitleWidget(),
            SizedBox(height: 8),
            CodeTextFormFieldWidget(),
            SizedBox(height: 32),
            // Кнопка "Отмена"
            CancelButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class TitleDialogWidget extends StatelessWidget {
  const TitleDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Заявление на отпуск',
          style: textStyleMyriadPro_400_18_black(),
        ),
        // Контейнер со статусом
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: CustomColors.lightGreenStatusColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            'Выпущен приказ',
            style: textStyleMyriadPro_600_12_green(),
          ),
        ),
      ],
    );
  }
}

class DaysTitleWidget extends StatelessWidget {
  const DaysTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Количество календарных дней отпуска',
      style: textStyleMyriadPro_400_14_grey(),
    );
  }
}

class DaysSumWidget extends StatelessWidget {
  const DaysSumWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '28',
      style: textStyleMyriadPro_400_16_black(),
    );
  }
}

//
class DatesTitleWidget extends StatelessWidget {
  const DatesTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Даты отпуска',
      style: textStyleMyriadPro_400_14_grey(),
    );
  }
}

class DatesWidget extends StatelessWidget {
  const DatesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '26.09.2022 - 24.10.2022',
      style: textStyleMyriadPro_400_16_black(),
    );
  }
}

//
class CodeTitleWidget extends StatelessWidget {
  const CodeTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Введите шестизначный код',
      style: textStyleMyriadPro_400_14_grey(),
    );
  }
}

class CodeTextFormFieldWidget extends StatelessWidget {
  const CodeTextFormFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < 6; i++)
          Container(
            width: 36,
            height: 36,
            // margin: EdgeInsets.only(right: 7),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: CustomColors.greyBorderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              cursorColor: CustomColors.blackTextColor,
              textDirection: TextDirection.ltr,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
                // hintTextDirection: TextDirection.ltr,
              ),
            ),
          ),
      ],
    );
  }
}

//
class CancelButtonWidget extends StatelessWidget {
  const CancelButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Обработка нажатия
        },
        style: ElevatedButton.styleFrom(
          // foregroundColor: Colors.black,
          backgroundColor: CustomColors.greyButtonDialogColor,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          minimumSize: const Size(double.infinity, 0),
          elevation: 0,
        ),
        child: Text(
          'ОТМЕНА',
          style: textStyleMyriadPro_600_14_black(),
        ),
      ),
    );
  }
}
