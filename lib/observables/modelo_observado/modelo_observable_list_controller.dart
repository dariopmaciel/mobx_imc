import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/product_model.dart';
import 'package:mobx_imc/observables/modelo_observado/model/product_store.dart';
part 'modelo_observable_list_controller.g.dart';

class ModeloObservableListController = ModeloObservableListControllerBase
    with _$ModeloObservableListController;

abstract class ModeloObservableListControllerBase with Store {
  @observable
  // var products = <ProductModel>[];
  //*Com isto se observa dentro da lista e seus itens que são alterados
  // ObservableList products = ObservableList();
  //*ou usar assim! ambas as maneiras estão corretas
  // var products = <ProductModel>[].asObservable();
  //*Alterado para ProductStore para encapsular a o item + o bool
  var products = <ProductStore>[].asObservable();

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
      //*encapsulado
      ProductStore(product: ProductModel(name: "Computador"), selected: false),
      ProductStore(product: ProductModel(name: "Celular"), selected: false),
      ProductStore(product: ProductModel(name: "Teclado"), selected: false),
      ProductStore(product: ProductModel(name: "Mouse"), selected: false),

      // ProductModel(name: "Computador"),
      // ProductModel(name: "Celular"),
      // ProductModel(name: "Teclado"),
      // ProductModel(name: "Mouse"),
    ]);
    // products = productsData;
    //*Com isto se observa dentro da lista e seus itens que são alterados
    products.addAll(productsData);
  }

  @action
  void addProduct() {
    //products.add(ProductModel(name: "Computador 2"));
    //*uma ves encapsulado é assim que fica
    products.add(ProductStore(
        product: ProductModel(name: "Computador 2"), selected: false));
  }

  @action
  void removeProduct() {
    products.removeAt(0);
  }

  @action
  void selectedProduct(int index){
    //*ativar o checkbox
    var productsSelected = products[index].selected;
    //*maneira de desativar o bool
    products[index].selected = !productsSelected;
  }
}
