import 'package:firebase_database/firebase_database.dart';
import 'package:greenplastic_app/ui/controllers/login_controller.dart';
import '../database/database.dart';
import '../controllers/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';
import 'package:greenplastic_app/ui/pages/home.dart';
import 'package:greenplastic_app/ui/pages/Cart_Catalogue/catalogo_productos.dart';
import 'package:greenplastic_app/ui/pages/cotizacion.dart';
import 'package:greenplastic_app/ui/pages/historial.dart';
import 'prueba_database.dart';

class Contacto extends StatefulWidget {
  const Contacto({Key? key}) : super(key: key);

  @override
  State<Contacto> createState() => _ContactoState();
}

class _ContactoState extends State<Contacto>{

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _apellido = TextEditingController();
  final TextEditingController _telefono = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _nitEmpresa = TextEditingController();
  final TextEditingController _empresa = TextEditingController();
  final TextEditingController _ciudad = TextEditingController();

  DatabaseController dbController = Get.find();
  LoginController loginController = Get.find();

  @override
  void initState(){
    super.initState();
  }

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
                      Get.to(PruebaDatabase());
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
        body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                  Text('Contacto',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 125.0, vertical: 20),
              child: Column(
                children:[
                  TextField(
                    controller: _nombre,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      filled: true,
                      fillColor: Color3,
                      hintText: "NOMBRE",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _apellido,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      filled: true,
                      fillColor: Color3,
                      hintText: "APELLIDO",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _email,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      filled: true,
                      fillColor: Color3,
                      hintText: "EMAIL",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(Icons.email),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _ciudad,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      filled: true,
                      fillColor: Color3,
                      hintText: "CIUDAD",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(Icons.location_city_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _telefono,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      filled: true,
                      fillColor: Color3,
                      hintText: "TELÉFONO",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(Icons.local_phone_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _nitEmpresa,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      filled: true,
                      fillColor: Color3,
                      hintText: "NIT EMPRESA",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(Icons.info_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _empresa,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      filled: true,
                      fillColor: Color3,
                      hintText: "EMPRESA",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(Icons.work_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  SizedBox(
                    width: 250,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_nombre.text=='' || _apellido.text=='' || _telefono.text=='' ||_email.text=='' ||_nitEmpresa.text=='' ||_empresa.text=='' ||_ciudad.text=='' ) {
                          Get.snackbar('Error', 'Los campos no pueden estar vacíos',
                              icon: const Icon(Icons.warning),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 2));
                        } else{
                          Map<String,dynamic> data = {
                            "nombre": _nombre.text.toString(),
                            "apellido": _apellido.text.toString(),
                            "telefono": int.parse(_telefono.text),
                            "email": _email.text.toString(),
                            "nitEmpresa": int.parse(_nitEmpresa.text),
                            "empresa": _empresa.text,
                            "ciudad": _ciudad.text.toString(),
                            "vendedor": loginController.currentuser.value,
                          };
                          try{
                            dbController.newClient(data);
                            _nombre.text='';
                            _apellido.text='';
                            _telefono.text='';
                            _email.text='';
                            _nitEmpresa.text='';
                            _ciudad.text='';
                            _empresa.text='';

                            Get.snackbar('Nuevo Contacto', 'Contacto guardado exitosamente',
                              icon: const Icon(Icons.people),
                              backgroundColor: Colors.green,
                              duration: const Duration(seconds: 1));
                          }
                          catch (e){
                            Get.snackbar('Error', 'Error al guardar contacto',
                            icon: const Icon(Icons.warning),
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 1));
                          }
                        }
                      },
                      child: Text(
                        'GUARDAR',
                        style: Theme.of(context).textTheme.labelLarge,
                      )
                    )
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}