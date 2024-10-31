// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tuparking/login.dart';

//Clase principal de registro

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 246, 248),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Título y subtítulo alineados arriba
              SizedBox(height: screenHeight * .10),
              Center(
                child: Text(
                  'Bien, ¡vamos con el registro!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '¿Cómo quiere registrarse?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * .20),

              // Botones centrados en pantalla
              Column(
                children: [
                  FormButton(
                    text: 'Conductor',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPersonas()),
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * .05),
                  FormButton(
                    text: 'Estacionamiento',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterEstacionamientos()),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: screenHeight * .0075),
              SizedBox(height: screenHeight * .15),

              // Botón de iniciar sesión
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "¿Ya tenés una cuenta? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: '¡Iniciá sesión!',
                          style: TextStyle(
                            color: Color.fromARGB(255, 120, 101, 27),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

//Clase para registrar personas

class RegisterPersonas extends StatefulWidget {
  const RegisterPersonas({super.key});

  @override
  State<RegisterPersonas> createState() => _RegisterPersonas();
}

class _RegisterPersonas extends State<RegisterPersonas> {
  //Controladores de datos
  late String nombre;
  late String apellido;
  late String dni;
  late String email;
  late String telefono;
  late String password;
  late String passwordbis;
  bool usuarioCreado = false;

  @override
  Widget build(BuildContext context) {
    //Obtenemos el alto de la pantalla
    double screenHeight = MediaQuery.of(context).size.height;

    //Scaffold
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 246, 248),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .10),

            //TITULO: ¡Bienvenido a Gestión de Stock
            Center(
              child: Text(
                'Registro',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //SUBTITULO: Registrate y empezá a gestionar tu stock
            Center(
              child: Text(
                'Necesitamos algunos',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(.6),
                ),
              ),
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .12),

            //CAJA DE TEXTO PARA EL NOMBRE
            InputField(
              onChanged: (value) {
                setState(() {
                  nombre = value;
                });
              },
              labelText: 'Nombre',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .025),

            //CAJA DE TEXTO PARA EL APELLIDO
            InputField(
              onChanged: (value) {
                setState(() {
                  apellido = value;
                });
              },
              labelText: 'Apellido',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .025),

            //CAJA DE TEXTO PARA EL DNI
            InputField(
              onChanged: (value) {
                setState(() {
                  dni = value;
                });
              },
              labelText: 'DNI',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .025),

            //CAJA DE TEXTO PARA EL TELEFONO
            InputField(
              onChanged: (value) {
                setState(() {
                  telefono = value;
                });
              },
              labelText: 'Teléfono',
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .025),

            //CAJA DE TEXTO PARA EL CORREO
            InputField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              labelText: 'Correo electrónico',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .025),

            //CAJA DE TEXTO PARA LA CONTRASEÑA
            InputField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              labelText: 'Contraseña',
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .025),

            //CAJA DE TEXTO PARA REPETIR LA CONTRASEÑA
            InputField(
              onChanged: (value) {
                setState(() {
                  passwordbis = value;
                });
              },
              labelText: 'Repetir contraseña',
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),

            //ESPACIO
            SizedBox(
              height: screenHeight * .075,
            ),

            //BOTÓN REGISTRARSE
            FormButton(
              text: 'Registrarse',
              onPressed: () async {
                if (nombre.isNotEmpty &&
                    apellido.isNotEmpty &&
                    dni.isNotEmpty &&
                    telefono.isNotEmpty &&
                    email.isNotEmpty &&
                    password.isNotEmpty &&
                    passwordbis.isNotEmpty) {
                  if (password == passwordbis) {
                    //Intentamos registrar el usuario
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password);

                      var uidActual =
                          FirebaseAuth.instance.currentUser?.uid.toString();

                      FirebaseFirestore.instance
                          .collection('usuarios')
                          .doc(uidActual)
                          .set({
                        'nombre': nombre,
                        'apellido': apellido,
                        'dni': dni,
                        'correo': email,
                        'telefono': telefono,
                      });
                    } catch (error) {
                      mostrarCuadro(error.toString());
                    }

                    //Si no hay errores al registrar el usuario
                    mostrarCuadro("Usuario registrado correctamente.");
                    usuarioCreado = true;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  } else {
                    mostrarCuadro("Las contraseñas no coinciden.");
                  }
                } else {
                  mostrarCuadro("Debe completar todos los campos.");
                }
              },
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .1),

            //INICIAR SESIÓN
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    text: "¿Ya tenés una cuenta? ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: '¡Iniciá sesión!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 120, 101, 27),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),

            SizedBox(height: screenHeight * .10),
          ],
        ),
      ),
    );
  }

  //Mostrar cuadros de alerta
  mostrarCuadro(text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
              text,
              style: TextStyle(fontSize: 18),
            )),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (usuarioCreado) {
                      var uidActual = FirebaseAuth.instance.currentUser?.uid;
                      /*Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GestionStock(uidActual: uidActual)));*/
                    }
                  },
                  child: Center(child: Text('Aceptar'))),
            ],
          );
        });
  }
}

//Clase para registrar estacionamientos

class RegisterEstacionamientos extends StatefulWidget {
  const RegisterEstacionamientos({super.key});

  @override
  State<RegisterEstacionamientos> createState() => _RegisterEstacionamientos();
}

class _RegisterEstacionamientos extends State<RegisterEstacionamientos> {
  //Controladores de datos
  late String nombre_estacionamiento;
  late String cuil;
  late String email;
  late String telefono;
  late String password;
  late String passwordbis;
  bool usuarioCreado = false;

  @override
  Widget build(BuildContext context) {
    //Obtenemos el alto de la pantalla
    double screenHeight = MediaQuery.of(context).size.height;

    //Scaffold
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 246, 248),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .10),

            //TITULO: ¡Bienvenido a Gestión de Stock
            Center(
              child: Text(
                'Registro',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //SUBTITULO: Registrate y empezá a gestionar tu stock
            Center(
              child: Text(
                'Necesitamos algunos datos',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(.6),
                ),
              ),
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .12),

            //CAJA DE TEXTO PARA EL NOMBRE
            InputField(
              onChanged: (value) {
                setState(() {
                  nombre_estacionamiento = value;
                });
              },
              labelText: 'Nombre del estacionamiento',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .025),

            //CAJA DE TEXTO PARA EL DNI
            InputField(
              onChanged: (value) {
                setState(() {
                  cuil = value;
                });
              },
              labelText: 'CUIL',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .025),

            //CAJA DE TEXTO PARA EL TELEFONO
            InputField(
              onChanged: (value) {
                setState(() {
                  telefono = value;
                });
              },
              labelText: 'Teléfono',
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .025),

            //CAJA DE TEXTO PARA EL CORREO
            InputField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              labelText: 'Correo electrónico',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .025),

            //CAJA DE TEXTO PARA LA CONTRASEÑA
            InputField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              labelText: 'Contraseña',
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .025),

            //CAJA DE TEXTO PARA REPETIR LA CONTRASEÑA
            InputField(
              onChanged: (value) {
                setState(() {
                  passwordbis = value;
                });
              },
              labelText: 'Repetir contraseña',
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),

            //ESPACIO
            SizedBox(
              height: screenHeight * .075,
            ),

            //BOTÓN REGISTRARSE
            FormButton(
              text: 'Registrarse',
              onPressed: () async {
                if (nombre_estacionamiento.isNotEmpty &&
                    cuil.isNotEmpty &&
                    telefono.isNotEmpty &&
                    email.isNotEmpty &&
                    password.isNotEmpty &&
                    passwordbis.isNotEmpty) {
                  if (password == passwordbis) {
                    //Intentamos registrar el usuario
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password);

                      var uidActual =
                          FirebaseAuth.instance.currentUser?.uid.toString();

                      FirebaseFirestore.instance
                          .collection('estacionamientos')
                          .doc(uidActual)
                          .set({
                        'nombre': nombre_estacionamiento,
                        'cuil': cuil,
                        'correo': email,
                        'telefono': telefono,
                      });
                    } catch (error) {
                      mostrarCuadro(error.toString());
                    }

                    //Si no hay errores al registrar el usuario
                    mostrarCuadro("Usuario registrado correctamente.");
                    usuarioCreado = true;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  } else {
                    mostrarCuadro("Las contraseñas no coinciden.");
                  }
                } else {
                  mostrarCuadro("Debe completar todos los campos.");
                }
              },
            ),

            //ESPACIO
            SizedBox(height: screenHeight * .1),

            //INICIAR SESIÓN
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    text: "¿Ya tenés una cuenta? ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: '¡Iniciá sesión!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 120, 101, 27),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),

            SizedBox(height: screenHeight * .10),
          ],
        ),
      ),
    );
  }

  //Mostrar cuadros de alerta
  mostrarCuadro(text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
              text,
              style: TextStyle(fontSize: 18),
            )),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (usuarioCreado) {
                      var uidActual = FirebaseAuth.instance.currentUser?.uid;
                      /*Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GestionStock(uidActual: uidActual)));*/
                    }
                  },
                  child: Center(child: Text('Aceptar'))),
            ],
          );
        });
  }
}

//Clase del InputField
class InputField extends StatelessWidget {
  final String? labelText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autoFocus;
  final bool obscureText;
  const InputField(
      {this.labelText,
      this.onChanged,
      this.onSubmitted,
      this.errorText,
      this.keyboardType,
      this.textInputAction,
      this.autoFocus = false,
      this.obscureText = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: MediaQuery.of(context).size.width > 600 ? 0.3 : 0.8,
      child: TextField(
        autofocus: autoFocus,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          errorText: errorText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

//Clase del FormButton
class FormButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  const FormButton({this.text = '', this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return FractionallySizedBox(
      widthFactor: MediaQuery.of(context).size.width > 600 ? 0.15 : 0.8,
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: screenHeight * .02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Color.fromARGB(255, 250, 215, 75),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
