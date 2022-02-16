// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    overview: json['overview'] as String,
    id: json['id'] as int,
    adult: json['adult'] as bool?,
    backdropPath: json['backdropPath'] as String,
    title: json['title'] as String?,
    genreIds: (json['genreIds'] as List<dynamic>).map((e) => e as int).toList(),
    originalLanguage:
        _$enumDecode(_$OriginalLanguageEnumMap, json['originalLanguage']),
    originalTitle: json['originalTitle'] as String?,
    posterPath: json['posterPath'] as String,
    voteCount: json['voteCount'] as int,
    video: json['video'] as bool?,
    voteAverage: (json['voteAverage'] as num).toDouble(),
    releaseDate: json['releaseDate'] == null
        ? null
        : DateTime.parse(json['releaseDate'] as String),
    popularity: (json['popularity'] as num).toDouble(),
    mediaType: _$enumDecode(_$MediaTypeEnumMap, json['mediaType']),
    originalName: json['originalName'] as String?,
    name: json['name'] as String?,
    firstAirDate: json['firstAirDate'] == null
        ? null
        : DateTime.parse(json['firstAirDate'] as String),
    originCountry: (json['originCountry'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'overview': instance.overview,
      'id': instance.id,
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'title': instance.title,
      'genreIds': instance.genreIds,
      'originalLanguage': _$OriginalLanguageEnumMap[instance.originalLanguage],
      'originalTitle': instance.originalTitle,
      'posterPath': instance.posterPath,
      'voteCount': instance.voteCount,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'popularity': instance.popularity,
      'mediaType': _$MediaTypeEnumMap[instance.mediaType],
      'originalName': instance.originalName,
      'name': instance.name,
      'firstAirDate': instance.firstAirDate?.toIso8601String(),
      'originCountry': instance.originCountry,
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

const _$OriginalLanguageEnumMap = {
  OriginalLanguage.EN: 'EN',
  OriginalLanguage.JA: 'JA',
  OriginalLanguage.TR: 'TR',
};

const _$MediaTypeEnumMap = {
  MediaType.MOVIE: 'MOVIE',
  MediaType.TV: 'TV',
};
