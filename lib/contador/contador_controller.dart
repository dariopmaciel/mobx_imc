import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/full_name.dart';

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
  late Computed _saudacaoComputed;

  ContadorController() {
    increment = Action(_incrementeCounter);
    _saudacaoComputed = Computed(() => 'Olá ${_fullName.value.first} ${counter}');
  }

  //criado o metodo get para se extrair '_counter.value' de uma forma mais facil de usar
  int get counter => _counter.value;
  FullName get fullName => _fullName.value;

  //*Funcionar funciona mas não é o ideal
  // String get saudacao => 'Olá ${_fullName.value.first}';
  //*O IDEAL
  String get saudacao => _saudacaoComputed.value;

  //cria o metodo
  //action do mobX
  void _incrementeCounter() {
    _counter.value++;
    print("Antes");
    print(_fullName.value.hashCode);
    // ! ESTE ABAIXO ESTÁ ERRADO
    // ! NÃO PODE PEGAR O OBJETO E ALTERAR OS ATRIBUTOS DELE
    // _fullName.value.first = "Dario";
    // _fullName.value.last = "P Maciel";

    // * CORRETO = > Cria se um novo 'objeto'
    // _fullName.value = FullName(first: "Dario", last: "P Maciel");
    //! OU
    //* CORRETO = > Cria se um 'copy with'
    _fullName.value = _fullName.value.copyWith(first: "Dario", last: "Maciel");

    print("Depois");
    print(_fullName.value.hashCode);
  }

//por não ter campo observavel , não funcina, mesmo podendo ser implementado na tela
  void incrementX() {
    _counter.value++;
  }
}

// class FullName {
//   String first;
//   String last;
//   FullName({
//     required this.first,
//     required this.last,
//   });

//   FullName copyWith({
//     String? first,
//     String? last,
//   }) {
//     return FullName(
//       first: first ?? this.first,
//       last: last ?? this.last,
//     );
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is FullName && other.first == first && other.last == last;
//   }

//   @override
//   int get hashCode => first.hashCode ^ last.hashCode;
// }
