import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex/change_notifier/fav_page_view.dart';
import 'package:provider_ex/change_notifier/fav_provider.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    List<String> _randomItems() => nouns.take(10).toList();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FavoritesPageView(),
            ),
          );
        },
        child: Icon(Icons.favorite),
      ),
      body: ListView.builder(
        itemCount: _randomItems().length,
        itemBuilder: (context, index) {
          final items = _randomItems();
          final item = items[index];
          return ListTile(
            title: Text(item),
            trailing: IconButton(
              icon: Icon(
                context.watch<FavoriteNotifier>().isExist(item)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              onPressed: () {
                context.read<FavoriteNotifier>().toggleFavorities(item);
              },
            ),
          );
        },
      ),
    );
  }
}
