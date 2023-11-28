// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/contador_codegen/contador_codegen_controller.dart';

class ContadorCodegenPage extends StatefulWidget {
  const ContadorCodegenPage({Key? key}) : super(key: key);

  @override
  State<ContadorCodegenPage> createState() => _ContadorCodegenPageState();
}

class _ContadorCodegenPageState extends State<ContadorCodegenPage> {
  final controller = ContadorCodeGenController();
  final reactionsDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();

    //O 'autorun' fica escutando as variaveis que estão sendo usadas dentro dele
    //
    // como caracteristica irá rodar sempre que for carregado
    // e sempre vai rodar quando algum dos 'observaveis' for alterado tb.
    final autoRunDisposer = autorun((_) {
      print("------------------AUTO RUN------------------");
      print(controller.fullName.first);
      // print(controller.fullName.last);
    });

    //*REACTION nós falamos par ao mobx qual atributo observavel que queremos observar
    final reactionDisposer = reaction((_) => controller.counter, (counter) {
      print("------------------REACTION------------------");
      print(counter);
    });

    final whenDisposer = when((_) => controller.fullName.first == 'Dario', () {
      print("------------------REACTION------------------");
      print(controller.fullName.first);
    });

    //aqui alimenta-se a lista 'reactionsDisposer' como todas as REACTIONS 'autoRunDisposer' para dispose
    reactionsDisposer.add(autoRunDisposer);
    reactionsDisposer.add(reactionDisposer);
    reactionsDisposer.add(whenDisposer);
  }

  @override
  void dispose() {
    super.dispose();
    //aqio se da disposer para elas
    reactionsDisposer.forEach((reaction) => reaction());
  }

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
            Observer(builder: (_) => Text(controller.fullName.first)),
            Observer(builder: (_) => Text(controller.fullName.last)),
            Observer(builder: (_) => Text(controller.saudacao)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => controller.changeName(),
                    child: const Text('TROCAR NOME')),
                TextButton(
                    onPressed: () => controller.rollBackName(),
                    child: const Text('VOLTAR NOME')),
              ],
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
