import 'package:apptower/screens/FormResidentes.dart';
import 'package:apptower/screens/Login.dart';
import 'package:flutter/material.dart';

import '../controller/contollerResientes.dart';
import '../theme/theme.dart';
import '../widgets/residentesCard.dart';

// void main() => runApp(Residentes());

class Residentes extends StatefulWidget {
  // final List<Map<String, dynamic>> residentes;

  Residentes({super.key});

  @override
  State<Residentes> createState() => _ResidentesState();
}

class _ResidentesState extends State<Residentes> {
  late Future<List<Map<String, dynamic>>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = _cargarDatos();
  }

  Future<List<Map<String, dynamic>>> _cargarDatos() async {
    final datos = await ControllerResidentes()
        .fetchData('https://apptower-bk.onrender.com/api/residentes');
    return List<Map<String, dynamic>>.from(datos['residentes']);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Residentes',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(248, 249, 250, 1),
          elevation: 0,
          title: const Text("Residentes", style: AppTheme.textStyle),
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
        ),
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
              final List<Map<String, dynamic>> residentes =
                  snapshot.data as List<Map<String, dynamic>>;

              return ListView.builder(
                itemCount: residentes.length,
                itemBuilder: (context, index) {
                  final residente = residentes[index];

                  return ResidentesCard(residente: residente);
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.ApptowerBlue,
          onPressed: () {
            final route =
                MaterialPageRoute(builder: (context) => FormResidentes());
            Navigator.push(context, route);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
