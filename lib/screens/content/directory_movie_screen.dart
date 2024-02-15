import 'package:flutter/material.dart';
import 'package:flutter_bioskop/core/navigation/bioskop_navigation.dart';
import 'package:flutter_bioskop/data/home/dummy_movie.dart';
import 'package:flutter_bioskop/models/home/movie_model.dart';
import 'package:flutter_bioskop/screens/content/detail_content_screen.dart';
import 'package:flutter_bioskop/utils/color_dir.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DirectoryMovieScreen extends StatefulWidget {
  static const routeName = '/movie-directory-screen';
  const DirectoryMovieScreen({super.key});

  @override
  State<DirectoryMovieScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<DirectoryMovieScreen> {
  Map<CategoryRelease, String> categoryRelease = {
    CategoryRelease.inComing: 'Sedang Tayang',
    CategoryRelease.upComing: 'Akan Tayang',
  };
  List<bool> isSelectedCategory =
      List.filled(CategoryRelease.values.length, false);

  @override
  void initState() {
    isSelectedCategory[0] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<MovieModel> filteredMovies = listMovie.where((movie) {
      int index = movie.category.index;
      return isSelectedCategory[index];
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorDir.primaryAccent,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: ColorDir.whiteColor),
            onPressed: () {
              BioskopNavigation().pop();
            }),
        centerTitle: true,
        title: const Text(
          'Daftar Film',
          style: TextStyle(color: ColorDir.whiteColor),
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
                color: ColorDir.primaryAccent,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: categoryRelease.entries.map((entry) {
                final category = entry.key;
                final categoryName = entry.value;
                final index = category.index;
                return buttonCategoryRelease(
                    text: categoryName,
                    isSelectedCategory: isSelectedCategory[index],
                    onTap: () {
                      setState(() {
                        isSelectedCategory =
                            List.filled(isSelectedCategory.length, false);
                        isSelectedCategory[index] = true;
                      });
                    });
              }).toList(),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(
                  filteredMovies.length,
                  (index) => cardMovie(
                    movieModel: filteredMovies[index],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget buttonCategoryRelease(
      {required String text,
      required bool isSelectedCategory,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: isSelectedCategory
                ? ColorDir.secondaryColor
                : ColorDir.primaryAccent,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(
              color: isSelectedCategory
                  ? ColorDir.whiteColor
                  : ColorDir.whiteAccent4),
        ),
      ),
    );
  }

  Widget cardMovie({required MovieModel movieModel}) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(movieModel.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieModel.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: ColorDir.whiteColor,
                          fontSize: 20,
                          height: 1.2,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    RatingBar.builder(
                      initialRating: double.parse(movieModel.rating) / 2,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: const EdgeInsets.only(right: 1),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: ColorDir.yellowColor,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('P-G ',
                            style: TextStyle(
                                color: ColorDir.whiteAccent4, fontSize: 12)),
                        Text(movieModel.detail.pg,
                            style: TextStyle(
                                color: ColorDir.whiteAccent4,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(movieModel.detail.genre,
                        style: TextStyle(
                            color: ColorDir.whiteAccent4, fontSize: 12)),
                  ],
                ),
                SizedBox(
                    height: 30,
                    width: 90,
                    child: buttonCard(onTap: () {
                      BioskopNavigation().pop();
                      BioskopNavigation().pushNamed(
                          DetailContentScreen.routeName,
                          arguments: {'movieModel': movieModel});
                    }))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buttonCard({required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorDir.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Beli Tiket',
          style: TextStyle(
            color: ColorDir.whiteColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
