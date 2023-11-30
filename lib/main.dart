import 'package:flutter/material.dart';

import 'package:mobx_imc/imc/imc_page.dart';
import 'package:mobx_imc/observables/list/observable_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // home: const ImcPage(),
      home: ObservableListPage(),
    );
  }
}
