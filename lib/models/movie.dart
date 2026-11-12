class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;

  Movie({
    this.id = 0,
    required this.title,
    this.overview = 'Sin descripción disponible.',
    required this.posterPath,
    this.voteAverage = 0.0,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? json['name'] ?? 'Sin título',
      overview: json['overview'] ?? 'Sin descripción disponible.',
      posterPath: json['posterPath'] ?? json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
    );
  }
}