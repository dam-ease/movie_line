// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) {
  return Movies(
    overview: json['overview'] as String?,
    id: json['id'] as int?,
    adult: json['adult'] as bool?,
    backdropPath: json['backdrop_path'] as String?,
    title: json['title'] as String?,
    genreIds:
        (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
    originalLanguage: json['original_language'] as String?,
    originalTitle: json['original_title'] as String?,
    posterPath: json['posterPath'] as String?,
    voteCount: json['vote_count'] as int?,
    video: json['video'] as bool?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    releaseDate: json['release_date'] == null
        ? null
        : DateTime.parse(json['release_date'] as String),
    popularity: (json['popularity'] as num?)?.toDouble(),
    mediaType: json['media_type'] as String?,
    originalName: json['original_name'] as String?,
    name: json['name'] as String?,
    firstAirDate: json['first_air_date'] == null
        ? null
        : DateTime.parse(json['first_air_date'] as String),
    originCountry: (json['origin_country'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'overview': instance.overview,
      'id': instance.id,
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'release_date': instance.releaseDate?.toIso8601String(),
      'popularity': instance.popularity,
      'media_type': _$MediaTypeEnumMap[instance.mediaType],
      'original_name': instance.originalName,
      'name': instance.name,
      'first_air_date': instance.firstAirDate?.toIso8601String(),
      'origin_country': instance.originCountry,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$MediaTypeEnumMap = {
  MediaType.MOVIE: 'MOVIE',
  MediaType.TV: 'TV',
};
