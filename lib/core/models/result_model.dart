import 'package:json_annotation/json_annotation.dart';
import 'package:movie_line/core/models/enums.dart';

part 'result_model.g.dart';

@JsonSerializable()
class Result {
  String? overview;
  int? id;
  bool? adult;
  String? backdropPath;
  String? title;
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  String? logoPath;
  int? voteCount;
  bool? video;
  String? belongsToCollection;
  int? budget;
  List? genres;
  String? homePage;
  int? imdbId;
  List? productionCompanies;
  List? productionCountries;
  int? revenue;
  int? runtime;
  List? spokenLanguages;
  String? tagLine;
  String? status;
  double? voteAverage;
  DateTime? releaseDate;
  double? popularity;
  String? mediaType;
  String? originalName;
  String? name;
  DateTime? firstAirDate;
  List<String>? originCountry;

  Result({
    this.overview,
    this.id,
    this.adult,
    this.backdropPath,
    this.title,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.logoPath,
    this.voteCount,
    this.video,
    this.voteAverage,
    this.belongsToCollection,
    this.budget,
    this.homePage,
    this.imdbId,
    this.productionCompanies,
    this.productionCountries,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagLine,
    this.genres,
    this.releaseDate,
    this.popularity,
    this.mediaType,
    this.originalName,
    this.name,
    this.firstAirDate,
    this.originCountry,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
