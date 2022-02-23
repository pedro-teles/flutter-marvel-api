class CharacterDetailResponse {
  CharacterDetailResponse(this.data);

  final CharacterDetailDataResponse data;

  factory CharacterDetailResponse.fromJson(Map<String, dynamic> json) =>
      CharacterDetailResponse(
        CharacterDetailDataResponse.fromJson(
          json['data'],
        ),
      );
}

class CharacterDetailDataResponse {
  CharacterDetailDataResponse(this.results);

  final List<CharacterDetailResultResponse>? results;

  factory CharacterDetailDataResponse.fromJson(Map<String, dynamic> json) =>
      CharacterDetailDataResponse(
        CharacterDetailResultResponse.fromJson(
          json['results'],
        ),
      );
}

class CharacterDetailResultResponse {
  CharacterDetailResultResponse(
      this.name, this.description, this.thumbnail, this.comics);

  final String? name;
  final String? description;
  final CharacterDetailThumbnailResponse thumbnail;
  final CharacterDetailComicsResponse comics;

  static List<CharacterDetailResultResponse> fromJson(List<dynamic> json) =>
      json
          .map((result) => CharacterDetailResultResponse(
              result['name'],
              result['description'],
              CharacterDetailThumbnailResponse.fromJson(result['thumbnail']),
              CharacterDetailComicsResponse.fromJson(result['comics'])))
          .toList();
}

class CharacterDetailThumbnailResponse {
  CharacterDetailThumbnailResponse(this.path, this.extension);

  final String? path;
  final String? extension;

  factory CharacterDetailThumbnailResponse.fromJson(
          Map<String, dynamic> json) =>
      CharacterDetailThumbnailResponse(
        json['path'],
        json['extension'],
      );
}

class CharacterDetailComicsResponse {
  CharacterDetailComicsResponse(this.available, this.items);

  final int? available;
  final List<CharacterDetailsComicsItemResponse>? items;

  factory CharacterDetailComicsResponse.fromJson(Map<String, dynamic> json) =>
      CharacterDetailComicsResponse(
        json['available'],
        json['items'],
      );
}

class CharacterDetailsComicsItemResponse {
  CharacterDetailsComicsItemResponse(this.resourceURI, this.name);

  final String? resourceURI;
  final String? name;

  static List<CharacterDetailsComicsItemResponse> fromJson(
          List<dynamic> json) =>
      json
          .map((item) => CharacterDetailsComicsItemResponse(
                item['resourceURI'],
                item['name'],
              ))
          .toList();
}
