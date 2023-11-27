import 'package:mobx/mobx.dart';

class ContadorController {
  //no MOBX não se declara o valor 'int _counter'
  // int _counter;

  //se envolve ele em um Observavel se declara o tipo e define o valor.
  //para se disponibilizar para a paagina
  //campo observavel
  var _counter = Observable<int>(0);

//action do mobX
  late Action increment;
  ContadorController() {
    increment = Action(_incrementeCounter);
  }

  //criado o metodo get para se extrair '_counter.value' de uma forma mais facil de usar
  int get counter => _counter.value;

  //crial o metodo
  //action do mobX
  void _incrementeCounter() {
    _counter.value++;
  }


//por não ter campo observavel , não funcina, mesmo podendo ser implementado na tela
   void incrementX() {
    _counter.value++;
  }
}
