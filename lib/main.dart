import 'package:flutter/material.dart';
import 'package:flutter_instagram_example/src/ui/app/app.dart';
import 'package:flutter_instagram_example/src/ui/app/app_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppViewModel(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          appBarTheme: AppBarTheme(elevation: 0.0),
          colorScheme: const ColorScheme.light(primary: Colors.white, secondary: Colors.black)),
        home: App(),
      ),
    );
  }
}