import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';
import 'package:greenplastic_app/ui/pages/home.dart';
import 'package:greenplastic_app/ui/controllers/login_controller.dart';
import 'package:greenplastic_app/ui/pages/prueba_database.dart';
import 'package:greenplastic_app/ui/pages/contacto.dart';
import '../controllers/database_controller.dart';
//import 'package:greenplastic_app/ui/pages/pruebasubirdatos.dart';

import 'Cart_Catalogue/catalogo_productos.dart';
import 'cotizacion.dart';
import 'historial.dart';

class MenuPage extends StatefulWidget {
  @override
  _menuPageState createState() => _menuPageState();
}

class _menuPageState extends State<MenuPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  DatabaseController dbController = Get.find();

  @override
  void initState() {
    super.initState();

    if (dbController.productos.isEmpty) {
      dbController.getProds();
    } 
    if (dbController.clientes.isEmpty) {
      dbController.getClients();
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        backgroundColor: Color3,
        elevation: 0,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
                width: 250,
                height: 35,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(HomePageCart());
                    },
                    child: Text(
                      'Catálogo',
                      style: Theme.of(context).textTheme.labelLarge,
                    ))),
            SizedBox(
              height: 40,
            ),
            SizedBox(
                width: 250,
                height: 35,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(CotizacionPage());
                    },
                    child: Text(
                      'Cotización',
                      style: Theme.of(context).textTheme.labelLarge,
                    ))),
            SizedBox(
              height: 40,
            ),
            SizedBox(
                width: 250,
                height: 35,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(HistorialPage());
                    },
                    child: Text(
                      'Historial',
                      style: Theme.of(context).textTheme.labelLarge,
                    ))),
            SizedBox(
              height: 40,
            ),
            SizedBox(
                width: 250,
                height: 70,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(Contacto());
                    },
                    child: Text(
                      'Formulario \n contacto',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ))),
            SizedBox(
              height: 40,
            ),
            SizedBox(
                width: 250,
                height: 35,
                child: ElevatedButton(
                    onPressed: () {
                      //Get.to(PruebaDatabase());
                    },
                    child: Text(
                      'Test product',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ))),
            Spacer(),
            SizedBox(
                /*width: 35,
                height: 35,*/
                child: ElevatedButton(
              onPressed: () {
                Get.to(HomePage());
              },
              child: Icon(Icons.logout),
            )),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          IconButton(
            onPressed: () {
              _globalKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu),
            color: Color3,
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/GreenPlastic.png',
                width: 200,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(
                    16), // Espacio entre los bordes de la aplicación y el rectángulo
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        '/forest.jpg', // Ruta relativa del archivo de imagen
                        width: double.maxFinite,
                        height: 132,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          10), // Bordes curvos del rectángulo
                      child: Container(
                        color: Color3.withOpacity(
                            0.5), // Color con opacidad del 50%
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Green Plastic es un agente de cambio ambiental, revalorizamos retales plásticos de un solo uso mediante la transformación a elementos de larga vida, bajo un modelo de economía circular.',
                                  textScaleFactor: 1,
                                  textAlign: TextAlign
                                      .justify, // Alineación justificada del texto
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // Otros elementos dentro del rectángulo
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
