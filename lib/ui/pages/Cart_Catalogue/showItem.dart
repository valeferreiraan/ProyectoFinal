import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';
import 'package:greenplastic_app/ui/pages/home.dart';
import '../../controllers/database_controller.dart';
import '../../database/database.dart';
import '../../controllers/Cart_controller.dart';
import '../../controllers/cotizacion_controler.dart';

import '../cotizacion.dart';
import '../historial.dart';
import 'catalogo_productos.dart';
import '../contacto.dart';

class ShowItem extends StatefulWidget {
  final Producto producto;
  final int index;

  ShowItem({required this.producto, required this.index});

  @override
  _ShowItemState createState() => _ShowItemState();
}

class _ShowItemState extends State<ShowItem> {
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
                      print(widget.producto);
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
                        image: AssetImage(
                            '${widget.producto.prodData!.imagen.toString()}'), // Ruta de la imagen
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
                          'Nombre: ${widget.producto.prodData!.nombre.toString()}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Altura: ${widget.producto.prodData!.altura.toString()}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Peso: ${widget.producto.prodData!.peso.toString()}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Dimensión: ${widget.producto.prodData!.dimension.toString()}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Dilatación: ${widget.producto.prodData!.dilatacion.toString()}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Entradas: ${widget.producto.prodData!.entradas.toString()}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Garantías: ${widget.producto.prodData!.garantia.toString()}',
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
                    'Tendido superior: ${widget.producto.prodData!.tendSup.toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Tendido inferior: ${widget.producto.prodData!.tendSup.toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Durmientes plásticos: ${widget.producto.prodData!.durmientes.toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Resistencia dinámica: ${widget.producto.prodData!.resDinamica.toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Resistencia estática: ${widget.producto.prodData!.resEstatica.toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Resistencia al vacío: ${widget.producto.prodData!.resVacio.toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color3,
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                          width: 300,
                          height: 45,
                          child: Center(
                              child: Row(
                            children: [
                              Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  cartController.removeCantidad();
                                },
                                child: Text('-'),
                              ),
                              Spacer(),
                              Text('Cantidad: ',
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Obx(
                                () => Text('${cartController.counter.value}',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ),
                              Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  cartController.addCantidad();
                                },
                                child: Text('+'),
                              ),
                              Spacer()
                            ],
                          ))),
                    ),
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
                      Get.to(HomePageCart());
                      cartController.resetCantidad();
                    },
                    child: Text('Seguir viendo'),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      print(widget.index);
                      if (cartController.counter.value == 0) {
                        Get.snackbar(
                            '¡Ya casi!', 'Añade la cantidad del producto',
                            icon: const Icon(Icons.warning),
                            backgroundColor: Colors.orange,
                            duration: const Duration(seconds: 1));
                      } else {
                        coController.car(
                            widget.index, cartController.counter.value);
                        cartController.resetCantidad();
                        Get.snackbar(
                            '¡Listo!', 'Producto añadido correctamente',
                            icon: const Icon(Icons.done),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 1));
                      }
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
