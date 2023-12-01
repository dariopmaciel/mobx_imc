// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelo_observable_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ModeloObservableListController
    on ModeloObservableListControllerBase, Store {
  late final _$productsAtom = Atom(
      name: 'ModeloObservableListControllerBase.products', context: context);

  @override
  ObservableList<ProductStore> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductStore> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$ModeloObservableListControllerBaseActionController =
      ActionController(
          name: 'ModeloObservableListControllerBase', context: context);

  @override
  void loadProducts() {
    final _$actionInfo = _$ModeloObservableListControllerBaseActionController
        .startAction(name: 'ModeloObservableListControllerBase.loadProducts');
    try {
      return super.loadProducts();
    } finally {
      _$ModeloObservableListControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void addProduct() {
    final _$actionInfo = _$ModeloObservableListControllerBaseActionController
        .startAction(name: 'ModeloObservableListControllerBase.addProduct');
    try {
      return super.addProduct();
    } finally {
      _$ModeloObservableListControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct() {
    final _$actionInfo = _$ModeloObservableListControllerBaseActionController
        .startAction(name: 'ModeloObservableListControllerBase.removeProduct');
    try {
      return super.removeProduct();
    } finally {
      _$ModeloObservableListControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void selectedProduct(int index) {
    final _$actionInfo =
        _$ModeloObservableListControllerBaseActionController.startAction(
            name: 'ModeloObservableListControllerBase.selectedProduct');
    try {
      return super.selectedProduct(index);
    } finally {
      _$ModeloObservableListControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
