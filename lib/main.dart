import 'package:flutter/material.dart';
import 'dart:math';

// Estos si tiene interaccion pero necesitp state
class HelloStatefull extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HelloState();
  }
}

class _HelloState extends State<HelloStatefull>{
  int variable_estado = -1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Hope Startwars Statefull"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Cambio de la variable de estado: ",
              style: TextStyle(fontSize: 28,
                  color: Colors.deepPurpleAccent),),
            Text('$variable_estado',
              style: TextStyle(fontSize: 40,
                  color: Colors.deepOrange),)
          ],
        ),
      ),
      floatingActionButton: _crea_botones(),
    );
  }

  Widget _crea_botones(){
    return Row(
      children: <Widget>[
        SizedBox(width: 30,),
        FloatingActionButton( child: Icon(Icons.exposure_zero_rounded), onPressed: funcion_zero),
        // boton para incrementar de 1 en 1
        FloatingActionButton(child: Icon(Icons.plus_one),onPressed: incremento),
        // boton para decrementar de 1 en 1
        FloatingActionButton(child: Icon(Icons.exposure_minus_1),onPressed: decremento),
        // button para incremento aleatorio
        FloatingActionButton(child: Text("Rnd"),onPressed: aleatorio),
        // boton para regresar a -1
        FloatingActionButton(child: Text("State"), onPressed: regresar)
      ],
    );
  }

  void funcion_zero(){
    setState(() {
      variable_estado = 0;
    });
  }

  void incremento(){
    setState(() {
      variable_estado += 1;
    });
  }

  void decremento(){
    setState(() {
      variable_estado -= 1;
    });
  }

  void aleatorio(){
    setState(() {
      var rng = new Random();
      int randomNumber = rng.nextInt(100);
      variable_estado = randomNumber;
    });
  }

  void regresar(){
    setState(() {
      variable_estado = -1;
    });

  }
}


// en los Stateless no hay interaccion solo lo que se ve
class HelloStateless extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.amber,
        height: 400,
        width: 300,
        child: Center(
          child: Text(
            "Flutter Rule",
            style: TextStyle(
                fontSize: 40.0,
                color: Colors.white54,
              fontFamily: "Arial"
          ),
          ),
        ),
      ),
    );
  }

}

void main() {
  runApp(
    MaterialApp(
      title: "Hope: StarWars app",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HelloStatefull(),
      )
    )
  );
}


