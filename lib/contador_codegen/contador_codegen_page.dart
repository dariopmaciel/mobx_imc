import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/contador_codegen/contador_codegen_controller.dart';

class ContadorCodegenPage extends StatelessWidget {
  final controller = ContadorCodeGenController();

  ContadorCodegenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Contador MobX CodeGen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Você pressionou o botão esta quandidade de vezes:'),
            Observer(
              builder: (BuildContext context) {
                return Text(
                  '${controller.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Observer(builder: (_) {
              return Text(controller.fullName.first);
            }),
            Observer(
              builder: (_) => Text(controller.fullName.last),
            ),
            Observer(
              builder: (_) {
                return Text(controller.saudacao);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: ()=> controller.incrementX(),
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
