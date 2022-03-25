// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    overview: json['overview'] as String?,
    id: json['id'] as int?,
    adult: json['adult'] as bool?,
    backdropPath: json['backdrop_path'] as String?,
    title: json['title'] as String?,
    genreIds:
        (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
    originalLanguage: json['original_language'] as String?,
    originalTitle: json['original_title'] as String?,
    posterPath: json['poster_path'] as String?,
    logoPath: json['logo_path'] as String?,
    voteCount: json['vote_count'] as int?,
    video: json['video'] as bool?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    belongsToCollection: json['belongs_to_collection'] as String?,
    budget: json['budget'] as int?,
    homePage: json['homepage'] as String?,
    imdbId: json['imdb_id'] as int?,
    productionCompanies: json['production_companies'] as List<dynamic>?,
    productionCountries: json['production_countries'] as List<dynamic>?,
    revenue: json['revenue'] as int?,
    runtime: json['runtime'] as int?,
    spokenLanguages: json['spoken_languages'] as List<dynamic>?,
    status: json['status'] as String?,
    tagLine: json['tagline'] as String?,
    genres: json['genres'] as List<dynamic>?,
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

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'overview': instance.overview,
      'id': instance.id,
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'logo_path': instance.logoPath,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'belongs_to_collection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres
          ?.map((e) => e.map((k, e) => MapEntry(k.toString(), e)))
          .toList(),
      'homepage': instance.homePage,
      'imdb_id': instance.imdbId,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'tagline': instance.tagLine,
      'status': instance.status,
      'vote_average': instance.voteAverage,
      'release_date': instance.releaseDate?.toIso8601String(),
      'popularity': instance.popularity,
      'media_type': instance.mediaType,
      'original_name': instance.originalName,
      'name': instance.name,
      'first_air_date': instance.firstAirDate?.toIso8601String(),
      'origin_country': instance.originCountry,
    };
