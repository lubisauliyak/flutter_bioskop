import 'package:flutter_bioskop/models/home/movie_model.dart';
import 'package:flutter_bioskop/utils/image_dir.dart';

List<MovieShowModel> listMovieShow = [
  MovieShowModel(
      title: 'Star Wars : The Last Jedi',
      image: ImageDir.imageItem1,
      rating: '8.9',
      detail: DetailMovie(
          director: 'Rian Johnson',
          writer: 'Rian Johnson',
          genre: 'Action, Sci-fi',
          ph: 'Lucasfillm Ltd.',
          duration: '152 Min',
          pg: '13+',
          description:
              'Dalam film Lucasfilm Star Wars: The Last Jedi, kisah keluarga Skywalker diteruskan ketika para pahlawan The Force Awakens bergabung dengan para legenda galaksi dalam sebuah petualangan mencengangkan untuk menguak kunci misteri lintas zaman mengenai the Force serta terkuaknya secara mengejutkan berbagai rahasia masa lalu. Film ini dibintangi Mark Hamill, Carrie Fisher, Adam Driver, Daisy Ridley, John Boyega, Oscar Isaac, Lupita Nyong’o, Andy Serkis, Domhnall Gleeson, Anthony Daniels, Gwendoline Christie, Kelly Marie Tran, Laura Dern dan Benicio Del Toro. Star Wars: The Last Jedi ditulis & disutradarai oleh Rian Johnson dan diproduseri Kathleen Kennedy serta Ram Bergman. J.J. Abrams, Tom Karnowski dan Jason McGatlin sebagai produser eksekutif.')),
  MovieShowModel(
      title: 'Fast & Furious 9',
      image: ImageDir.imageItem2,
      rating: '8.5',
      detail: DetailMovie(
          director: 'Justin Lin',
          writer: 'Chris Morgan',
          genre: 'Action, Sci-fi',
          ph: 'Universal Pictures',
          duration: '100+ Min',
          pg: '13+',
          description:
              'Fast and Furious 9 (juga dikenal sebagai F9: The Fast Saga) mengisahkan tentang dendam masa lalu Dominic Toretto yang belum terselesaikan. Dalam petualangan ini, Dom menghadapi berbagai ancaman dan dilema pribadi yang melibatkan keluarganya.')),
  MovieShowModel(
      title: 'The Conjuring 3',
      image: ImageDir.imageItem3,
      rating: '8.5',
      detail: DetailMovie(
          director: 'Michael Chaves',
          writer: 'David Leslie J',
          genre: 'Action, Sci-fi',
          ph: 'Warner Bros',
          pg: '13+',
          duration: '100+ Min',
          description:
              'Film "The Conjuring 3" mengisahkan tentang pasangan paranormal Ed dan Lorraine Warren yang terlibat dalam kasus pengadilan yang menakutkan ketika mereka mencoba membantu dalam penyelidikan pembunuhan yang didakwa dilakukan oleh seorang pria yang mengklaim terpengaruh oleh setan. Kasus ini menjadi salah satu yang paling terkenal dalam sejarah investigasi paranormal.')),
];
