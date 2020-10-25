import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "mi primera App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(title: "Flutter Login"),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key key, this.title}) : super(key: key);
  final String title;
  _MyHome createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0);

  Widget build(BuildContext context) {
    final myController_nombre = TextEditingController();
    final myController_apellidos = TextEditingController();
    final myController_nacimiento = TextEditingController();
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myController_nombre.dispose();
      myController_apellidos.dispose();
      myController_nacimiento.dispose();
      super.dispose();
    }

    final nombre = TextField(
        controller: myController_nombre,
        style: style,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          hintText: "Nombres",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        ));

    final apellidos = TextField(
        controller: myController_apellidos,
        style: style,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          hintText: "Apellidos",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        ));
    final fechaNacimiento = TextField(
        controller: myController_nacimiento,
        style: style,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          hintText: "Fecha de Nacimiento",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        ));

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(5.0),
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the user has entered by using the
                // TextEditingController.
                content: Text(myController_nombre.text +
                    "<-->" +
                    myController_apellidos.text),
              );
            },
          );
        },
        child: Text("Enterate!",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 15.0),
                nombre,
                SizedBox(height: 15.0),
                apellidos,
                SizedBox(
                  height: 15.0,
                ),
                fechaNacimiento,
                SizedBox(
                  height: 15.0,
                ),
                loginButon,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
