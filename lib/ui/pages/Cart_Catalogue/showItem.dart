import 'package:flutter/material.dart';
import 'dart:js';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';
import 'package:greenplastic_app/ui/controllers/Cart_controller.dart';
import 'package:badges/badges.dart' as b;
import 'package:greenplastic_app/ui/pages/Cart_Catalogue/showItem.dart';
import 'package:provider/provider.dart';
import 'package:greenplastic_app/ui/controllers/DataBase_temporal.dart';
import 'package:greenplastic_app/ui/pages/prueba_database.dart';
import 'package:greenplastic_app/ui/pages/home.dart';

import '../cotizacion.dart';
import '../historial.dart';
import 'catalogo_productos.dart';

class ShowItem extends StatefulWidget {
  @override
  _ShowItemState createState() => _ShowItemState();
}

class _ShowItemState extends State<ShowItem> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final TextEditingController _cantidad = TextEditingController();

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
                      onPressed: () {},
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _globalKey.currentState?.openDrawer();
                    },
                    icon: Icon(Icons.menu),
                    color: Color3,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text('Ficha técnica',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Get.to(CotizacionPage());
                        },
                        icon: Icon(Icons.shopping_cart),
                        color: Color3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding:
                          EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0)),
                  Container(
                    width: 250, // Tamaño de la foto
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('/forest.jpg'), // Ruta de la imagen
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ), // espacio entre las fotos y las características

                  // Características
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nombre: ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Altura: ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Peso: ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Dimensión: ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Dilatación: ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Entradas: ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Garantías: ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tendido superior: ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Tendido inferior: ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Durmientes plásticos: ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Resistencia dinámica: ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Resistencia estática: ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Resistencia al vacío: ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  Center(
                    child: SizedBox(
                        width: 250,
                        height: 45,
                        child: TextField(
                            controller: _cantidad,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              filled: true,
                              fillColor: Color3,
                              hintText: "CANTIDAD",
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(Icons.add_shopping_cart),
                              ),
                            ))),
                  ),
                  Spacer(),
                ],
              ),
            )),
            Center(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón "Seguir viendo"
                    },
                    child: Text('Seguir viendo'),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Get.snackbar('¡Listo!', 'Producto añadido correctamente',
                          icon: const Icon(Icons.done),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 1));
                    },
                    child: Text('Agregar al carrito'),
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}
