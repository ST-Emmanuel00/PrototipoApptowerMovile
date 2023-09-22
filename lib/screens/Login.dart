import 'package:apptower/screens/Bienvenida.dart';
import 'package:apptower/theme/theme.dart';
import 'package:apptower/widgets/input.dart';
import 'package:flutter/material.dart';

import '../controller/controllerUsuarios.dart';

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

  ControllerUsuarios modulosData = ControllerUsuarios();

  Future<void> _verificarUsuario() async {
    final response = await modulosData
        .fetchData('https://backnodejs.onrender.com/api/usuarios/usuarios');

    if (response.containsKey('usuario')) {
      final usuarios = response['usuario'] as List<dynamic>;
      var usuarioEncontrado;

      for (var usuarioData in usuarios) {
        final documento = usuarioData['documento'].toString();
        final correo = usuarioData['correo'].toString();

        if ((documento == usuario.text || correo == usuario.text) &&
            usuarioData['password'] == contrasena.text) {
          usuarioEncontrado = usuarioData;
          break;
        }
      }

      if (usuarioEncontrado != null) {
        final route = MaterialPageRoute(builder: (context) => Bienvenida());
        Navigator.push(context, route);
      } else {
        print("Credencial incorrecta");
      }
    } else {
      print("Error al verificar");
    }
  }

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
                        child: InputLogIn(
                            hintText: "Escribe aquí nombre de usuario",
                            labelText: "Usuario",
                            controlador: usuario)),
                    Align(
                      alignment: Alignment.center,
                      child: InputContrasena(
                        labelText: "Contraseña",
                        hintText: "Escribe aquí tu contraseña",
                        controlador: contrasena,
                      ),
                    ),
                    Padding(
                      padding: AppTheme.inputPading,
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
                          if (usuario.text.isEmpty || contrasena.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Usuario o Contraseña vacíos"),
                              ),
                            );
                          } else {
                            _verificarUsuario();
                          }
                        },
                        child: const Text("Ingresar"),
                      ),
                    ),
                    Padding(
                      padding: AppTheme.selectPading,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppTheme.ApptowerWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),

                        // Funcion de Elevatedbutton para cambiar de vista

                        onPressed: () {
                          print("Diste click en registrar jeje");
                        },
                        child: const Text(
                          "Registrar",
                          style: AppTheme.textStyle,
                        ),
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
