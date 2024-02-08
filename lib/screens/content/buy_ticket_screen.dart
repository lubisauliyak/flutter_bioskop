import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bioskop/core/navigation/bioskop_navigation.dart';
import 'package:flutter_bioskop/data/content/dummy_cinema.dart';
import 'package:flutter_bioskop/models/content/cinema_model.dart';
import 'package:flutter_bioskop/models/home/movie_model.dart';
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

  List<String> showTime = ['12:15', '15:30', '18:00', '21:00'];
  List<bool> isSelectedTime = [false, false, false, false];
  List<bool> isExpiredTime = [true, false, false, false];

  @override
  void initState() {
    isSelectedCinema[0] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    MovieShowModel movieModel = arguments['movieModel'] as MovieShowModel;

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
                  children: List.generate(listCinema.length,
                      (index) => cardCinema(listCinema[index], index)),
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
                // Navigator.pushNamed(context, '/buy-ticket-screen',
                //     arguments: {'movieModel': movieModel});
              })),
    );
  }

  Widget cardCinema(CinemaModel cinemaModel, int index) {
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
                        (index) => buttonShowTime(showTime[index], index),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(height: 20),
      ],
    );
  }

  Widget buttonShowTime(String textShowTime, int index) {
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
          textShowTime,
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
