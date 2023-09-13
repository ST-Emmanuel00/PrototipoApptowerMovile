import 'package:apptower/controller/controllerEspacios.dart';
import 'package:apptower/screens/ViewsEspacios/EditEspacios.dart';
import 'package:apptower/screens/ViewsEspacios/Espacios.dart';
import 'package:flutter/material.dart';
import '../theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

class EspaciosCard extends StatelessWidget {
  const EspaciosCard({
    Key? key,
    required this.espacio,
  }) : super(key: key);

  final Map<String, dynamic> espacio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(70, 10, 70, 5),
      child: Container(
        height: 260,
        width: 100,
        child: Card(
          elevation: 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 80,
                  width: 80, // Ancho y alto para el círculo
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(
                      espacio['tipo_espacio'] == 'PARQUEADERO'
                          ? Icons.car_crash
                          : espacio['tipo_espacio'] == 'SALON_SOCIAL'
                              ? Icons.meeting_room
                              : Icons.apartment,
                      size: 70,
                      color: AppTheme.textColorCard,
                    ),
                  ),
                ),
              ),
              Text(
                '${espacio['nombre_espacio']}',
                style: AppTheme.textStyle,
              ),
              Text(
                '${espacio['tipo_espacio']}',
                style: AppTheme.textCard1,
              ),
              Text(
                espacio['area'] == null ? "" : 'Area: ${espacio['area']}',
                style: AppTheme.textCard,
              ),
              Text(
                espacio['capacidad'] == null ? "" : 'Capacidad: ${espacio['capacidad']}',
                style: AppTheme.textCard,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('${espacio['estado']}',
                      style: espacio['estado'] == "ACTIVO"
                          ? AppTheme.estadoColorGreen
                          : AppTheme.estadoColorRed),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          print("Le diste en editar");
                          print(espacio);
                          final route = MaterialPageRoute(
                            builder: (context) => EditEspacios(
                              espacios: espacio,
                            ),
                          );
                          Navigator.push(context, route);
                        },
                        icon: const Icon(Icons.edit, color: AppTheme.colorGrey),
                      ),
                      IconButton(
                        onPressed: () async {
                          final registro = ControllerEspacios();
                          Map<String, dynamic> eliminacion = {
                            '_id': espacio['_id']
                          };
                          print(espacio['_id']);
                          await registro.eliminarRegistro(eliminacion);

                          final route = MaterialPageRoute(
                            builder: (context) => Espacios(),
                          );
                          Navigator.push(context, route);
                        },
                        icon:
                            const Icon(Icons.delete, color: AppTheme.colorGrey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
