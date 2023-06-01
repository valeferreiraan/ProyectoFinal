import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'Cart_Catalogue/catalogo_productos.dart';
import 'cotizacion.dart';
import 'home.dart';
import 'contacto.dart';
import '../controllers/database_controller.dart';
import 'Cart_Catalogue/catalogo_productos.dart';
import 'resumen_coti.dart';
import '../controllers/cotizacion_controler.dart';

class HistorialPage extends StatefulWidget {
  const HistorialPage({Key? key}) : super(key: key);
  @override
  State<HistorialPage> createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  DatabaseController dbController = Get.find();
  CotizacionController coController = Get.find();

  @override
  void initState() {
    super.initState();
    if (dbController.cotizaciones.isEmpty){
      dbController.getCotis();
    }

    if (dbController.clientes.isEmpty) {
      dbController.getClients();
    }
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
            const SizedBox(
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
            const SizedBox(
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
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                width: 250,
                height: 35,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(const HistorialPage());
                    },
                    child: Text(
                      'Historial',
                      style: Theme.of(context).textTheme.labelLarge,
                    ))),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                width: 250,
                height: 70,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(const Contacto());
                    },
                    child: Text(
                      'Formulario \n contacto',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ))),
            const Spacer(),
            SizedBox(
                /*width: 35,
                height: 35,*/
                child: ElevatedButton(
              onPressed: () {
                Get.to(HomePage());
              },
              child: const Icon(Icons.logout),
            )),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Expanded(
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      _globalKey.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                    color: Color3,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Historial',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                          Column(
                            children: [
                              Card(
                                color: Color3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ExpansionTile(
                                  tilePadding: const EdgeInsets.all(0),
                                  title: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.history,
                                            color: Color1),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            'Historial',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DataTable(
                                        sortAscending: true,
                                        sortColumnIndex: 1,
                                        dataRowHeight: 40,
                                        showBottomBorder: false,
                                        columns: const [
                                          DataColumn(
                                            label: Text(
                                              'ID',
                                            ),
                                            numeric: true,
                                          ),
                                          DataColumn(label: Text('Cliente')),
                                          DataColumn(
                                            label: Text('Total'),
                                            numeric: true,
                                          ),
                                        ],
                                        rows: [
                                          for (int i = 0;
                                              i <
                                                  dbController
                                                      .cotizaciones.length;
                                              i++)
                                            DataRow(
                                              cells: [
                                                DataCell(Text('$i')),
                                                DataCell(
                                                  InkWell(
                                                    child: Card(
                                                    color: Color3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Text('${dbController.cotizaciones[i].cotiData!.cliente}'),),
                                                    onTap: (){
                                                        for (var k in dbController.cotizaciones[i].cotiData!.productos.keys){
                                                          String prodKey='';
                                                          int index=-1;
                                                          for (int j=0; j<dbController.productos.length; j++){
                                                            if (k.toString()==dbController.productos[j].key.toString()){prodKey=k;index=j;}
                                                            }
                                                          if (prodKey!='' && index!=-1){
                                                            coController.car(index, dbController.cotizaciones[i].cotiData!.productos[prodKey]);
                                                          }
                                                      }
                                                      Get.to(ShowCoti(cotizacion: dbController.cotizaciones[i],));
                                                    }
                                                    ),
                                                  ),
                                                DataCell(
                                                  Text(
                                                      '${dbController.cotizaciones[i].cotiData!.precioTotal} ',
                                                      textAlign:
                                                          TextAlign.right),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                color: Color3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ExpansionTile(
                                  tilePadding: const EdgeInsets.all(0),
                                  title: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.contact_page,
                                            color: Color1),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text('Contactos',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                        ),
                                      ],
                                    ),
                                  ),
                                  children: [
                                    for (int i = 0;
                                        i < dbController.clientes.length;
                                        i++)
                                      Text(
                                          '${dbController.clientes[i].clientData!.nombre} ${dbController.clientes[i].clientData!.apellido}')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
