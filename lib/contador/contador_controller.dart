import 'package:mobx/mobx.dart';

class ContadorController {
  //no MOBX não se declara o valor 'int _counter'
  // int _counter;
  //se envolve ele em um Observavel se declara o tipo e define o valor.
  //para se disponibilizar para a paagina
  var _counter = Observable<int>(0);

  late Action increment;
  ContadorController() {
    increment = Action(_incrementeCounter);
  }

  //criado o metodo get para se extrair '_counter.value' de uma forma mais facil de usar
  int get counter => _counter.value;

  //crial o metodo
  void _incrementeCounter() {
    _counter.value++;
  }
}
