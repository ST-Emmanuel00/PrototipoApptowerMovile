import 'package:apptower/screens/FormResidentes.dart';
import 'package:apptower/screens/Residentes.dart';
import 'package:apptower/theme/theme.dart';
import 'package:apptower/widgets/input.dart';
import 'package:flutter/material.dart';

void main() => runApp(const LogIn());

final TextEditingController nombreEspacioController = TextEditingController();
final TextEditingController areaEspacioController = TextEditingController();
final TextEditingController capacidadEspacioController =
    TextEditingController();

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LoginState();
}

class _LoginState extends State<LogIn> {
  TextEditingController usuario = TextEditingController();
  TextEditingController contrasena = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apptower Login',
      home: Scaffold(
        // backgroundColor: const Color.fromRGBO(248, 249, 250, 1),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                  height: 300,
                  child: Image.network(
                      "https://i.ibb.co/KL47c1Y/Logo-Apptower.png")),
              Padding(
                padding: AppTheme.selectPading,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Input(
                            hintText: "Escribe aquí nombre de usuario",
                            labelText: "Usuario",
                            controlador: usuario)),
                    Align(
                      alignment: Alignment.center,
                      child: Input(
                        labelText: "Contraseña",
                        hintText: "Escribe aquí tu contraseña",
                        controlador: contrasena,
                      ),
                    ),
                    const SizedBox(height: 20), // Espacio antes del botón
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
                        
                        onPressed: () {
                          print("Diste click en formulario de residentes");
                          
                          final route = MaterialPageRoute(
                              builder: (context) => Residentes() );
                          Navigator.push(context, route);
                        },
                        child: const Text("Ingresar"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
