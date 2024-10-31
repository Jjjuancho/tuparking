import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  //Interfaz gráfica
  @override
  Widget build(BuildContext context) {
    //Obtenemos el alto de la pantalla
    double screenHeight = MediaQuery.of(context).size.height;

    //Scaffold
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 246, 248),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            //Espacio
            SizedBox(height: screenHeight * .10),

            //TITULO: ¡Bienvenido a Gestión de Stock
            const Center(
              child: Text(
                '¡Bienvenido a Tuparking!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('estacionamientos')
                    .snapshots(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                        child: Text('No hay estacionamientos disponibles.'));
                  }

                  return Container(
                    padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        //Guardamos los datos de cada documento en un map(string:dynamic)
                        final Map<String, dynamic>? datosEstacionamiento =
                            snapshot.data!.docs[index].data()
                                as Map<String, dynamic>?;

                        if (datosEstacionamiento != null) {
                          // Definimos variables
                          var nombre = datosEstacionamiento['nombre'];
                          var telefono = datosEstacionamiento['telefono'];
                          var domicilio = datosEstacionamiento['domicilio'];

                          return Card(
                              elevation: 0.5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromARGB(255, 225, 201, 179),
                                      Color.fromARGB(255, 225, 201, 179),
                                    ],
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(nombre),
                                  subtitle: Text("$domicilio - $telefono"),
                                ),
                              ));
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
