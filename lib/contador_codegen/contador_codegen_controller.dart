//para ser uma clsse mobX de geração de codigo

//fu-mobx-store

import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/full_name.dart';
part 'contador_codegen_controller.g.dart';

class ContadorCodeGenController = _ContadorCodeGenControllerBase
    with _$ContadorCodeGenController;

abstract class _ContadorCodeGenControllerBase with Store {
  @observable
  var counter = 0;
  @observable
  var fullName = FullName(first: "first", last: "last");

  @computed
  String get saudacao => 'Olá ${fullName.first} $counter';

  @action
  void increment() {
    counter++;
    // fullName = fullName.copyWith(first: "Dario", last: "P Maciel");
  }

  @action
  void changeName() {
    fullName = fullName.copyWith(first: "Dario", last: "P Maciel");
  }

  @action
  void rollBackName() {
    fullName = fullName.copyWith(first: "First", last: "last");
    
  }
}
