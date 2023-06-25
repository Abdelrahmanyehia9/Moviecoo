class Result {
	bool? adult;
	String? backdropPath;
	List<dynamic>? genreIds;
	int? id;
	String? originalLanguage;
	String? originalTitle;
	String? overview;
	double? popularity;
	String? posterPath;
	String? releaseDate;
	String? title;
	bool? video;
	double? voteAverage;
	int? voteCount;

	Result({
		this.adult, 
		this.backdropPath, 
		this.genreIds, 
		this.id, 
		this.originalLanguage, 
		this.originalTitle, 
		this.overview, 
		this.popularity, 
		this.posterPath, 
		this.releaseDate, 
		this.title, 
		this.video, 
		this.voteAverage, 
		this.voteCount, 
	});

	factory Result.fromJson(Map<String, dynamic> json) => Result(
				adult: json['adult'] as bool?,
				backdropPath: json['backdrop_path'] as String?,
				genreIds: json['genre_ids'] as List<dynamic>?,
				id: json['id'] as int?,
				originalLanguage: json['original_language'] as String?,
				originalTitle: json['original_title'] as String?,
				overview: json['overview'] as String?,
				popularity: (json['popularity'] as num?)?.toDouble(),
				posterPath: json['poster_path'] as String?,
				releaseDate: json['release_date'] as String?,
				title: json['title'] as String?,
				video: json['video'] as bool?,
				voteAverage: (json['vote_average'] as num?)?.toDouble(),
				voteCount: json['vote_count'] as int?,
			);
}