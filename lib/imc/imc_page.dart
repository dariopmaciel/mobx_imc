import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                  // ImcGauge(imc:controller.imc),
                  const SizedBox(height: 20),
                  TextFormField(
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
                  TextFormField(),
                ],
              )),
        ),
      ),
    );
  }
}
