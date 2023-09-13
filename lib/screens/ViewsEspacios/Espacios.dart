import 'package:apptower/screens/Login.dart';
import 'package:apptower/widgets/espaciosCard.dart';
import 'package:flutter/material.dart';

import '../../controller/controllerEspacios.dart';
import '../../theme/theme.dart';
import '../../widgets/DrawerApptower.dart';
import 'CreateEspacios.dart';

// void main() => runApp(Residentes());

class Espacios extends StatefulWidget {
  // final List<Map<String, dynamic>> Espacios;

  Espacios({super.key});

  @override
  State<Espacios> createState() => _EspaciosState();
}

class _EspaciosState extends State<Espacios> {
  late Future<List<Map<String, dynamic>>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = _cargarDatos();
  }

  Future<List<Map<String, dynamic>>> _cargarDatos() async {
    final datos = await ControllerEspacios()
        .fetchData('https://apptower-bk.onrender.com/api/espacios');
    return List<Map<String, dynamic>>.from(datos['espacios']);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Espacios',
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(248, 249, 250, 1),
            elevation: 0,
            title: const Text("Espacios", style: AppTheme.textStyle),
            actions: [
              IconButton(
                  onPressed: () {
                    final route =
                        MaterialPageRoute(builder: (context) => const LogIn());
                    Navigator.push(context, route);
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: AppTheme.ApptowerBlue,
                  ))
            ],
            iconTheme: const IconThemeData(color: AppTheme.ApptowerBlue)),
        drawer: const ApptowerDrawer(),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final List<Map<String, dynamic>> espacios =
                  snapshot.data as List<Map<String, dynamic>>;

              return ListView.builder(
                itemCount: espacios.length,
                itemBuilder: (context, index) {
                  final espacio = espacios[index];

                  return EspaciosCard(espacio: espacio);
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.ApptowerBlue,
          onPressed: () {
            final route =
                MaterialPageRoute(builder: (context) => CreateEspacios());
            Navigator.push(context, route);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
