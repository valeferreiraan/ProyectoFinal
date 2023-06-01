import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';
import 'package:greenplastic_app/ui/pages/home.dart';
import '../controllers/database_controller.dart';
import '../database/database.dart';
import '../controllers/Cart_controller.dart';
import '../controllers/cotizacion_controler.dart';

import 'cotizacion.dart';
import 'historial.dart';
import 'contacto.dart';

class ShowCoti extends StatefulWidget {
  final Cotizacion cotizacion;

  ShowCoti({required this.cotizacion});

  @override
  _ShowCotiState createState() => _ShowCotiState();
}

class _ShowCotiState extends State<ShowCoti> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  DatabaseController dbController = Get.find();
  CotizacionController coController = Get.find();
  final cartController = Get.put(addItemController());

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
                  Text('Resumen cotización',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cliente: ${widget.cotizacion.cotiData!.cliente.toString()}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Vendedor: ${widget.cotizacion.cotiData!.vendedor.toString()}',
                          style: TextStyle(color: Colors.white),
                        ),
                        //for (i in dbController)
                        Text(
                          'Productos:',
                          style: TextStyle(color: Colors.white),
                        ),
                        for (int i = 0;
                                i < coController.carrito.length;
                                i++) ...[
                              coController.buildCotizacionItem(
                                dbController.productos[i].prodData!.imagen,
                                dbController.productos[i].prodData,
                                dbController.productos[i].prodData!.nombre,
                              ),
                            ],
                        Text(
                          'Precio total: ${widget.cotizacion.cotiData!.precioTotal.toString()}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            coController.carrito.value=[];
                            Get.to(HistorialPage());
                          },
                          child: Text('Volver'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
