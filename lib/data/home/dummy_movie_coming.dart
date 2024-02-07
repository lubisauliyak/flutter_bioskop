import 'package:flutter_bioskop/models/home/movie_model.dart';
import 'package:flutter_bioskop/utils/image_dir.dart';

List<MovieComingModel> listMovieComing = [
  MovieComingModel(
      title: 'Petualangan Sherina 2',
      image: ImageDir.imageItem4,
      rating: '8.5',
      detail: DetailMovie(
          director: 'Riri Riza',
          writer: 'Riri Riza',
          genre: 'Drama, Action',
          ph: 'Miles Films',
          duration: '100+ Min',
          pg: '13+',
          description:
              'Film ini mengisahkan petualangan Sherina dan Sadam di hutan Kalimantan saat mereka menyelidiki krisis lingkungan. Film ini merupakan sekuel dari Petualangan Sherina yang sukses mencuri perhatian.')),
  MovieComingModel(
      title: 'The Marvels',
      image: ImageDir.imageItem5,
      rating: '8.5',
      detail: DetailMovie(
          director: 'Nia DaCosta',
          writer: 'Nia DaCosta',
          genre: 'Action, Sci-fi',
          ph: 'Marvel Studios',
          duration: '100+ Min',
          pg: '13+',
          description:
              'Carol Danvers, yang diperankan oleh Brie Larson, berusaha menyelamatkan alam semesta, tetapi kekuatannya yang luar biasa terjalin dengan Kamala Khan dan Monica Rambeau, memaksa mereka untuk bersatu demi menyelamatkan alam semesta.')),
  MovieComingModel(
      title: 'Despicable Me 4',
      image: ImageDir.imageItem6,
      rating: '8.5',
      detail: DetailMovie(
          director: 'Chris Renaud',
          writer: 'Chris Renaud',
          genre: 'Animation, Comedy',
          ph: 'Illumination',
          pg: '13+',
          duration: '100+ Min',
          description:
              'Despicable Me 4 adalah film animasi komedi yang merupakan kelanjutan dari franchise Despicable Me. Gru, mantan penjahat dunia yang kini berubah menjadi agen Liga Anti-Penjahat, kembali untuk petualangan seru yang menghibur.')),
];
