import 'package:firebase_database/firebase_database.dart';
import '../database/database.dart';
import '../controllers/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PruebaDatabase extends StatefulWidget {
  const PruebaDatabase({Key? key}) : super(key: key);

  @override
  State<PruebaDatabase> createState() => _PruebaDatabaseState();
}

class _PruebaDatabaseState extends State<PruebaDatabase> {
  //DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  final TextEditingController _edtvendedorController = TextEditingController();
  final TextEditingController _edtPriceController = TextEditingController();
  final TextEditingController _edtclienteController = TextEditingController();
  final TextEditingController _edtproductoController = TextEditingController();

  DatabaseController databaseController = Get.find();

  bool updateProduct = false;

  @override
  void initState() {
    super.initState();

    if (databaseController.cotizaciones.isEmpty) {
      databaseController.getCotis();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() => Column(
              children: [
                for (int i = 0; i < databaseController.cotizaciones.length; i++)
                  studentWidget(databaseController.cotizaciones[i])
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _edtvendedorController.text = "";
          _edtPriceController.text = "";
          _edtclienteController.text = "";
          _edtproductoController.text = "";
          updateProduct = false;
          studentDialog();
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  void studentDialog({String? key}) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _edtvendedorController,
                    decoration: const InputDecoration(helperText: "Vendedor"),
                  ),
                  TextField(
                      controller: _edtclienteController,
                      decoration: const InputDecoration(helperText: "cliente")),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      controller: _edtproductoController,
                      decoration:
                          const InputDecoration(helperText: "Producto")),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      controller: _edtPriceController,
                      decoration: const InputDecoration(helperText: "Precio")),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var vendedor = _edtvendedorController.text.toString();
                        var cliente = _edtclienteController.text.toString();
                        var producto = {databaseController.productos[0].key.toString(): 1, databaseController.productos[1].key.toString() : 2};
                        print(producto);

                        var precio =
                            double.parse(_edtPriceController.text.toString());

                        var data = CotiData(vendedor, cliente,
                            producto as Map<String, dynamic>, precio);

                        if (updateProduct) {
                          setState(() {
                            databaseController.updCoti(key, data);
                          });
                          Navigator.of(context).pop();
                        } else {
                          databaseController.newCoti(data);
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(updateProduct ? "Update Data" : "Save Data"))
                ],
              ),
            ),
          );
        });
  }

  Widget studentWidget(Cotizacion cotizacion) {
    return InkWell(
      onTap: () {
        _edtvendedorController.text = cotizacion.cotiData!.vendedor as String;
        _edtPriceController.text = cotizacion.cotiData!.precioTotal.toString();
        //_edtproductoController.text = cotizacion.cotiData!.productos as Map<String,dynamic>;
        _edtclienteController.text = cotizacion.cotiData!.cliente as String;
        updateProduct = true;
        studentDialog(key: cotizacion.key);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cotizacion.cotiData!.vendedor as String),
                Text(cotizacion.cotiData!.precioTotal.toString()),
                //Text(cotizacion.cotiData!.productos as String),
                Text(cotizacion.cotiData!.cliente as String),
              ],
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    databaseController.delCoti(cotizacion.key);
                  });
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
