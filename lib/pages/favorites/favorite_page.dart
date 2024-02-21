import 'package:flutter/material.dart';
import 'package:lab1/main.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet'),
      );
    }
    return ListView(
      children: [
        FloatingActionButton(
          onPressed: () {
            appState.clearFavorites();
          },
          child: Text('Remove All'),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Favorites'),
        ),
        for (var pair in appState.favorites)
          Card(
            child: ListTile(
              title: Text(pair.asLowerCase),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  appState.removeFavorite(pair);
                },
              ),
            ),
          ),
      ],
    );
  }
}
