{
  1. Implementar un programa modularizado para una librería que:
    a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por
      código de producto. De cada producto deben quedar almacenados la cantidad total de
      unidades vendidas y el monto total. De cada venta se lee código de venta, código del
      producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las
      ventas finaliza cuando se lee el código de venta -1.
    b. Imprima el contenido del árbol ordenado por código de producto.
    c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
      código de producto con mayor cantidad de unidades vendidas.
    d. Contenga un módulo que reciba la estructura generada en el punto a y un código de
      producto y retorne la cantidad de códigos menores que él que hay en la estructura.
    e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
      producto y retorne el monto total entre todos los códigos de productos comprendidos
      entre los dos valores recibidos (sin incluir).
}

program Practica4_Ejercicio1;

const
  codigoCorte = -1;

type
  producto = record
    codigo: integer;
    cantidadVendida: integer;
    montoTotal: real;
  end;

  arbolProductos = ^nodoProducto;
  nodoProducto = record
    dato: producto;
    HI: arbolProductos;
    HD: arbolProductos;
  end;

  venta = record
    codigoVenta: integer;
    codigoProducto: integer;
    cantidadProducto: integer;
    precioProducto: real;
  end;

// Separador de textos
procedure separadorTexto(msj: string);
begin
  writeln('');
  writeln('--------------------------------------');
  writeln(msj);
  writeln('--------------------------------------');
end;

// Procedimiento de lectura de la venta
procedure leerVenta(var v: venta);
begin
  with v do begin
    write('Ingrese el codigo de venta: ');
    readln(codigoVenta);
    if (codigoVenta <> codigoCorte) then begin
      write('Ingrese el codigo del producto: ');
      readln(codigoProducto);
      write('Ingrese la cantidad de unidades vendidas: ');
      readln(cantidadProducto);
      write('Ingrese el precio unitario: ');
      readln(precioProducto);
    end;
  end;
end;

// Procedimiento de carga de la venta en el arbol
// Si el producto ya existe, se actualiza la cantidad y el monto total
// Si el producto no existe, se crea un nuevo nodo
procedure procesarVenta(var arbol: arbolProductos; v: venta);
var
  nuevo: arbolProductos;
begin

  // O el arbol está vacío, o llegamos a un NIL
  if (arbol = nil) then begin
    new(nuevo);
    nuevo^.dato.codigo := v.codigoProducto;
    nuevo^.dato.cantidadVendida := v.cantidadProducto;
    nuevo^.dato.montoTotal := v.cantidadProducto * v.precioProducto;
    nuevo^.HI := nil;
    nuevo^.HD := nil;
    arbol := nuevo;
  end else begin

    // Si el producto ya existe, se actualiza la cantidad y el monto total
    if (v.codigoProducto = arbol^.dato.codigo) then begin
      arbol^.dato.cantidadVendida := arbol^.dato.cantidadVendida + v.cantidadProducto;
      arbol^.dato.montoTotal := arbol^.dato.montoTotal * v.precioProducto;
    end else begin
      // Si el producto es mayor, se va por la derecha, sino por la izquierda
      if (v.codigoProducto > arbol^.dato.codigo) then begin
        procesarVenta(arbol^.HD, v)
      end else begin
        procesarVenta(arbol^.HI, v);
      end;
    end;
  end;
end;

// Procedimiento de carga de ventas
procedure cargarVentas(var arbol: arbolProductos);
var
  v: venta;
begin
  leerVenta(v);
  while (v.codigoVenta <> codigoCorte) do begin
    procesarVenta(arbol, v);
    leerVenta(v);
  end;
end;

// Procedimiento de impresión del arbol
procedure imprimirArbolOrdenado(arbol: arbolProductos);
begin
  if (arbol <> nil) then begin
    imprimirArbolOrdenado(arbol^.HI);
    writeln('Codigo de producto: ', arbol^.dato.codigo);
    writeln('Cantidad de unidades vendidas: ', arbol^.dato.cantidadVendida);
    writeln('Monto total: ', arbol^.dato.montoTotal:2:2);
    imprimirArbolOrdenado(arbol^.HD);
  end;
end;

// Procedimiento de búsqueda del código de producto con mayor cantidad de unidades vendidas
procedure mayorCantidad(arbol: arbolProductos; var codigo: integer; var cantidad: integer);
begin
  if (arbol <> nil) then begin
    if (arbol^.dato.cantidadVendida > cantidad) then begin
      codigo := arbol^.dato.codigo;
      cantidad := arbol^.dato.cantidadVendida;
    end;
    mayorCantidad(arbol^.HI, codigo, cantidad);
    mayorCantidad(arbol^.HD, codigo, cantidad);
  end;
end;

// Procedimiento de conteo de códigos menores que el código recibido
procedure contarMenores(arbol: arbolProductos; codigo: integer; var cantidad: integer);
begin
  if (arbol <> nil) then begin
    if (arbol^.dato.codigo >= codigo) then begin
      contarMenores(arbol^.HI, codigo, cantidad);
    end else begin
      cantidad := cantidad + 1;
      contarMenores(arbol^.HD, codigo, cantidad);
    end;
  end;
end;

// Procedimiento de conteo de códigos menores que el código recibido
procedure cantidadCodigosMenoresQue(arbol: arbolProductos; var cantidad: integer);
var
  codigo: integer;
begin
  write('Ingrese el codigo de producto: ');
  readln(codigo);
  cantidad := 0;
  contarMenores(arbol, codigo, cantidad);
  writeln('La cantidad de codigos menores que ', codigo, ' es: ', cantidad);
end;

// Procedimiento de cálculo del monto total entre dos códigos recibidos
procedure calcularMontoTotalEntreCodigos(arbol: arbolProductos; codigo1, codigo2: integer; var montoTotal: real);
begin
  if (arbol <> nil) then begin
    if (arbol^.dato.codigo >= codigo1) and (arbol^.dato.codigo <= codigo2) then begin
      montoTotal := montoTotal + arbol^.dato.montoTotal;
      calcularMontoTotalEntreCodigos(arbol^.HI, codigo1, codigo2, montoTotal);
      calcularMontoTotalEntreCodigos(arbol^.HD, codigo1, codigo2, montoTotal);
    end else begin
      if (arbol^.dato.codigo < codigo1) then begin
        calcularMontoTotalEntreCodigos(arbol^.HD, codigo1, codigo2, montoTotal);
      end else begin
        calcularMontoTotalEntreCodigos(arbol^.HI, codigo1, codigo2, montoTotal);
      end;
    end;
  end;
end;

// Procedimiento de cálculo del monto total entre dos códigos recibidos
procedure montoTotalEntreCodigos(arbol: arbolProductos; var montoTotal: real);
var
  codigo1, codigo2: integer;
begin
  write('Ingrese el codigo de producto 1: ');
  readln(codigo1);
  write('Ingrese el codigo de producto 2: ');
  readln(codigo2);
  montoTotal := 0;
  calcularMontoTotalEntreCodigos(arbol, codigo1, codigo2, montoTotal);
  writeln('El monto total entre los codigos ', codigo1, ' y ', codigo2, ' es: ', montoTotal:2:2);
end;

var
  arbol: arbolProductos;
  codigoMayorCantidad, cantidadMayorCantidad: integer;
  cantidadCodigoMenor: integer;
  montoTotal: real;
begin
  // Inicializacion de variables
  arbol := nil;
  codigoMayorCantidad := -1;
  cantidadMayorCantidad := 0;

  cargarVentas(arbol);
  separadorTexto('Arbol ordenado por codigo de producto');
  imprimirArbolOrdenado(arbol);
  mayorCantidad(arbol, codigoMayorCantidad, cantidadMayorCantidad);
  cantidadCodigosMenoresQue(arbol, cantidadCodigoMenor);
  montoTotalEntreCodigos(arbol, montoTotal);
end.