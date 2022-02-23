import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  CharacterDetailScreen({
    required this.characterId,
    required this.characterName,
  });

  final int characterId;
  final String characterName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(characterName),
      ),
      body: const Center(
        child: Text('Not Yet Implemented'),
      ),
    );
  }
}
