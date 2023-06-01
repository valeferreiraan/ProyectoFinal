/*
DEBEMOS TENER:
  1. Base de datos de los productos
    OPERACIONES CRUD:
    -READ: para la sección de Catálogo
  2. Base de datos de los vendedores (podemos comenzar con usuarios de prueba)
    OPERACIONES CRUD:
    -READ: en el caso del lider, para la vista de vendedores a cargo

SE VA A CREAR MIENTRAS DE USA LA APP:
  1. Cotización: para agregar cotizaciones
    OPERACIONES CRUD:
      -CREATE: generar cotizaciones nuevas
      -READ: para la vista de "Historial"
      -UPDATE: para actualizar info de la cotización (corregir errores, poder reflejar cambios de opinión del cliente)
      -DELETE: para eliminar cotizaciones (ctrl+z)
  2. Cliente: se crea en el formulario de Contacto (DEL CRUD: CREATE, de pronto UPDATE)
    OPERACIONES CRUD:
      -CREATE: agregar nuevos contactos
      -READ: para la vista de "Historial"
      -UPDATE: para actualizar datos de los contactos (cambio de número/email, cambio de representante de la empresa, etc)
      -DELETE: para eliminar contactos que ya no se estén usando (podríamos no implementarlo)

RESUMEN: FUNCIONES QUE DEBEN EXISTIR

getProducts(): obtener la lista de productos disponibles
getProduct(id): obtener un producto a partir de su identificador

getSellers(): obtener la lista de vendedores
getSeller(id): obtener un vendedor a partir de su identificador

newCoti(): crear nueva cotización
getCotis(): obtener la lista de cotizaciones
getCoti(id): obtener una cotización a partir de su identificador
editCoti(id): modificar cotización
delCoti(id): eliminar cotización

newClient(): agregar un nuevo cliente
getClients(): obtener la lista de clientes
getClient(id): obtener un cliente a partir de su identificador
editClient(id): modificar cliente
delClient(id): eliminar un cliente 

*/

class Cotizacion {
  String? key;
  CotiData? cotiData;

  Cotizacion({this.key, this.cotiData});
}

class CotiData {
  String? vendedor;
  String? cliente;
  late Map<String, dynamic> productos;
  double precioTotal = 0;

  CotiData(this.vendedor, this.cliente, this.productos, this.precioTotal);

  CotiData.fromJson(Map<dynamic, dynamic> json) {
    vendedor = json["vendedor"];
    cliente = json["cliente"];
    productos = json["productos"];
    precioTotal = json["precioTotal"];
  }
}

class Producto {
  String? key;
  ProdData? prodData;

  Producto({this.key, this.prodData});
}

class ProdData {
  String? nombre;
  double? precio;
  String? imagen;
  double? altura;
  int? tendSup;
  int? tendInf;
  int? durmientes;
  double? peso;
  double? resDinamica;
  double? resEstatica;
  double? resVacio;
  String? dimension;
  double? dilatacion;
  int? entradas;
  int? garantia;

  ProdData(
      this.nombre,
      this.precio,
      this.imagen,
      this.altura,
      this.tendSup,
      this.tendInf,
      this.durmientes,
      this.peso,
      this.resDinamica,
      this.resEstatica,
      this.resVacio,
      this.dimension,
      this.dilatacion,
      this.entradas,
      this.garantia);

  ProdData.fromJson(Map<dynamic, dynamic> json) {
    nombre = json["nombre"];
    precio = json["precio"];
    imagen = json["imagen"];
    altura = json["altura"];
    tendSup = json["tendSup"];
    tendInf = json["tendInf"];
    durmientes = json["durmientes"];
    peso = json["peso"];
    resDinamica = json["resDinamica"];
    resEstatica = json["resEstatica"];
    resVacio = json["resVacio"];
    dimension = json["dimension"];
    dilatacion = json["dilatacion"];
    entradas = json["entradas"];
    garantia = json["garantia"];
  }
}

class Vendedor {
  String? key;
  SellData? sellData;

  Vendedor({this.key, this.sellData});
}

class SellData {
  late String rol;
  late String nombre;
  late String apellido;
  late String email;
  late String passw;

  SellData(this.rol, this.nombre, this.apellido, this.email, this.passw);

  SellData.fromJson(Map<dynamic, dynamic> json) {
    rol = json["rol"];
    nombre = json["nombre"];
    apellido = json["apellido"];
    email = json["email"];
    passw = json["passw"];
  }
}

class Cliente {
  String? key;
  ClientData? clientData;

  Cliente({this.key, this.clientData});
}

class ClientData {
  late String nombre;
  late String apellido;
  late int telefono;
  late String email;
  late int nitEmpresa;
  late String empresa;
  late String ciudad;
  late String vendedor;

  ClientData(this.nombre, this.apellido, this.telefono, this.email,
      this.nitEmpresa, this.empresa, this.ciudad, this.vendedor);

  ClientData.fromJson(Map<dynamic, dynamic> json) {
    nombre = json["nombre"];
    apellido = json["apellido"];
    telefono = json["telefono"];
    email = json["email"];
    nitEmpresa = json["nitEmpresa"];
    empresa = json["empresa"];
    ciudad = json["ciudad"];
    vendedor = json["vendedor"];
  }
}
