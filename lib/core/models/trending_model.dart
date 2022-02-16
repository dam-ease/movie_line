import 'package:json_annotation/json_annotation.dart';
import 'package:movie_line/core/models/result_model.dart';

part 'trending_model.g.dart';

@JsonSerializable()
class Trending {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;
  Trending({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  factory Trending.fromJson(Map<String, dynamic> json) =>
      _$TrendingFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingToJson(this);
}
