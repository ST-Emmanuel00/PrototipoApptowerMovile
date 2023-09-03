import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widgets/input.dart';
import '../widgets/selectInput.dart';

void main() => runApp(Residentes());

class Residentes extends StatefulWidget {
  Residentes({super.key});

  @override
  State<Residentes> createState() => _ResidentesState();
}

class _ResidentesState extends State<Residentes> {
  String mensaje = "";
  TextEditingController tipo_documento_residente = TextEditingController();
  TextEditingController nomnumero_documento_residentebre =
      TextEditingController();
  TextEditingController nombre_residente = TextEditingController();
  TextEditingController apellido_residente = TextEditingController();
  TextEditingController fecha_nacimiento = TextEditingController();
  TextEditingController genero_residente = TextEditingController();
  TextEditingController telefono_residente = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController tipo_residente = TextEditingController();
  TextEditingController residencia = TextEditingController();
  TextEditingController habita = TextEditingController();
  TextEditingController fecha_inicio = TextEditingController();
  TextEditingController fecha_fin = TextEditingController();
  TextEditingController estado = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crear residentes',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(248, 249, 250, 1),
          elevation: 0,
          title: Text("Residentes", style: AppTheme.textStyle),
          actions: [
            IconButton(
                onPressed: () {
                  final route = MaterialPageRoute(
                      builder: (context) =>
                          const Text("Cambiar por un Screen"));
                  Navigator.push(context, route);
                },
                icon: const Icon(
                  Icons.logout,
                  color: AppTheme.ApptowerBlue,
                ))
          ],
        ),
        body: Center(
          child: ListView(
            children: [
              InputSelect(
                  titulo: "Tipo de documento",
                  controller: tipo_documento_residente,
                  lista: const [
                    "Cedula ciudadania",
                    "Tarjeta de indetidad",
                    "Tarjeta de identidad"
                  ]),
              InputSelect(
                  lista: const ["Masculino", "Femenino", "Otro"],
                  titulo: "Genero",
                  controller: genero_residente),
              Input(
                  hintText: "Ingrese numero de documento",
                  labelText: "Numero de documento",
                  controlador: nomnumero_documento_residentebre),
              Input(
                  hintText: "Ingrese el nombre",
                  labelText: "Nombre residente",
                  controlador: nombre_residente),
              Input(
                  hintText: "Ingrese apellido",
                  labelText: "Apellidos residente",
                  controlador: apellido_residente),
              Input(
                  hintText: "Ingrese fecha de nacimiento",
                  labelText: "Fecha de nacimiento",
                  controlador: fecha_nacimiento),

              Input(
                  hintText: "Ingrese su telefono",
                  labelText: "Telefono",
                  controlador: telefono_residente),

              Input(
                  hintText: "Ingrese su correo",
                  labelText: "Correo",
                  controlador: correo),
              
              Input(
                  hintText: "Ingrese su correo",
                  labelText: "Correo",
                  controlador: correo),

              // Boton del formulario

              Padding(
                padding: AppTheme.selectPading,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppTheme.ApptowerBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      elevation: 4.0, // Ajusta el valor según tu preferencia
                      minimumSize: const Size(double.infinity,
                          50), // Ancho y alto mínimos del botón
                    ),
                    child: const Text("Registrar Residente"),
                    onPressed: () {
                      mensaje = "Le diste click";

                      setState(() {});
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                    child: Column(
                  children: [
                    Text(mensaje),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
