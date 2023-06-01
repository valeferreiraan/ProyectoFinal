import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../controllers/cotizacion_controler.dart';
import '../controllers/database_controller.dart';
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
  DatabaseController dbController = Get.find();
  CotizacionController coController = Get.put(CotizacionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        backgroundColor: Color3,
        elevation: 0,
        child: Column(
          children: [
            SizedBox(height: 50),
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
                ),
              ),
            ),
            SizedBox(height: 40),
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
                ),
              ),
            ),
            SizedBox(height: 40),
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
                ),
              ),
            ),
            SizedBox(height: 40),
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
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(HomePage());
                },
                child: Icon(Icons.logout),
              ),
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                _globalKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu),
              color: Color3,
            ),
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
            Expanded(
              child: ListView.builder(
                itemCount: coController.carrito.length,
                itemBuilder: (context, index) {
                  return coController.buildCotizacionItem(
                    dbController.productos[index].prodData!.imagen,
                    dbController.productos[index].prodData,
                    dbController.productos[index].prodData!.nombre,
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Total: ${coController.total()}',
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
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(HomePageCart());
                  },
                  child: Text('Seguir viendo'),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (coController.carrito.isNotEmpty) {
                      coController.total();
                      //coController.coti("", "", Carrito);
                      Get.snackbar(
                        'Correcto',
                        'Cotizacion guardada',
                        icon: Icon(Icons.done),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 1),
                      );
                      coController.carrito.value=[];
                      Get.to(HomePageCart());
                    } else {
                      Get.snackbar(
                        'Error',
                        'Carrito vacio',
                        icon: Icon(Icons.warning),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 1),
                      );
                    }
                  },
                  child: Text('Finalizar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
