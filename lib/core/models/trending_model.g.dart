// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trending _$TrendingFromJson(Map<String, dynamic> json) {
  return Trending(
    page: json['page'] as int,
    results: (json['results'] as List<dynamic>)
        .map((e) => Result.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPages: json['totalPages'] as int,
    totalResults: json['totalResults'] as int,
  );
}

Map<String, dynamic> _$TrendingToJson(Trending instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
