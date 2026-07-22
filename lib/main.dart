import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/app.dart';
import 'package:rick_and_morty/core/di/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  runApp(const App());
}
