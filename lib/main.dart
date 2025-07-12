import 'package:flutter/material.dart';
import 'package:http_and_provider/home_app.dart';
import 'package:http_and_provider/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyProvider());
}

class MyProvider extends StatelessWidget {
  const MyProvider({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Inyectando
    return MultiProvider(
      providers: [
        //TODO: Instanciado                                TODO: Carga perezosa
        ChangeNotifierProvider(create: (_) => MovieProvider(), lazy: false),
      ],
      child: MainApp(), // lazy Load
    );
    
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
      theme: ThemeData.light(),
    );
  }
}
