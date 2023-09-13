import 'package:flutter/material.dart';

import '../screens/Login.dart';
import '../screens/ViewsEspacios/Espacios.dart';
import '../screens/ViewsResidentes/Residentes.dart';

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
class ApptowerDrawer extends StatelessWidget {
  const ApptowerDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: 200,
              child: Image.network(
                  "https://i.ibb.co/KL47c1Y/Logo-Apptower.png")),
          SizedBox(height: 10),
          const Text(
            'APPTOWER',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 9, 59),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_3_rounded),
            title: const Text('Residentes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Residentes()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.home_work),
            title: const Text('Espacios'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Espacios()),
              );
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar Sesión'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogIn()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
