class MovieModel {
  String title;
  String image;
  String rating;
  CategoryRelease category;
  DetailMovie detail;

  MovieModel({
    required this.title,
    required this.image,
    required this.rating,
    required this.category,
    required this.detail,
  });
}

enum CategoryRelease {
  inComing,
  upComing,
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
