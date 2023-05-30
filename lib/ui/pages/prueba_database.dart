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

  final TextEditingController _edtNameController = TextEditingController();
  final TextEditingController _edtPriceController = TextEditingController();
  final TextEditingController _edtSubjectController = TextEditingController();

  DatabaseController databaseController = Get.find();

  bool updateProduct = false;

  @override
  void initState() {
    super.initState();

    if (databaseController.productos.isEmpty) {
      databaseController.getProds();
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() => Column(
              children: [
                for (int i = 0; i < databaseController.productos.length; i++)
                  studentWidget(databaseController.productos[i])
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _edtNameController.text = "";
          _edtPriceController.text = "";
          _edtSubjectController.text = "";
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
                    controller: _edtNameController,
                    decoration: const InputDecoration(helperText: "Nombre"),
                  ),
                  TextField(
                      controller: _edtPriceController,
                      decoration: const InputDecoration(helperText: "Precio")),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {

                        Map<String,dynamic> data = {
                          "nombre": _edtNameController.text.toString(),
                          "precio": double.parse(_edtPriceController.text.toString()),
                        };

                        if (updateProduct) {
                          setState(() {
                            databaseController.updProd(key, data);
                          });
                          Navigator.of(context).pop();
                        } else {
                          databaseController.newSeller(data);
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

  Widget studentWidget(Producto producto) {
    return InkWell(
      onTap: () {
        _edtNameController.text = producto.prodData!.nombre!;
        _edtPriceController.text = producto.prodData!.precio!.toString();
        updateProduct = true;
        studentDialog(key: producto.key);
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
                Text(producto.prodData!.nombre!),
                Text(producto.prodData!.precio!.toString()),
              ],
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    databaseController.delProd(producto.key);
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
