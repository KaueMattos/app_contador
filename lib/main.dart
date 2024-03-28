
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      home: Contador(),
    )
  );
}

class Contador extends StatefulWidget {
  const Contador({super.key});
  
  @override
  State<Contador> createState() => _ContadorState();
  
}

class _ContadorState extends State<Contador> {
  int contador = 0;

  void increment(){
    setState(() {
      if(contador >= 30){
        chamaDeus("Casa cheia!!");
      }
      else
      contador++;
    });
  }
  
  void decrement(){
    setState(() {
      if(contador <= 0){
        chamaDeus("Casa Vazia!!");
      }else
      contador--;
    });
  }

  void chamaDeus(String msg){
  
    showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context){
            return AlertDialog(
              title: const Text("Alerta!!!"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(msg)
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: const Text("Verifique")
                )
              ],
            );
          }
        );
  }
  
  @override
  Widget build(BuildContext context) {
   
   return Scaffold(
    backgroundColor: Color.fromARGB(255, 133, 231, 91),
    body: 
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("imagens/restaurant.png"),
              fit: BoxFit.cover
            ),
          ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Pode entrar", style: TextStyle(fontSize: 30.0,color: Color.fromARGB(255, 255, 255, 255)),),
          Text(contador.toString(), style: TextStyle(fontSize: 100.0 ,color: Color.fromARGB(255, 255, 255, 255),), ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: increment, 
                child: 
                  Text("Entrar",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize:16),
                  ), style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size(100, 100),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                  )
                ),
                SizedBox(width: 30),
              TextButton(
                onPressed: decrement,
                child:
                  Text("Sair",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize:16),
                  ), style: TextButton.styleFrom(
                    fixedSize: Size(100, 100),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

                )
              ),              
            ],
          )
        ],
    ) ,
      )
   );
  }
}