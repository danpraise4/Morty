import 'package:flutter/material.dart';
import 'package:morty/app.dart';
import 'package:morty/core/apis/api_base.dart';
import 'package:morty/core/resources/enum.dart';
import 'package:morty/core/storage/storage.dart';

Future<void> main() async {
  // init local storage
  await initStorage();

  // init api enviroment
  initApi(Environment.development);

  runApp(const MortyApp());
}
