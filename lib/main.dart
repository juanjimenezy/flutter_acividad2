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
      title: 'App 01',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App01(),
    );
  }
}

class App01 extends StatelessWidget {
  const App01({super.key});

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
              height: 190,
              decoration: const BoxDecoration(
                color: Colors.blue),
              ),
            ),
          
          // ******** AVATAR PRINCIPAL
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Image(
                    image: AssetImage('avatar.png'),
                    width: 60,
                  )
                ],
              ),
            ),
          ),


          // ************ CONTENIDO NOMBRE PERSONA
          Positioned(
              top: 90,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Text(
                      "Hola Pedro",
                      style:  TextStyle( 
                        color: Colors.white, 
                        fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                   Text(
                      "La app del programador",
                      style:  TextStyle( 
                        color: Colors.white, 
                        fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            // ***** CONTENIDO APLICACION
            Positioned(
              top: 170,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 600,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 235, 233, 233)),
              ),
            ),

            // ********* TOPICOS POPULARES
            const Positioned(
              top: 200,
              left: 20,
              child: Text("Topicos Populares", 
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
            ),

            Positioned(
              top: 220,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                padding: const EdgeInsets.all(20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    Topicos("Java", "30 Post", color: Colors.purple),
                    Topicos("CSS", "24 Post", color: Colors.blue),
                    Topicos("JS", "10 Post", color: Color.fromARGB(255, 248, 98, 11)),
                    Topicos("HTML", "15 Post", color: Colors.red),

                  ],
                ),
              ),
            ),


            // ********* TENDENCIAS
            const Positioned(
              top: 380,
              left: 20,
              child: Text("Tendencias", 
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
            ),

            Positioned(
              top: 400,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 260,
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    Tendencias(
                      "Jhonatan Facete", 
                      "Hace 1 Hora", 
                      "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500.",
                      120,
                      350,
                      image: const AssetImage('facete.jpg')),

                    Tendencias(
                      "Juan Jimenez", 
                      "Hace 2 Hora", 
                      "Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño.",
                      30,
                      400,
                      image: const AssetImage('jimenez.jpg')),
                  ],
                ),
              ),
          )


        ],
      ),
    );
  }

  Widget Topicos(String comercio, String post, {required Color color}){
     return Container(
        width: 130,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              Text(comercio, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),),
              Text(post, style: TextStyle(color: Colors.white),),
          ],
        ),
      );
  }

  Widget Tendencias(String nombre, String tiempo, String info, int like, int view, {required AssetImage image}){
     return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: image,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(nombre, style: const TextStyle(color: Colors.black, fontSize: 18),),
                          Text(tiempo, style: const TextStyle(color: Color.fromARGB(255, 165, 164, 164))),
                        ],
                      ),
                    ),
                  ],
                ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Text(info, 
                style: const TextStyle(fontSize: 16, color:Colors.black)),
                  ],
                ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const Icon(
                    Icons.thumb_up_sharp,
                    size: 18,
                    color: Color.fromARGB(255, 160, 157, 157),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 4,
                    child:Text("$like Likes", style: const TextStyle(fontSize: 13, color:Color.fromARGB(255, 160, 157, 157)),)
                  ),
                  
                  const Icon(
                    Icons.visibility,
                    size: 18,
                    color: Color.fromARGB(255, 160, 157, 157),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child:Text("$view View", style: const TextStyle(fontSize: 13, color:Color.fromARGB(255, 160, 157, 157)),)
                  )
                  ],
                ),
            ),
          ],
        ),
    );
  }
}
