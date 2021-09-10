import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../application/favorites/favorites_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../../domain/entities/media.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  static final _store = locator<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _store.favoritesBox.listenable(),
        builder: (_, Box box, child) {
          // return ListView.builder(
          //   itemCount: box.values.length,
          //   itemBuilder: (_, int index) {
          //     return Text('Item at index $index');
          //   },
          // );
          var mediaList = List<Media>.from(box.values);
          return ListView(
            children: [
              ...mediaList.map(
                (media) => ListTile(
                  title: Text(media.title),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
