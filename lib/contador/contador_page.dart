import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/contador/contador_controller.dart';

class ContadorPage extends StatelessWidget {
  final controller = ContadorController();

  ContadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Contador MobX"),
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
              builder: (_) {
                return Text(controller.fullName.last);
              },
            ),
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
