// ignore_for_file: must_be_immutable

import 'package:apptower/theme/theme.dart';
import 'package:flutter/material.dart';

class InputSelect extends StatelessWidget {
  
  List<String> lista = [];
  final String titulo;
  final TextEditingController controller;
  

  InputSelect({super.key, required this.lista, required this.titulo, required this.controller});
  TextEditingController controlador = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.selectPading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo, style: AppTheme.textStyle),
          DropdownButton(
              isExpanded: true,
              // value: const Text("Seleccione una opcion"),
              items: lista.map((tipos) {
                return DropdownMenuItem(value: tipos, child: Text(tipos));
              }).toList(),
              onChanged: (tipos) {
                controlador = controller;
                controlador = tipos as TextEditingController;
                print("Selecciono: $controlador");
              }),
        ],
      ),
    );
  }
}
