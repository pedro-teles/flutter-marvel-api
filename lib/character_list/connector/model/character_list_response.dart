class CharacterListResponse {
  CharacterListResponse({this.characterData});

  CharacterResponseData? characterData;

  factory CharacterListResponse.fromJson(Map<String, dynamic> json) =>
      CharacterListResponse(
          characterData: CharacterResponseData.fromJson(json['data']));
}

class CharacterResponseData {
  CharacterResponseData({this.results});

  List<CharacterResultResponse>? results;

  factory CharacterResponseData.fromJson(Map<String, dynamic> json) =>
      CharacterResponseData(
          results: CharacterResultResponse.fromJson(json['results']));
}

class CharacterResultResponse {
  CharacterResultResponse({this.id, this.name, this.thumbnail});

  int? id;
  String? name;
  CharacterThumbnailResponse? thumbnail;

  static List<CharacterResultResponse> fromJson(List<dynamic> json) => json
      .map(
        (result) => CharacterResultResponse(
          id: result['id'],
          name: result['name'],
          thumbnail: CharacterThumbnailResponse.fromJson(
            result['thumbnail'],
          ),
        ),
      )
      .toList();
}

class CharacterThumbnailResponse {
  CharacterThumbnailResponse({this.path, this.extension});

  String? path;
  String? extension;

  factory CharacterThumbnailResponse.fromJson(Map<String, dynamic> json) =>
      CharacterThumbnailResponse(
        path: json['path'],
        extension: json['extension'],
      );
}
