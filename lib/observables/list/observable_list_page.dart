import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/observables/list/observable_list_controller.dart';

class ObservableListPage extends StatelessWidget {
  final controller = ObservableListController();

  ObservableListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observable List Page'),
      ),
      body: Column(children: [
        Expanded(
          child: Observer(
            builder: (BuildContext context) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final productName = controller.products[index].name;
                  return CheckboxListTile(
                    value: false,
                    onChanged: (_) {},
                    title: Text(productName),
                  );
                },
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () {
                  controller.addProduct();
                },
                child: const Text("Adicionar")),
            TextButton(
                onPressed: () {
                  controller.removeProduct();
                },
                child: const Text("Remover")),
            TextButton(
                onPressed: () {
                  controller.loadProducts();
                },
                child: const Text("Carregar")),
          ],
        ),
      ]),
    );
  }
}
