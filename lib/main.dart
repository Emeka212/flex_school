import 'package:flutter/material.dart';
import './routes/routes.dart' as route;
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>("user");
  await Hive.openBox<String>("parent");
  await Hive.openBox<bool>("isDarkTheme");
  runApp(
    MaterialApp(
      initialRoute: route.indexPage,
      navigatorKey: route.navigatorKey,
      onGenerateRoute: route.controller,
      debugShowCheckedModeBanner: false,
    ),
  );
}
