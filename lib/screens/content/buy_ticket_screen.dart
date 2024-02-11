import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bioskop/core/navigation/bioskop_navigation.dart';
import 'package:flutter_bioskop/data/content/dummy_cinema.dart';
import 'package:flutter_bioskop/models/content/cinema_model.dart';
import 'package:flutter_bioskop/models/home/movie_model.dart';
import 'package:flutter_bioskop/screens/content/choose_seat_screen.dart';
import 'package:flutter_bioskop/utils/color_dir.dart';
import 'package:flutter_bioskop/utils/widgets/bioskop_button.dart';
import 'package:flutter_bioskop/utils/widgets/bioskop_textfield.dart';

class BuyTicketScreen extends StatefulWidget {
  static const routeName = '/buy-ticket-screen';
  const BuyTicketScreen({super.key});

  @override
  State<BuyTicketScreen> createState() => _BuyTicketScreenState();
}

class _BuyTicketScreenState extends State<BuyTicketScreen> {
  final TextEditingController _controllerSearch = TextEditingController();

  @override
  void dispose() {
    _controllerSearch.dispose();
    super.dispose();
  }

  List<bool> isSelectedCinema = List.filled(listCinema.length, false);

  final List<String> dayID = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
  final List<Color> colorCardDate = [
    ColorDir.whiteAccent2,
    ColorDir.whiteAccent4,
    ColorDir.whiteAccent6,
    ColorDir.whiteColor,
    ColorDir.whiteAccent6,
    ColorDir.whiteAccent4,
    ColorDir.whiteAccent2
  ];
  DateTime now = DateTime.now();
  late DateTime today = DateTime(now.year, now.month, now.day);
  late DateTime limitDaysLater = today.add(const Duration(days: 14));
  List<DateTime> showDate = [];
  List<String> showDay = [];
  final List<String> showTime = ['12:15', '15:30', '18:00', '21:00'];

  List<bool> isSelectedTime = [];
  List<bool> isExpiredTime = [];

  @override
  void initState() {
    isSelectedCinema[0] = true;
    _selectedDate(date: today);

    isSelectedTime = List.filled(showTime.length, false);
    isExpiredTime = List.filled(showTime.length, false);
    isSelectedTime[1] = true;
    isExpiredTime[0] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    MovieModel movieModel = arguments['movieModel'] as MovieModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorDir.primaryAccent,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: ColorDir.whiteColor),
            onPressed: () {
              BioskopNavigation().pop();
            }),
        centerTitle: true,
        title: Text(
          movieModel.title,
          style: const TextStyle(color: ColorDir.whiteColor),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                      showDate.length,
                      (index) => cardDate(
                          day: showDay[index],
                          date: showDate[index],
                          color: colorCardDate[index],
                          index: index)),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 2,
                width: double.infinity,
                color: ColorDir.primaryAccent,
              ),
              const SizedBox(height: 20),
              BioskopTextField().textFieldPrimary(
                  hintText: 'Cari Bioskop',
                  varText: '',
                  icon: Icons.search,
                  controller: _controllerSearch,
                  type: TextInputType.text,
                  onChanged: (String search) {}),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: List.generate(
                      listCinema.length,
                      (index) => cardCinema(
                          cinemaModel: listCinema[index], index: index)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(bottom: 20, top: 10),
          child: BioskopButton().buttonPrimary(
              text: 'Beli Tiket',
              onTap: () {
                BioskopNavigation()
                    .pushNamed(ChooseSeatScreen.routeName, arguments: {
                  'movieModel': movieModel,
                  'cinemaModel': listCinema[
                      isSelectedCinema.indexWhere((element) => element)],
                  'selectedTime':
                      showTime[isSelectedTime.indexWhere((element) => element)],
                  'selectedDate': showDate[3],
                });
              })),
    );
  }

  void _selectedDate({required DateTime date}) {
    setState(() {
      showDate.clear();
      showDay.clear();
      for (int i = -3; i < 0; i++) {
        DateTime currentDate = date.add(Duration(days: i));
        showDate.add(currentDate);
        showDay.add(dayID[currentDate.weekday - 1]);
      }
      showDate.add(date);
      showDay.add(dayID[date.weekday - 1]);
      for (int i = 1; i <= 3; i++) {
        DateTime currentDate = date.add(Duration(days: i));
        showDate.add(currentDate);
        showDay.add(dayID[currentDate.weekday - 1]);
      }
    });
  }

  Widget cardDate(
      {required String day,
      required DateTime date,
      required Color color,
      required int index}) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            if (!date.isBefore(today) &&
                !date.isAfter(limitDaysLater) &&
                index != 3) {
              _selectedDate(date: date);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                day,
                style: TextStyle(
                    color:
                        (!date.isBefore(today) && !date.isAfter(limitDaysLater))
                            ? color
                            : ColorDir.primaryAccent,
                    fontSize: (index == 3) ? 16 : 14,
                    fontWeight:
                        (index == 3) ? FontWeight.bold : FontWeight.normal),
              ),
              if (index == 3) const SizedBox(height: 6),
              Text(
                date.toString().substring(8, 10),
                style: TextStyle(
                    color:
                        (!date.isBefore(today) && !date.isAfter(limitDaysLater))
                            ? color
                            : ColorDir.primaryAccent,
                    fontSize: (index == 3) ? 18 : 14,
                    fontWeight:
                        (index == 3) ? FontWeight.bold : FontWeight.normal),
              ),
            ],
          ),
        ));
  }

  Widget cardCinema({required CinemaModel cinemaModel, required int index}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSelectedCinema = List.filled(isSelectedCinema.length, false);
              isSelectedCinema[index] = true;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(cinemaModel.image),
                  const SizedBox(width: 10),
                  Text(
                    cinemaModel.title,
                    style: const TextStyle(color: ColorDir.whiteColor),
                  )
                ],
              ),
              isSelectedCinema[index]
                  ? const Icon(CupertinoIcons.chevron_up,
                      color: ColorDir.secondaryColor)
                  : const Icon(CupertinoIcons.chevron_down,
                      color: ColorDir.whiteColor),
            ],
          ),
        ),
        const SizedBox(height: 12),
        isSelectedCinema[index]
            ? Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorDir.primaryAccent, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Regular',
                            style: TextStyle(color: ColorDir.whiteColor)),
                        Text('Rp 50.000',
                            style: TextStyle(color: ColorDir.whiteColor)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        showTime.length,
                        (index) =>
                            buttonShowTime(text: showTime[index], index: index),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(height: 20),
      ],
    );
  }

  Widget buttonShowTime({required String text, required int index}) {
    return GestureDetector(
      onTap: () {
        if (isExpiredTime[index] != true) {
          setState(() {
            isSelectedTime = List.filled(isSelectedTime.length, false);
            isSelectedTime[index] = true;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: isSelectedTime[index]
                ? ColorDir.secondaryColor
                : isExpiredTime[index]
                    ? ColorDir.primaryAccent
                    : ColorDir.whiteAccent2,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6,
        ),
        child: Text(
          text,
          style: TextStyle(
              color: isExpiredTime[index]
                  ? ColorDir.whiteAccent4
                  : ColorDir.whiteColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
