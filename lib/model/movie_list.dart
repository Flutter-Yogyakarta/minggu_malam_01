// To parse this JSON data, do
//
//     final movieList = movieListFromJson(jsonString);

import 'dart:convert';

MovieList movieListFromJson(String str) => MovieList.fromMap(json.decode(str));

String movieListToJson(MovieList data) => json.encode(data.toMap());

class MovieList {
    final int page;
    final List<Movie> results;
    final int totalPages;
    final int totalResults;

    MovieList({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    MovieList copyWith({
        int page,
        List<Movie> results,
        int totalPages,
        int totalResults,
    }) => 
        MovieList(
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );

    factory MovieList.fromMap(Map<String, dynamic> json) => MovieList(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null ? null : List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults: json["total_results"] == null ? null : json["total_results"],
    );

    Map<String, dynamic> toMap() => {
        "page": page == null ? null : page,
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toMap())),
        "total_pages": totalPages == null ? null : totalPages,
        "total_results": totalResults == null ? null : totalResults,
    };
}

class Movie {
    final int id;
    final bool video;
    final int voteCount;
    final double voteAverage;
    final String title;
    final DateTime releaseDate;
    final OriginalLanguage originalLanguage;
    final String originalTitle;
    final List<int> genreIds;
    final String backdropPath;
    final bool adult;
    final String overview;
    final String posterPath;
    final double popularity;
    final MediaType mediaType;

    Movie({
        this.id,
        this.video,
        this.voteCount,
        this.voteAverage,
        this.title,
        this.releaseDate,
        this.originalLanguage,
        this.originalTitle,
        this.genreIds,
        this.backdropPath,
        this.adult,
        this.overview,
        this.posterPath,
        this.popularity,
        this.mediaType,
    });

    Movie copyWith({
        int id,
        bool video,
        int voteCount,
        double voteAverage,
        String title,
        DateTime releaseDate,
        OriginalLanguage originalLanguage,
        String originalTitle,
        List<int> genreIds,
        String backdropPath,
        bool adult,
        String overview,
        String posterPath,
        double popularity,
        MediaType mediaType,
    }) => 
        Movie(
            id: id ?? this.id,
            video: video ?? this.video,
            voteCount: voteCount ?? this.voteCount,
            voteAverage: voteAverage ?? this.voteAverage,
            title: title ?? this.title,
            releaseDate: releaseDate ?? this.releaseDate,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            originalTitle: originalTitle ?? this.originalTitle,
            genreIds: genreIds ?? this.genreIds,
            backdropPath: backdropPath ?? this.backdropPath,
            adult: adult ?? this.adult,
            overview: overview ?? this.overview,
            posterPath: posterPath ?? this.posterPath,
            popularity: popularity ?? this.popularity,
            mediaType: mediaType ?? this.mediaType,
        );

    factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        id: json["id"] == null ? null : json["id"],
        video: json["video"] == null ? null : json["video"],
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        title: json["title"] == null ? null : json["title"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"] == null ? null : json["original_title"],
        genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        adult: json["adult"] == null ? null : json["adult"],
        overview: json["overview"] == null ? null : json["overview"],
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
        mediaType: json["media_type"] == null ? null : mediaTypeValues.map[json["media_type"]],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "video": video == null ? null : video,
        "vote_count": voteCount == null ? null : voteCount,
        "vote_average": voteAverage == null ? null : voteAverage,
        "title": title == null ? null : title,
        "release_date": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "original_language": originalLanguage == null ? null : originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle == null ? null : originalTitle,
        "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds.map((x) => x)),
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "adult": adult == null ? null : adult,
        "overview": overview == null ? null : overview,
        "poster_path": posterPath == null ? null : posterPath,
        "popularity": popularity == null ? null : popularity,
        "media_type": mediaType == null ? null : mediaTypeValues.reverse[mediaType],
    };
}

enum MediaType { MOVIE }

final mediaTypeValues = EnumValues({
    "movie": MediaType.MOVIE
});

enum OriginalLanguage { EN, KO }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "ko": OriginalLanguage.KO
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
