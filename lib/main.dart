import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex/change_notifier/fav_provider.dart';
import 'package:provider_ex/change_notifier/fav_item_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => FavoriteNotifier(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: FavoriteView()),
    );
  }
}
