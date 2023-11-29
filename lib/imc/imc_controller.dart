import 'dart:math';

import 'package:mobx/mobx.dart';
part 'imc_controller.g.dart';

class ImcController = ImcControllerBase with _$ImcController;

abstract class ImcControllerBase with Store {
  @observable
  double imc = 0.0;

  @action
  Future<void> calcularImc({
    required double peso,
    required double altura,
  }) async {
    imc = 0;
    // imc = peso / (altura * altura);
    await Future.delayed(const Duration(seconds: 1));
    imc = peso / pow(altura, 2);
  }
}
