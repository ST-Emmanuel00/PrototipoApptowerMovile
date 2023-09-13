import 'package:http/http.dart' as http; // Asegúrate de tener esta línea
import 'dart:convert';

class ControllerUsuarios { 
  
  final String baseUrl = "https://backnodejs.onrender.com/api/usuarios/usuarios";

  Future<Map<String, dynamic>> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {

      return jsonDecode(response.body);

    } 
    
    else {

      throw Exception('Failed to load data');

    }
  }

  Future<void> agregarRegistro(Map<String, dynamic> nuevoRegistro) async {
        print("Entro a la funcion");

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(nuevoRegistro),
    );
    print(nuevoRegistro);
    if (response.statusCode == 200) {
      print("lO REGISTRO REGISTRO EXITASAMENTE");
    } else {
      print('Error: ${response.statusCode}');
      print('Mensaje de error: ${response.body}');
      throw Exception('Failed to add new visitor');
    }
  }

  Future<void> actualizarRegistro(Map<String, dynamic> actualizacion) async {
    final response = await http.put(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(actualizacion),
    );

    if (response.statusCode == 200) {
      print('Se actualizó el registro correctamente');
    } else {
      print('Error: ${response.statusCode}');
      print('Mensaje de error: ${response.body}');
      throw Exception('Failed to update visitor record');
    }
  }

  Future<void> eliminarRegistro(Map<String, dynamic> eliminacion) async {
    final response = await http.delete(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(eliminacion),
    );

    if (response.statusCode == 200) {
      print('Se elimino correctamente');
    } else {
      print('Error: ${response.statusCode}');
      print('Mensaje de error: ${response.body}');
      throw Exception('Failed to update visitor record');
    }
  }

  
}
