import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/product_model.dart';
part 'observable_list_controller.g.dart';

class ObservableListController = ObservableListControllerBase
    with _$ObservableListController;

abstract class ObservableListControllerBase with Store {
  @observable
  // var products = <ProductModel>[];
  //*Com isto se observa dentro da lista e seus itens que são alterados
  ObservableList products = ObservableList();
  //*ou usar assim mbas as maneiras estão corretas
  // var products = <ProductModel>[].asObservable();

  @action
  void loadProducts() {
    //! Não funciona pq o '@observable' está observando o 'products' e não o '[]'
    //*Sendo necessário clocar os itens dentro de outra variavel para inser na lista
    // products.addAll([
    //   ProductModel(name: "Computador"),
    //   ProductModel(name: "Celular"),
    //   ProductModel(name: "Teclado"),
    //   ProductModel(name: "Mouse"),
    // ]);

    var productsData = ([
      ProductModel(name: "Computador"),
      ProductModel(name: "Celular"),
      ProductModel(name: "Teclado"),
      ProductModel(name: "Mouse"),
    ]);
    // products = productsData;
    //*Com isto se observa dentro da lista e seus itens que são alterados
    products.addAll(productsData);
  }

  @action
  void addProduct() {
    products.add(ProductModel(name: "Computador 2"));
  }

  @action
  void removeProduct() {
    products.removeAt(0);
  }
}
