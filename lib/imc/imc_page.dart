import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/imc/imc_controller.dart';
import 'package:mobx_imc/widgets/imc_gauge.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final controller = ImcController();
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //*DAQUI
  final reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    final reactionErrorDisposer =
        reaction<bool>((_) => controller.hasError, (hasError) {
      if (hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(controller.error ?? "ERROR!!!"),
          ),
        );
      }
    });
    reactionDisposer.add(reactionErrorDisposer);
  }

  @override
  void dispose() {
    super.dispose();
    reactionDisposer.forEach((error) => error);
  }

//* ATÉ AQUI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC MobX'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Observer(
                    builder: (BuildContext context) {
                      return ImcGauge(imc: controller.imc);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    controller: pesoEC,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Peso"),
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        locale: 'pt_Br',
                        symbol: '',
                        turnOffGrouping: true,
                        decimalDigits: 2,
                      ),
                    ],
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) => validacao(),
                    // {
                    //   var formValid = formKey.currentState?.validate() ?? false;
                    //   if (formValid) {
                    //     var formatter = NumberFormat.simpleCurrency(
                    //       locale: 'pt_BR',
                    //       decimalDigits: 2,
                    //     );
                    //     double peso = formatter.parse(pesoEC.text) as double;
                    //     double altura =
                    //         formatter.parse(alturaEC.text) as double;
                    //     controller.calcularImc(peso: peso, altura: altura);
                    //   }
                    // },
                    textAlign: TextAlign.center,
                    controller: alturaEC,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Altura"),
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        locale:
                            "pt_BR", //virgula ao invés de ponto nas casa decimal
                        symbol: "",
                        decimalDigits: 2, // máximo de 2 casas decimais
                        turnOffGrouping: false,
                        //ponto para mil 000.000.000
                      )
                    ],
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return '*OBRIGATORIO';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => validacao(),
                    // {
                    //   var formValid = formKey.currentState?.validate() ?? false;
                    //   if (formValid) {
                    //     var formatter = NumberFormat.simpleCurrency(
                    //       locale: 'pt_BR',
                    //       decimalDigits: 2,
                    //     );
                    //     double peso = formatter.parse(pesoEC.text) as double;
                    //     double altura =
                    //         formatter.parse(alturaEC.text) as double;
                    //     controller.calcularImc(peso: peso, altura: altura);
                    //   }
                    // },
                    child: const Text("Calcular IMC"),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void validacao() {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      var formatter = NumberFormat.simpleCurrency(
        locale: 'pt_BR',
        decimalDigits: 2,
      );
      double peso = formatter.parse(pesoEC.text) as double;
      double altura = formatter.parse(alturaEC.text) as double;
      controller.calcularImc(peso: peso, altura: altura);
    }
  }
}
