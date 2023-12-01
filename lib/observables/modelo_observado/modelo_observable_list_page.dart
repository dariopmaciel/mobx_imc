import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/observables/modelo_observado/modelo_observable_list_controller.dart';

class ModeloObservableListPage extends StatelessWidget {
  ModeloObservableListPage({super.key});

  //  final controller = ObservableListController();
  final controller = ModeloObservableListController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modelo Observable List Page'),
      ),
      body: Column(children: [
        Expanded(
          child: Observer(
            builder: (BuildContext context) {
              print("LISTAAAAAAAAAAAAAAAAA");
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final productStore = controller.products[index];
                  // final productName = controller.products[index].name;
                  //* Para que funcione PRECISA estar encapsuladoi por um 'Observer' e em um action no controller
                  return Observer(
                    builder: (_) {
                      print("ITEM INTERNOOOOOOOOOOOOOOOO ${productStore.product.name}");
                      return CheckboxListTile(
                        value: productStore.selected,
                        // value: false,
                        onChanged: (_) {
                          controller.selectedProduct(index);
                        },
                        title: Text(productStore.product.name),
                        // title: Text(productName),
                      );
                    },
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
