class Character {
  Character({
    required this.id,
    required this.name,
    this.description = '',
    required this.thumbnailPath,
    this.comics = const [],
  });

  final int id;
  final String name;
  final String description;
  final String thumbnailPath;
  final List<Comic> comics;
}

class Comic {
  Comic(this.resourceUri, this.name);

  final String resourceUri;
  final String name;
}
