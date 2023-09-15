import 'package:apptower/controller/controllerEspacios.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import '../../widgets/DrawerApptower.dart';
import '../../widgets/input.dart';
import 'Espacios.dart';

// void main() => runApp(EditEspacios());

class EditEspacios extends StatefulWidget {
  final Map<String, dynamic> espacios;

  EditEspacios({super.key, required this.espacios});

  @override
  State<EditEspacios> createState() => _ResidentesState();
}

class _ResidentesState extends State<EditEspacios> {
  var controllador = ControllerEspacios();

  String mensaje = "";

  TextEditingController tipo_espacio = TextEditingController();
  TextEditingController nombre_espacio = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController capacidad = TextEditingController();
  TextEditingController estado = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updateFields();
  }

  _updateFields() {
    tipo_espacio.text = widget.espacios['tipo_espacio'];
    nombre_espacio.text = widget.espacios['nombre_espacio'];
    area.text = widget.espacios['area'] == null ? "" : widget.espacios['area'];
    capacidad.text = widget.espacios['capacidad'] == null
        ? ""
        : widget.espacios['capacidad'];
    estado.text = widget.espacios['estado'];
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
            iconTheme: const IconThemeData(color: AppTheme.ApptowerBlue)),
        drawer: const ApptowerDrawer(),
        body: Center(
          child: ListView(
            children: [
              Input(
                  hintText: "Ingrese tipo de espacio",
                  labelText: "Tipo de espacio",
                  controlador: tipo_espacio),
              Input(
                  hintText: "Nombre espacio",
                  labelText: "Nombre espacio",
                  controlador: nombre_espacio),
              Input(
                  hintText: "Ingrese area",
                  labelText: "Area",
                  controlador: area),
              Input(
                  hintText: "Ingrese capacidad",
                  labelText: "Capacidad",
                  controlador: capacidad),
              Input(
                  hintText: "Ingrese estado",
                  labelText: "Estado",
                  controlador: estado),

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
                    final Map<String, dynamic> espacioModificado = {
                      "_id": widget.espacios['_id'],
                      "tipo_espacio": tipo_espacio.text,
                      "nombre_espacio": nombre_espacio.text,
                      "area": area.text,
                      "capacidad": capacidad.text,
                      "estado": estado.text
                    };

                    try {
                      await controllador.actualizarRegistro(espacioModificado);

                      print("Le diste click en actualizar");

                      setState(() {});

                      final route =
                          MaterialPageRoute(builder: (context) => Espacios());
                      Navigator.push(context, route);
                    } catch (e) {
                      print('Error al agregar residentes: $e');
                    }

                    print(espacioModificado);
                  },

                  child: const Text("Actualizar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
