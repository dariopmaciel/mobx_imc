//para ser uma clsse mobX de geração de codigo

import 'package:mobx/mobx.dart';
part 'contador_codegen_controller.g.dart';

class ContadorCodeGenController = _ContadorCodeGenControllerBase
    with _$ContadorCodeGenController;

abstract class _ContadorCodeGenControllerBase with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }
}
