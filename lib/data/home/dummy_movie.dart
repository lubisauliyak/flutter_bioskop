import 'package:flutter_bioskop/models/home/movie_model.dart';
import 'package:flutter_bioskop/utils/image_dir.dart';

List<MovieModel> listMovie = [
  MovieModel(
      title: 'Star Wars : The Last Jedi',
      image: ImageDir.imageItem1,
      rating: '6.9',
      category: CategoryRelease.inComing,
      detail: DetailMovie(
          director: 'Rian Johnson',
          writer: 'Rian Johnson',
          genre: 'Action, Sci-fi',
          ph: 'Lucasfillm Ltd.',
          duration: '152 Min',
          pg: '13+',
          description:
              'Dalam film Lucasfilm Star Wars: The Last Jedi, kisah keluarga Skywalker diteruskan ketika para pahlawan The Force Awakens bergabung dengan para legenda galaksi dalam sebuah petualangan mencengangkan untuk menguak kunci misteri lintas zaman mengenai the Force serta terkuaknya secara mengejutkan berbagai rahasia masa lalu. Film ini dibintangi Mark Hamill, Carrie Fisher, Adam Driver, Daisy Ridley, John Boyega, Oscar Isaac, Lupita Nyong’o, Andy Serkis, Domhnall Gleeson, Anthony Daniels, Gwendoline Christie, Kelly Marie Tran, Laura Dern dan Benicio Del Toro. Star Wars: The Last Jedi ditulis & disutradarai oleh Rian Johnson dan diproduseri Kathleen Kennedy serta Ram Bergman. J.J. Abrams, Tom Karnowski dan Jason McGatlin sebagai produser eksekutif.')),
  MovieModel(
      title: 'Fast & Furious 9 : The Fast Saga',
      image: ImageDir.imageItem2,
      rating: '5.2',
      category: CategoryRelease.inComing,
      detail: DetailMovie(
          director: 'Justin Lin',
          writer: 'Chris Morgan',
          genre: 'Action, Sci-fi',
          ph: 'Universal Pictures',
          duration: '100+ Min',
          pg: '13+',
          description:
              'Fast and Furious 9 (juga dikenal sebagai F9: The Fast Saga) mengisahkan tentang dendam masa lalu Dominic Toretto yang belum terselesaikan. Dalam petualangan ini, Dom menghadapi berbagai ancaman dan dilema pribadi yang melibatkan keluarganya.')),
  MovieModel(
      title: 'The Conjuring 3 : The Devil Made Me Do It',
      image: ImageDir.imageItem3,
      rating: '6.3',
      category: CategoryRelease.inComing,
      detail: DetailMovie(
          director: 'Michael Chaves',
          writer: 'James Wan',
          genre: 'Horror',
          ph: 'Warner Bros',
          pg: 'R',
          duration: '100+ Min',
          description:
              'Film "The Conjuring 3" mengisahkan tentang pasangan paranormal Ed dan Lorraine Warren yang terlibat dalam kasus pengadilan yang menakutkan ketika mereka mencoba membantu dalam penyelidikan pembunuhan yang didakwa dilakukan oleh seorang pria yang mengklaim terpengaruh oleh setan. Kasus ini menjadi salah satu yang paling terkenal dalam sejarah investigasi paranormal.')),
  MovieModel(
      title: 'Petualangan Sherina 2',
      image: ImageDir.imageItem4,
      rating: '7.3',
      category: CategoryRelease.upComing,
      detail: DetailMovie(
          director: 'Riri Riza',
          writer: 'Jujur Prananto',
          genre: 'Drama, Action',
          ph: 'Miles Films',
          duration: '100+ Min',
          pg: '13+',
          description:
              'Film ini mengisahkan petualangan Sherina dan Sadam di hutan Kalimantan saat mereka menyelidiki krisis lingkungan. Film ini merupakan sekuel dari Petualangan Sherina yang sukses mencuri perhatian.')),
  MovieModel(
      title: 'The Marvels',
      image: ImageDir.imageItem5,
      rating: '5.6',
      category: CategoryRelease.upComing,
      detail: DetailMovie(
          director: 'Nia DaCosta',
          writer: 'Nia DaCosta',
          genre: 'Action, Sci-fi',
          ph: 'Marvel Studios',
          duration: '100+ Min',
          pg: '13+',
          description:
              'Carol Danvers, yang diperankan oleh Brie Larson, berusaha menyelamatkan alam semesta, tetapi kekuatannya yang luar biasa terjalin dengan Kamala Khan dan Monica Rambeau, memaksa mereka untuk bersatu demi menyelamatkan alam semesta.')),
  MovieModel(
      title: 'Despicable Me 4',
      image: ImageDir.imageItem6,
      rating: '0',
      category: CategoryRelease.upComing,
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
