import 'package:json_annotation/json_annotation.dart';
import 'package:movie_line/core/models/enums.dart';

part 'result_model.g.dart';

@JsonSerializable()
class Result {
  String overview;
  int id;
  bool? adult;
  String backdropPath;
  String? title;
  List<int> genreIds;
  OriginalLanguage originalLanguage;
  String? originalTitle;
  String posterPath;
  int voteCount;
  bool? video;
  double voteAverage;
  DateTime? releaseDate;
  double popularity;
  MediaType mediaType;
  String? originalName;
  String? name;
  DateTime? firstAirDate;
  List<String>? originCountry;

  Result({
    required this.overview,
    required this.id,
    this.adult,
    required this.backdropPath,
    this.title,
    required this.genreIds,
    required this.originalLanguage,
    this.originalTitle,
    required this.posterPath,
    required this.voteCount,
    this.video,
    required this.voteAverage,
    this.releaseDate,
    required this.popularity,
    required this.mediaType,
    this.originalName,
    this.name,
    this.firstAirDate,
    this.originCountry,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
