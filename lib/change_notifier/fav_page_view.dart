import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex/change_notifier/fav_provider.dart';

class FavoritesPageView extends StatelessWidget {
  const FavoritesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final response = context.watch<FavoriteNotifier>();
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: response.items.length,
        itemBuilder: (context, index) {
          final items = context.watch<FavoriteNotifier>().items;
          final item = items[index];
          return ListTile(
            title: Text(item),
            trailing: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                response.toggleFavorities(item);
              },
            ),
          );
        },
      ),
    );
  }
}
