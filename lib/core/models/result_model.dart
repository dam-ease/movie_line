import 'package:json_annotation/json_annotation.dart';
import 'package:movie_line/core/models/enums.dart';

part 'result_model.g.dart';

@JsonSerializable()
class Movies {
  String? overview;
  int? id;
  bool? adult;
  String? backdropPath;
  String? title;
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  int? voteCount;
  bool? video;
  double? voteAverage;
  DateTime? releaseDate;
  double? popularity;
  String? mediaType;
  String? originalName;
  String? name;
  DateTime? firstAirDate;
  List<String>? originCountry;

  Movies({
    this.overview,
    this.id,
    this.adult,
    this.backdropPath,
    this.title,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.voteCount,
    this.video,
    this.voteAverage,
    this.releaseDate,
    this.popularity,
    this.mediaType,
    this.originalName,
    this.name,
    this.firstAirDate,
    this.originCountry,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}
