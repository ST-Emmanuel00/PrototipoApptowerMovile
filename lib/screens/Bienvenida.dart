import 'package:apptower/screens/Login.dart';
import 'package:apptower/screens/camara.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../widgets/DrawerApptower.dart';

class Bienvenida extends StatefulWidget {
  Bienvenida({super.key});

  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  late Future<List<Map<String, dynamic>>> futureData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenida',
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(248, 249, 250, 1),
            elevation: 0,
            title: const Text("Apptower", style: AppTheme.textStyle),
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
                  )),
              IconButton(
                  onPressed: () {
                    final route =
                        MaterialPageRoute(builder: (context) => const Camera());
                    Navigator.push(context, route);
                  },
                  icon: const Icon(
                    Icons.camera,
                    color: AppTheme.ApptowerBlue,
                  )),
            ],
            iconTheme: IconThemeData(color: AppTheme.ApptowerBlue)),
        body: const Center(
          child: Text("Bienvenido", style: AppTheme.textStyle),
        ),
        drawer: const ApptowerDrawer(),
      ),
    );
  }
}
