class MovieShowModel {
  String title;
  String image;
  String rating;
  DetailMovie detail;

  MovieShowModel({
    required this.title,
    required this.image,
    required this.rating,
    required this.detail,
  });
}

class MovieComingModel {
  String title;
  String image;
  String rating;
  DetailMovie detail;

  MovieComingModel({
    required this.title,
    required this.image,
    required this.rating,
    required this.detail,
  });
}

class DetailMovie {
  String director;
  String writer;
  String genre;
  String ph;
  String duration;
  String pg;
  String description;

  DetailMovie({
    required this.director,
    required this.writer,
    required this.genre,
    required this.ph,
    required this.duration,
    required this.pg,
    required this.description,
  });
}
