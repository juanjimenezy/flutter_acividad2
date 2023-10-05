import 'package:flutter/material.dart';

class Principal extends StatelessWidget{
  const Principal({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: const Text("Principal")),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Alineación horizontal de elementos
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 16.0),
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/jimenez.jpg'),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Juan Jimenez',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 16.0),
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/facete.jpg'),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Jhonatan Facete',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),


            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Imc');
                },
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple,padding: const EdgeInsets.all(16.0),),
                child: const Text("Calcular IMC",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Sueldo');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  padding: const EdgeInsets.all(16.0),
                ),
                child: const Text("Calcular Sueldo",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
              ),
            ),
          ],
        )
    );
  }
}
