import 'package:flutter/material.dart';

class ObservableListPage extends StatelessWidget {
  const ObservableListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observable List Page'),
      ),
      body: Column(children: [
        ListView(),
        Row(
          children: [
            TextButton(onPressed: () {}, child: const Text("Adicionar")),
            TextButton(onPressed: () {}, child: const Text("Remover")),
            TextButton(onPressed: () {}, child: const Text("Carregar")),
          ],
        ),
      ]),
    );
  }
}
