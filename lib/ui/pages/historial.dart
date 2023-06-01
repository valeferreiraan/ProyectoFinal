import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'cotizacion.dart';
import 'home.dart';
import 'contacto.dart';
import '../controllers/database_controller.dart';

class HistorialPage extends StatefulWidget {
  const HistorialPage({Key? key}) : super(key: key);
  @override
  State<HistorialPage> createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  DatabaseController dbController = Get.find();

  @override
  void initState() {
    super.initState();
    dbController.getCotis();

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
                    onPressed: () {},
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
                                        dataRowHeight: 200,
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
                                                  Card(
                                                    color: Color3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: ExpansionTile(
                                                      tilePadding:
                                                          EdgeInsets.all(0),
                                                      title: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10,
                                                                horizontal: 15),
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons.history,
                                                                color: Color1),
                                                            SizedBox(width: 10),
                                                            Expanded(
                                                              child: Text(
                                                                '${dbController.cotizaciones[i].cotiData!.cliente}',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      children: [
                                                        SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: DataTable(
                                                            sortAscending: true,
                                                            sortColumnIndex: 1,
                                                            dataRowHeight: 70,
                                                            showBottomBorder:
                                                                false,
                                                            columns: const [
                                                              DataColumn(
                                                                label: Text(
                                                                  'ID',
                                                                ),
                                                                numeric: true,
                                                              ),
                                                              DataColumn(
                                                                  label: Text(
                                                                      'Producto')),
                                                              DataColumn(
                                                                label: Text(
                                                                    'Cantidad'),
                                                                numeric: true,
                                                              ),
                                                              DataColumn(
                                                                label: Text(
                                                                    'Precio unitario'),
                                                                numeric: true,
                                                              ),
                                                            ],
                                                            rows: [
                                                              for (int j = 0;
                                                                  j <
                                                                      dbController
                                                                          .cotizaciones[
                                                                              i]
                                                                          .cotiData!
                                                                          .productos
                                                                          .length;
                                                                  j++)
                                                                DataRow(
                                                                  cells: [
                                                                    DataCell(
                                                                      Text('$j',
                                                                          textAlign:
                                                                              TextAlign.right),
                                                                    ),
                                                                    DataCell(
                                                                      Text(
                                                                          '${dbController.cotizaciones[i].cotiData!.productos} ',
                                                                          textAlign:
                                                                              TextAlign.right),
                                                                    ),
                                                                    DataCell(
                                                                      Text(
                                                                          '${dbController.cotizaciones[i].cotiData!.productos[j]} ',
                                                                          textAlign:
                                                                              TextAlign.right),
                                                                    ),
                                                                    DataCell(
                                                                      Text(
                                                                          '${dbController.cotizaciones[i].cotiData!.productos[j]} ',
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
