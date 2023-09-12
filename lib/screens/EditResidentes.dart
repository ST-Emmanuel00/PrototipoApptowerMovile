import 'package:flutter/material.dart';

import '../controller/contollerResientes.dart';
import '../theme/theme.dart';
import '../widgets/input.dart';
import 'Residentes.dart';

// void main() => runApp(EditResidentes());

class EditResidentes extends StatefulWidget {
  final Map<String, dynamic> residente;

  EditResidentes({super.key, required this.residente});

  @override
  State<EditResidentes> createState() => _ResidentesState();
}

class _ResidentesState extends State<EditResidentes> {
  var controllador = ControllerResidentes();

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
  void initState() {
    super.initState();
    _updateFields();
  }

  _updateFields() {
    tipo_documento_residente.text = widget.residente['tipo_documento_residente'];
    nomnumero_documento_residentebre.text =
        widget.residente['numero_documento_residente'];
    nombre_residente.text = widget.residente['nombre_residente'];
    apellido_residente.text = widget.residente['apellido_residente'];
    fecha_nacimiento.text = widget.residente['fecha_nacimiento'];
    genero_residente.text = widget.residente['genero_residente'];
    telefono_residente.text = widget.residente['telefono_residente'];
    correo.text = widget.residente['correo'];
    tipo_residente.text = widget.residente['tipo_residente'];
    residencia.text = widget.residente['residencia'];
    // habita.text = widget.residente['habita'];
    fecha_inicio.text = widget.residente['fecha_inicio'];
    fecha_fin.text = widget.residente['fecha_fin'];

    estado.text = widget.residente['estado'];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editar residente',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(248, 249, 250, 1),
          elevation: 0,
          title: const Text("Residentes", style: AppTheme.textStyle),
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
              Input(
                  hintText: "Ingrese el tipo de documento",
                  labelText: "Tipo de documento",
                  controlador: tipo_documento_residente),
              Input(
                  hintText: "Ingrese el sexo",
                  labelText: "Sexo",
                  controlador: genero_residente),
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
                hintText: "Ingrese su tipo de residente",
                labelText: "Tipo de residente",
                controlador: tipo_residente,
              ),

              Input(
                hintText: "Ingrese su lugar de residencia",
                labelText: "Residencia",
                controlador: residencia,
              ),

              Input(
                hintText: "Ingrese el número de la habitación",
                labelText: "Habitación",
                controlador: habita,
              ),

              Input(
                hintText: "Ingrese la fecha de inicio",
                labelText: "Fecha de inicio",
                controlador: fecha_inicio,
              ),

              Input(
                hintText: "Ingrese la fecha de fin",
                labelText: "Fecha de fin",
                controlador: fecha_fin,
              ),

              Input(
                hintText: "Ingrese el estado",
                labelText: "Estado",
                controlador: estado,
              ),

              // Boton del formulario

              Padding(
                padding: AppTheme.selectPading,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppTheme.ApptowerBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    elevation: 4.0,
                    minimumSize: const Size(double.infinity, 50),
                  ),

                  // Funcion de Elevatedbutton para cambiar de vista

                  onPressed: () async {
                    final Map<String, dynamic> ResidenteNuevo = {
                      "_id": widget.residente['_id'],
                      "tipo_documento_residente": tipo_documento_residente.text,
                      "numero_documento_residente":
                          nomnumero_documento_residentebre.text,
                      "nombre_residente": nombre_residente.text,
                      "apellido_residente": apellido_residente.text,
                      "fecha_nacimiento": "2000-04-28",
                      "genero_residente": genero_residente.text,
                      "telefono_residente": telefono_residente.text,
                      "correo": correo.text,
                      "tipo_residente": tipo_residente.text,
                      "residencia": "null",
                      "habita": true,
                      "fecha_inicio": "2000-04-28",
                      "fecha_fin": "2022-06-28",
                      "estado": estado.text
                    };

                    try {
                      await controllador.actualizarRegistro(ResidenteNuevo);

                      print("Le diste click en actualizar");

                      setState(() {});

                      final route =
                          MaterialPageRoute(builder: (context) => Residentes());
                      Navigator.push(context, route);
                    } catch (e) {
                      print('Error al agregar residentes: $e');
                    }

                    print(ResidenteNuevo);
                  },

                  child: const Text("Actualizar"),
                ),
              ),

              // TextButton(
              //     child: const Text("Guardar"),
              //     onPressed: () async {
              //       final Map<String, dynamic> ResidenteNuevo = {
              //         "tipo_documento_residente": tipo_documento_residente.text,
              //         "numero_documento_residente":
              //             nomnumero_documento_residentebre.text,
              //         "nombre_residente": nombre_residente.text,
              //         "apellido_residente": apellido_residente.text,
              //         "fecha_nacimiento": "2000-04-28",
              //         "genero_residente": genero_residente.text,
              //         "telefono_residente": telefono_residente.text,
              //         "correo": correo.text,
              //         "tipo_residente": tipo_residente.text,
              //         "residencia": "null",
              //         "habita": true,
              //         "fecha_inicio": "2000-04-28",
              //         "fecha_fin": "2022-06-28",
              //         "estado": estado.text
              //       };

              //       try {
              //         await registro.agregarRegistro(ResidenteNuevo);
              //         // Navigator.of(context).pop(); //Volver a la navegacion anterior

              //         print("Le diste click en guardar");

              //         // final route = MaterialPageRoute(
              //         //     builder: (context) => Residentes());
              //         // Navigator.push(context, route);

              //         setState(() {});

              //         // Cierra el modal después de que la solicitud POST se complete con éxito
              //       } catch (e) {
              //         print('Error al agregar residentes: $e');
              //       }
              //       print(ResidenteNuevo);
              //     })
            ],
          ),
        ),
      ),
    );
  }
}
