class Character {
  Character(this.id, this.name, this.thumbnailPath, this.comics);

  final int id;
  final String name;
  final String thumbnailPath;
  final List<Comic> comics;
}

class Comic {
  Comic(this.resourceUri, this.name);

  final String resourceUri;
  final String name;
}
