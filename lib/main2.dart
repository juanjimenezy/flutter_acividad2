import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App 02',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App02(),
    );
  }
}

class App02 extends StatelessWidget {
  const App02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // ************* BACKGROUND PRINCIPAL
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: const BoxDecoration(
                color: Colors.green),
              ),
            ),

          // ************ texto "tienes hambre"
          Positioned(
            top: 10,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: const Column(
                children: [
                  Text(
                    "¿Tienes Hambre?",
                    style:  TextStyle(
                        color: Colors.black,
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          //FONDO
          Positioned(
            top: 30,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('fondo.png'),
                    width: 300,
                  )
                ],
              ),
            ),
          ),

          // ******** AVATAR PRINCIPAL
          Positioned(
            top: 35,
            child: Container(
              //width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage('avatar.png'),
                    width: 60,
                  )
                ],
              ),
            ),
          ),

            Positioned(
              top: 430,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                padding: const EdgeInsets.all(20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: COMIDAS.map((item) => (
                      Comida("${item['name']}","${item['image']}")
                  )).toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget Comida(String comida, String imagen){
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(imagen)),
          Text(comida,style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}

const COMIDAS = [
    {"name": "Burger","image": "burger.png"},
    {"name": "Papas","image": "papas.png"},
    {"name": "Hotdog","image": "hotdog.png"},
    {"name": "Pizza","image": "pizza.png"},
    {"name": "Torta","image": "torta.png"},
    {"name": "Jugo","image": "jugo.png"},
    {"name": "Fast Food","image": "fastfood.png"}
  ];