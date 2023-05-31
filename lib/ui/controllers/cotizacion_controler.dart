import 'dart:async';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import '../database/database.dart';
import 'database_controller.dart';
import '';

class CotizacionController extends GetxController {
  var carrito = <Map<dynamic, dynamic>>[].obs;

  late StreamSubscription<Event> newEntryStreamSubscription;
  late StreamSubscription<Event> updateEntryStreamSubscription;
  DatabaseController dbController = Get.find();

  void car(int indice, int cantidad) {
    var idProducto = dbController.productos[indice].key;
    carrito.add({idProducto!: cantidad});
  }

  void coti(vendedor, cliente, productos) {
    vendedor = 'asesor1';
    cliente = 'nn';
    for (var i = 0; i < carrito.length; i++) {
      productos = dbController.productos[carrito[i].values.first].prodData;
    }
    var data = CotiData(vendedor, cliente, productos, total());
    dbController.newCoti(data);
    carrito.clear();
  }

  double total() {
    double total = 0.0;
    for (var i = 0; i < carrito.length; i++) {
      total +=
          dbController.productos[carrito[i].values.first].prodData!.precio!;
    }
    return total;
  }

  Widget buildCotizacionItem(
    String? image,
    var data,
    String? nombre,
  ) {
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
                image: NetworkImage(image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              nombre!,
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

class Carrito {
  late Map<String, int> carrito;
}
