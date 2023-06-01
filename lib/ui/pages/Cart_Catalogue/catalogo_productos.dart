import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';
import 'package:greenplastic_app/ui/controllers/Cart_controller.dart';
import 'package:greenplastic_app/ui/pages/Cart_Catalogue/showItem.dart';
import 'package:provider/provider.dart';
import 'package:greenplastic_app/ui/controllers/DataBase_temporal.dart';
import 'package:greenplastic_app/ui/pages/home.dart';
import '../../controllers/database_controller.dart';
import '../../database/database.dart';

import '../cotizacion.dart';
import '../historial.dart';
import '../Cart_Catalogue/showItem.dart';

@JS()
external dynamic get context;

class HomePageCart extends StatefulWidget {
  @override
  _HomePageCartState createState() => _HomePageCartState();
}

class _HomePageCartState extends State<HomePageCart> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  DatabaseController dbController = Get.find();

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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    _globalKey.currentState?.openDrawer();
                    print(dbController.productos.length);
                  },
                  icon: Icon(Icons.menu),
                  color: Color3,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text('Catálogo',
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
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              shrinkWrap: true,
              itemCount: dbController.productos.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color3,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5.0,
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: TextSpan(
                                  text: 'Nombre: ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  children: [
                                    TextSpan(
                                      text:
                                          '${dbController.productos[index].prodData!.nombre.toString()}\n',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                maxLines: 1,
                                text: TextSpan(
                                  text: 'Tamaño: ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  children: [
                                    TextSpan(
                                      text:
                                          '${dbController.productos[index].prodData!.dimension}\n',
                                      //'${dbController.productos[index].prodData?.size.toString()}\n',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                maxLines: 1,
                                text: TextSpan(
                                  text: 'Precio: ' r"$",
                                  style: Theme.of(context).textTheme.bodySmall,
                                  children: [
                                    TextSpan(
                                      text:
                                          '${dbController.productos[index].prodData!.precio.toString()}\n',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //saveData(index);
                            Get.to(ShowItem(
                              producto: dbController.productos[index],
                              index: index,
                            ));
                            print(
                                dbController.productos[index].prodData!.nombre);
                          },
                          child: Text('Ver más',
                              style: Theme.of(context).textTheme.labelLarge),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
/*
final cart = Provider.of<CartProvider>(context as BuildContext);

void saveData(int index) {
  var dbHelper;
  dbHelper
      .insert(
    Cart(
      id: index,
      productId: index.toString(),
      productName: products[index].name,
      initialPrice: products[index].price,
      productPrice: products[index].price,
      quantity: ValueNotifier(1),
      unitTag: products[index].unit,
    ),
  )
      .then((value) {
    cart.addTotalPrice(products[index].price.toDouble());
    cart.addCounter();
    print('Product Added to cart');
  }).onError((error, stackTrace) {
    print(error.toString());
  });
}
*/