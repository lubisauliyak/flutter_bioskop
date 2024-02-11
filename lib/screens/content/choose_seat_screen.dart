import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bioskop/core/navigation/bioskop_navigation.dart';
import 'package:flutter_bioskop/models/content/cinema_model.dart';
import 'package:flutter_bioskop/models/home/movie_model.dart';
import 'package:flutter_bioskop/screens/menu/home_screen.dart';
import 'package:flutter_bioskop/utils/color_dir.dart';
import 'package:flutter_bioskop/utils/image_dir.dart';
import 'package:flutter_bioskop/utils/widgets/bioskop_button.dart';

class ChooseSeatScreen extends StatefulWidget {
  static const routeName = '/choose-seat-screen';
  const ChooseSeatScreen({super.key});

  @override
  State<ChooseSeatScreen> createState() => _ChooseSeatScreenState();
}

class _ChooseSeatScreenState extends State<ChooseSeatScreen> {
  final List<String> monthID = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Juni',
    'Juli',
    'Agust',
    'Sept',
    'Okt',
    'Nov',
    'Des'
  ];
  List<List<String>> listSeat = [];
  List<String> availableSeat = [];
  List<String> selectedSeat = [];

  @override
  void initState() {
    String currentSeat = '';
    for (var i = 0; i < 8; i++) {
      List<String> subListSeat = [];
      for (var j = 11; j <= 20; j++) {
        currentSeat = String.fromCharCode(65 + i) + j.toString();
        subListSeat.add(currentSeat);
        if (Random().nextBool() == true) {
          availableSeat.add(currentSeat);
        }
      }
      listSeat.add(subListSeat);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    MovieModel movieModel = arguments['movieModel'] as MovieModel;
    CinemaModel cinemaModel = arguments['cinemaModel'] as CinemaModel;
    String selectedTime = arguments['selectedTime'];
    DateTime selectedDate = arguments['selectedDate'];

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
                width: double.infinity,
                height: 40,
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageDir.cinemaScreen),
                        fit: BoxFit.fitWidth)),
              ),
              const Text('LAYAR',
                  style: TextStyle(
                      color: ColorDir.whiteColor, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              chooseSeat(),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 1,
                color: ColorDir.primaryAccent,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    statusSeat(text: 'Tersedia', color: ColorDir.whiteAccent2),
                    statusSeat(
                        text: 'Tidak Tersedia', color: ColorDir.primaryAccent),
                    statusSeat(text: 'Dipilih', color: ColorDir.secondaryColor),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(
                    color: ColorDir.primaryAccent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(cinemaModel.image),
                        const SizedBox(width: 10),
                        Text(
                          cinemaModel.title,
                          style: const TextStyle(
                              color: ColorDir.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        cardInfo(title: 'Jam', description: selectedTime),
                        const SizedBox(width: 20),
                        cardInfo(
                            title: 'Tanggal',
                            description:
                                '${selectedDate.day} ${monthID[selectedDate.month - 1]}'),
                        const SizedBox(width: 20),
                        cardInfo(title: 'Kelas', description: 'Reguler'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${selectedSeat.length} Kursi terpilih',
                          style: TextStyle(color: ColorDir.whiteAccent4),
                        ),
                        Container(
                          width: 200,
                          alignment: Alignment.centerRight,
                          child: Text(
                            selectedSeat.isNotEmpty
                                ? selectedSeat.join(', ')
                                : '-',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: ColorDir.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(color: ColorDir.whiteAccent4),
                        ),
                        Text(
                          selectedSeat.isNotEmpty
                              ? 'Rp ${50 * selectedSeat.length}.000'
                              : 'Rp ',
                          style: const TextStyle(
                              color: ColorDir.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          width: double.infinity,
          color: ColorDir.primaryAccent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 10),
              child: BioskopButton().buttonPrimary(
                  text: 'Beli Tiket', onTap: _onTapButtonBuyTicket))),
    );
  }

  void _onTapButtonBuyTicket() {
    BioskopNavigation().pop();
    BioskopNavigation().pop();
    BioskopNavigation().pop();
    BioskopNavigation().pushReplacementNamed(MainScreen.routeName);
  }

  Widget chooseSeat() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: List.generate(listSeat.length, (rowIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(listSeat[rowIndex].length, (seatIndex) {
              return buttonSeat(
                  seat: listSeat[rowIndex][seatIndex],
                  seatIndex: seatIndex,
                  onTap: () {
                    if (availableSeat.contains(listSeat[rowIndex][seatIndex])) {
                      if (selectedSeat
                          .contains(listSeat[rowIndex][seatIndex])) {
                        setState(() {
                          selectedSeat.remove(listSeat[rowIndex][seatIndex]);
                        });
                      } else {
                        setState(() {
                          selectedSeat.add(listSeat[rowIndex][seatIndex]);
                        });
                      }
                    }
                  });
            }).toList(),
          );
        }),
      ),
    );
  }

  Widget buttonSeat(
      {required String seat,
      required int seatIndex,
      required void Function() onTap}) {
    return Row(
      children: [
        if (seatIndex == 0) const SizedBox(width: 20),
        if (seatIndex == 5) const SizedBox(width: 50),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
                color: !availableSeat.contains(seat)
                    ? ColorDir.primaryAccent
                    : selectedSeat.contains(seat)
                        ? ColorDir.secondaryColor
                        : ColorDir.whiteAccent2,
                borderRadius: BorderRadius.circular(5)),
            child: Text(seat,
                style: TextStyle(
                    color: availableSeat.contains(seat)
                        ? ColorDir.whiteColor
                        : ColorDir.whiteAccent2,
                    fontWeight: availableSeat.contains(seat)
                        ? FontWeight.bold
                        : FontWeight.normal)),
          ),
        ),
        if (seatIndex == 9) const SizedBox(width: 20),
      ],
    );
  }

  Widget statusSeat({required String text, required Color color}) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
        ),
        Text(
          ' $text',
          style: TextStyle(color: ColorDir.whiteAccent6),
        ),
      ],
    );
  }

  Widget cardInfo({required String title, required String description}) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: ColorDir.whiteAccent4, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: ColorDir.whiteAccent4),
            ),
            Text(
              description,
              style: const TextStyle(
                color: ColorDir.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
