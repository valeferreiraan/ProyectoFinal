import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import 'Cart_Catalogue/catalogo_productos.dart';
import 'historial.dart';
import 'home.dart';
import 'contacto.dart';

class CotizacionPage extends StatefulWidget {
  @override
  _CotizacionPageState createState() => _CotizacionPageState();
}

class _CotizacionPageState extends State<CotizacionPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  TextEditingController _totalController = TextEditingController();
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
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Expanded(
              child: Stack(
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
                      children: [
                        Text(
                          'Cotización',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          'Resumen de Cotización',
                          textScaleFactor: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        CotizacionItem(
                          image: AssetImage('ruta_de_la_imagen1.jpg'),
                          descripcion: 'Descripción del producto 1',
                        ),
                        CotizacionItem(
                          image: AssetImage('ruta_de_la_imagen2.jpg'),
                          descripcion: 'Descripción del producto 2',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Total:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _totalController,
              style: TextStyle(
                color: Colors.white,
              ),

              // Establece cualquier otra configuración que desees para el TextField
            ),
            SizedBox(height: 16.0),
            Center(
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
                    // Acción al presionar el botón "Finalizar"
                  },
                  child: Text('Finalizar'),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class CotizacionItem extends StatelessWidget {
  final ImageProvider<Object> image;
  final String descripcion;

  const CotizacionItem({
    required this.image,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color.fromARGB(255, 255, 252, 252),
          width: 2.0,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Color.fromARGB(255, 169, 245, 178),
                width: 2.0,
              ),
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              descripcion,
              textScaleFactor: 1,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
