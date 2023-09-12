import 'package:flutter/material.dart';

import '../controller/contollerResientes.dart';
import '../screens/EditResidentes.dart';
import '../screens/Residentes.dart';
import '../theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class ResidentesCard extends StatelessWidget {
  const ResidentesCard({
    super.key,
    required this.residente,
  });

  final Map<String, dynamic> residente;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 5),
      child: Container(
        height: 280,
        child: Card(
          elevation: 4,
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
                  child: const Center(
                    child: Icon(
                      Icons.person_pin,
                      size: 70,
                      color: AppTheme
                          .textColorCard, // Color del ícono
                    ),
                  ),
                ),
              ),
              Text(
                  '${residente['nombre_residente']} ${residente['apellido_residente']}',
                  style: AppTheme.textStyle),
              Text('${residente['tipo_residente']}',
                  style: AppTheme.textCard1),
              Text(
                  '${residente['genero_residente'] == "F" ? "MUJER" : "HOMBRE"}',
                  style: AppTheme.textStyle),
              Text('${residente['telefono_residente']}',
                  style: AppTheme.textStyle),
              Text(
                  '${residente['residencia'] == null ? " " : ""}',
                  style: AppTheme.textStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('${residente['estado']}',
                      style: residente['estado'] == "ACTIVO"
                          ? AppTheme.estadoColorGreen
                          : AppTheme.estadoColorRed),
                  Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              print("Le diste en editar");
                              print(residente);
                              final route = MaterialPageRoute(
                                  builder: (context) =>
                                      EditResidentes(residente: residente,));
                              Navigator.push(context, route);
                            },
                            icon: const Icon(Icons.edit,
                                color: AppTheme.colorGrey)),
                        IconButton(
                            onPressed: () async {
                              final registro =
                                  ControllerResidentes();
                              Map<String, dynamic> eliminacion = {
                                '_id': residente['_id']
                              };
                              print(residente['_id']);
                              await registro
                                  .eliminarRegistro(eliminacion);

                              final route = MaterialPageRoute(
                                  builder: (context) =>
                                      Residentes());
                              Navigator.push(context, route);
                            },
                            icon: const Icon(Icons.delete,
                                color: AppTheme.colorGrey)),
                      ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
