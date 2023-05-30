import 'dart:async';
import '../database/database.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseController extends GetxController {
  var productos = <Producto>[].obs;
  var cotizaciones = <Cotizacion>[].obs;
  var clientes = <Cliente>[].obs;
  var vendedores = <Vendedor>[].obs;

  final dbRef = FirebaseDatabase.instance.ref();

  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;
  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;

  //----------------------------PRODUCTOS----------------------------
  //Agregar un producto nuevo a la DB
  void newProd(data) {
    dbRef
        .child("Productos")
        .push()
        .set(data)
        .then((value) => print("Producto agregado"))
        .catchError((onError) =>
            print("Error al intentar agregar el producto $onError"));
  }

  //Obtener todos los productos de la base de datos. NO SE TIENE QUE LLAMAR. LO HACE AUTOMÁTICAMENTE POR EL ATRIBUTO "onChildAdded"
  void getProds() {
    dbRef.child("Productos").onChildAdded.listen((data) {
      ProdData prodData = ProdData.fromJson(data.snapshot.value as Map);
      Producto producto = Producto(key: data.snapshot.key, prodData: prodData);
      productos.add(producto);
    });
  }

  //Actualizar el producto con el key especificado en la base de datos
  void updProd(key, data) {
    dbRef.child("Productos").child(key).update(data).then((value) {
      int index = productos.indexWhere((element) => element.key == key);
      productos.removeAt(index);
      productos.insert(
          index, Producto(key: key, prodData: ProdData.fromJson(data)));
    });
  }

  //Eliminar el producto con el key especificado en la base de datos
  void delProd(key) {
    dbRef.child("Productos").child(key).remove().then((value) {
      int index = productos.indexWhere((element) => element.key == key);
      productos.removeAt(index);
    });
  }

  //----------------------------COTIZACIONES----------------------------
  //Agregar una cotización nueva a la DB
  void newCoti(data) {
    dbRef
        .child("Cotizaciones")
        .push()
        .set(data)
        .then((value) => print("Cotizacion agregada"))
        .catchError((onError) =>
            print("Error al intentar agregar la cotizacion $onError"));
  }

  //Obtener todas las cotizaciones de la base de datos. NO SE TIENE QUE LLAMAR. LO HACE AUTOMÁTICAMENTE POR EL ATRIBUTO "onChildAdded"
  void getCotis() {
    dbRef.child("Cotizaciones").onChildAdded.listen((data) {
      CotiData cotiData = CotiData.fromJson(data.snapshot.value as Map);
      Cotizacion cotizacion =
          Cotizacion(key: data.snapshot.key, cotiData: cotiData);
      cotizaciones.add(cotizacion);
    });
  }

  //Actualizar la cotizacion con el key especificado en la base de datos
  void updCoti(key, data) {
    dbRef.child("Cotizaciones").child(key).update(data).then((value) {
      int index = cotizaciones.indexWhere((element) => element.key == key);
      cotizaciones.removeAt(index);
      cotizaciones.insert(
          index, Cotizacion(key: key, cotiData: CotiData.fromJson(data)));
    });
  }

  //Eliminar la cotizacion con el key especificado en la base de datos
  void delCoti(key) {
    dbRef.child("Cotizaciones").child(key).remove().then((value) {
      int index = cotizaciones.indexWhere((element) => element.key == key);
      cotizaciones.removeAt(index);
    });
  }

  //----------------------------CLIENTES----------------------------
  //Agregar un cliente nuevo a la DB
  void newClient(data) {
    dbRef
        .child("Clientes")
        .push()
        .set(data)
        .then((value) => print("Cliente agregado"))
        .catchError((onError) =>
            print("Error al intentar agregar el cliente $onError"));
  }

  //Obtener todos los clientes de la base de datos. NO SE TIENE QUE LLAMAR. LO HACE AUTOMÁTICAMENTE POR EL ATRIBUTO "onChildAdded"
  void getClients() {
    dbRef.child("Clientes").onChildAdded.listen((data) {
      ClientData clientData = ClientData.fromJson(data.snapshot.value as Map);
      Cliente cliente = Cliente(key: data.snapshot.key, clientData: clientData);
      clientes.add(cliente);
    });
  }

  //Actualizar el cliente con el key especificado en la base de datos
  void updClient(key, data) {
    dbRef.child("Clientes").child(key).update(data).then((value) {
      int index = clientes.indexWhere((element) => element.key == key);
      clientes.removeAt(index);
      clientes.insert(
          index, Cliente(key: key, clientData: ClientData.fromJson(data)));
    });
  }

  //Eliminar el producto con el key especificado en la base de datos
  void delClient(key) {
    dbRef.child("Clientes").child(key).remove().then((value) {
      int index = clientes.indexWhere((element) => element.key == key);
      clientes.removeAt(index);
    });
  }

  //----------------------------VENDEDORES----------------------------
  //Agregar un vendedor nuevo a la DB
  void newSeller(data) {
    dbRef
        .child("Vendedores")
        .push()
        .set(data)
        .then((value) => print("Vendedor agregado"))
        .catchError((onError) =>
            print("Error al intentar agregar el vendedor $onError"));
  }

  //Obtener todos los vendedores de la base de datos. NO SE TIENE QUE LLAMAR. LO HACE AUTOMÁTICAMENTE POR EL ATRIBUTO "onChildAdded"
  void getSellers() {
    dbRef.child("Vendedores").onChildAdded.listen((data) {
      SellData sellData = SellData.fromJson(data.snapshot.value as Map);
      Vendedor vendedor = Vendedor(key: data.snapshot.key, sellData: sellData);
      vendedores.add(vendedor);
    });
  }

  //Actualizar el vendedor con el key especificado en la base de datos
  void updSeller(key, data) {
    dbRef.child("Vendedores").child(key).update(data).then((value) {
      int index = vendedores.indexWhere((element) => element.key == key);
      vendedores.removeAt(index);
      vendedores.insert(
          index, Vendedor(key: key, sellData: SellData.fromJson(data)));
    });
  }

  //Eliminar el producto con el key especificado en la base de datos
  void delSeller(key) {
    dbRef.child("Vendedor").child(key).remove().then((value) {
      int index = vendedores.indexWhere((element) => element.key == key);
      vendedores.removeAt(index);
    });
  }
}
