import 'result.dart';

class MovieModel {
	int? page;
	List<Result>? results;
	int? totalPages;
	int? totalResults;

	MovieModel({this.page, this.results, this.totalPages, this.totalResults});

	factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
				page: json['page'] as int?,
				results: (json['results'] as List<dynamic>?)
						?.map((e) {
                          return Result.fromJson(e as Map<String, dynamic>);
                        })
						.toList(),
				totalPages: json['total_pages'] as int?,
				totalResults: json['total_results'] as int?,
			);
}
