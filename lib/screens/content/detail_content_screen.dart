import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bioskop/models/home/movie_model.dart';
import 'package:flutter_bioskop/utils/color_dir.dart';
import 'package:flutter_bioskop/utils/widgets/bioskop_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailContentScreen extends StatefulWidget {
  static const routeName = '/detail-content-screen';
  const DetailContentScreen({super.key});

  @override
  State<DetailContentScreen> createState() => _DetailContentScreenState();
}

class _DetailContentScreenState extends State<DetailContentScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    MovieShowModel movieModel = arguments['movieModel'] as MovieShowModel;
    return Scaffold(
      body: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(movieModel.image),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4),
                            BlendMode.dstATop,
                          ),
                        ),
                      ),
                      child: Icon(
                        Icons.play_circle,
                        color: Colors.white.withOpacity(0.4),
                        size: 80,
                      ),
                    ),
                    Positioned(
                      top: 170,
                      left: 20,
                      child: Container(
                        width: 150,
                        height: 210,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(movieModel.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 210,
                      left: 190,
                      child: SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movieModel.title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  height: 1.2,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Produser',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.2))),
                                    const SizedBox(height: 2),
                                    Text('Penulis',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.2))),
                                    const SizedBox(height: 2),
                                    Text('Genre',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.2))),
                                    const SizedBox(height: 2),
                                    Text('PH',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.2))),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(movieModel.detail.director,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5))),
                                    const SizedBox(height: 2),
                                    Text(movieModel.detail.writer,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5))),
                                    const SizedBox(height: 2),
                                    Text(movieModel.detail.genre,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5))),
                                    const SizedBox(height: 2),
                                    SizedBox(
                                      width: 120,
                                      child: Text(movieModel.detail.ph,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.5))),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 65,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorDir.primaryAccent, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              initialRating:
                                  double.parse(movieModel.rating) / 2,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 14,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${movieModel.rating}/10',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 65,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorDir.primaryAccent, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Durasi',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.2)),
                            ),
                            Text(
                              movieModel.detail.duration,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 65,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorDir.primaryAccent, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'P-G',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.2)),
                            ),
                            Text(
                              movieModel.detail.pg,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Sinopsis',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      movieModel.detail.description,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.4), fontSize: 14),
                    )
                  ],
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
              onTap: _onTapButtonOrderTiket,
              icon: CupertinoIcons.ticket)),
    );
  }

  void _onTapButtonOrderTiket() {}
}