// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contador_codegen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContadorCodeGenController on _ContadorCodeGenControllerBase, Store {
  Computed<String>? _$saudacaoComputed;

  @override
  String get saudacao =>
      (_$saudacaoComputed ??= Computed<String>(() => super.saudacao,
              name: '_ContadorCodeGenControllerBase.saudacao'))
          .value;

  late final _$counterAtom =
      Atom(name: '_ContadorCodeGenControllerBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$fullNameAtom =
      Atom(name: '_ContadorCodeGenControllerBase.fullName', context: context);

  @override
  FullName get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(FullName value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  late final _$_ContadorCodeGenControllerBaseActionController =
      ActionController(
          name: '_ContadorCodeGenControllerBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_ContadorCodeGenControllerBaseActionController
        .startAction(name: '_ContadorCodeGenControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ContadorCodeGenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter},
fullName: ${fullName},
saudacao: ${saudacao}
    ''';
  }
}
