import 'package:mobx/mobx.dart';

class ContadorController {
  //no MOBX não se declara o valor 'int _counter'
  // int _counter;

  //se envolve ele em um Observavel se declara o tipo e define o valor.
  //para se disponibilizar para a paagina
  //campo observavel
  final _counter = Observable<int>(0, name: "Counter Observable");
  final _fullName =
      Observable<FullName>(FullName(first: 'first', last: 'last'));

//action do mobX
  late Action increment;
  ContadorController() {
    increment = Action(_incrementeCounter);
  }

  //criado o metodo get para se extrair '_counter.value' de uma forma mais facil de usar
  int get counter => _counter.value;
  FullName get fullName => _fullName.value;

  //cria o metodo
  //action do mobX
  void _incrementeCounter() {
    _counter.value++;
    print("Antes");
    print(_fullName.value.hashCode);
    // ! ESTE ABAIXO ESTA ERRADO 
    // ! NÃO PODE PEGAR O OBJETO E ALTERAR OS ATRIBUTOS DELE
    // _fullName.value.first = "Dario";
    // _fullName.value.last = "P Maciel";
    
    // ! CORRETO 
    _fullName.value = FullName(first: "Dario", last: "P Maciel");
    print("Depois");
    print(_fullName.value.hashCode);
  }

//por não ter campo observavel , não funcina, mesmo podendo ser implementado na tela
  void incrementX() {
    _counter.value++;
  }
}

class FullName {
  String first;
  String last;
  FullName({
    required this.first,
    required this.last,
  });
}
