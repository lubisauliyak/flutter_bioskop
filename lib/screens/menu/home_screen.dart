import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bioskop/data/home/dummy_banner.dart';
import 'package:flutter_bioskop/data/home/dummy_movie_show.dart';
import 'package:flutter_bioskop/data/home/dummy_voucher.dart';
import 'package:flutter_bioskop/models/home/banner_model.dart';
import 'package:flutter_bioskop/models/home/movie_model.dart';
import 'package:flutter_bioskop/models/home/voucher_model.dart';
import 'package:flutter_bioskop/utils/color_dir.dart';
import 'package:flutter_bioskop/utils/image_dir.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentBanner = 0;
  final CarouselController _controllerBanner = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(ImageDir.dummyProfile),
          ),
        ),
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: ColorDir.whiteColor,
              size: 18,
            ),
            SizedBox(width: 4),
            Text(
              'Surabaya',
              style: TextStyle(
                color: ColorDir.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: const [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(
                Icons.notifications_outlined,
                color: ColorDir.whiteColor,
              ),
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.red,
              )
            ],
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              bannerHome(listBanner),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Sedang Tayang',
                        style: TextStyle(
                          color: ColorDir.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Lihat Semua',
                            style: TextStyle(
                              color: ColorDir.whiteAccent6,
                              fontSize: 12,
                            )),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: ColorDir.whiteAccent6,
                          size: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Row(
                      children: List.generate(
                        listMovieShow.length,
                        (index) => cardMovie(
                          listMovieShow[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Container(
                height: 2,
                width: double.infinity,
                color: ColorDir.primaryAccent,
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Voucher Deals',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Row(
                      children: List.generate(
                        listVoucher.length,
                        (index) => voucherHome(
                          listVoucher[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardMovie(MovieShowModel movieModel) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail-content-screen',
              arguments: {'movieModel': movieModel});
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 210,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(movieModel.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              movieModel.title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            RatingBar.builder(
              initialRating: double.parse(movieModel.rating) / 2,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 16,
              itemPadding: const EdgeInsets.only(right: 1),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: ColorDir.yellowColor,
              ),
              onRatingUpdate: (rating) {},
            ),
          ],
        ),
      ),
    );
  }

  Widget voucherHome(VoucherModel voucherModel) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {},
        child: Image.asset(voucherModel.image),
      ),
    );
  }

  Widget bannerHome(List<BannerModel> bannerModel) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: CarouselSlider(
            items: bannerModel.map((banner) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      banner.image,
                      height: 100,
                      fit: BoxFit.fitWidth,
                    ),
                  );
                },
              );
            }).toList(),
            carouselController: _controllerBanner,
            options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 2,
              viewportFraction: 0.7,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentBanner = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bannerModel.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controllerBanner.animateToPage(entry.key),
              child: Container(
                width: _currentBanner == entry.key ? 36 : 16,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: _currentBanner == entry.key
                      ? ColorDir.secondaryColor
                      : ColorDir.primaryAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
