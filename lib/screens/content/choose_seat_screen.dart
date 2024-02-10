import 'package:flutter/material.dart';
import 'package:flutter_bioskop/core/navigation/bioskop_navigation.dart';
import 'package:flutter_bioskop/models/home/movie_model.dart';
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
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageDir.cinemaScreen),
                      fit: BoxFit.fitWidth)),
            ),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                  color: ColorDir.primaryAccent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(ImageDir.cinemaItem1),
                      const SizedBox(width: 10),
                      const Text(
                        'CGV Marvel',
                        style: TextStyle(
                            color: ColorDir.whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      cardInfo(title: 'Jam', description: '16:00'),
                      const SizedBox(width: 20),
                      cardInfo(title: 'Tanggal', description: '8 Feb'),
                      const SizedBox(width: 20),
                      cardInfo(title: 'Kelas', description: 'Reguler'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '3 Kursi terpilih',
                        style: TextStyle(color: ColorDir.whiteAccent4),
                      ),
                      const Text(
                        'A10, A13, A15',
                        style: TextStyle(
                            color: ColorDir.whiteColor,
                            fontWeight: FontWeight.bold),
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
                      const Text(
                        'Rp 150.000',
                        style: TextStyle(
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
      bottomNavigationBar: Container(
          width: double.infinity,
          color: ColorDir.primaryAccent,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 20),
              child: BioskopButton()
                  .buttonPrimary(text: 'Beli Tiket', onTap: () {}))),
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
          style: TextStyle(
              color: ColorDir.whiteAccent4, fontWeight: FontWeight.bold),
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
