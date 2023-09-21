{
  3.- Implementar un programa que procese las ventas de un supermercado. El supermercado
    dispone de una tabla con los precios y stocks de los 1000 productos que tiene a la venta.
      a) Implementar un módulo que retorne, en una estructura de datos adecuada, los tickets de las ventas.
        De cada venta se lee código de venta y los productos vendidos. Las ventas finalizan con el código de
        venta -1. De cada producto se lee código y cantidad de unidades solicitadas. Para cada venta, la lectura
        de los productos a vender finaliza con cantidad de unidades vendidas igual a 0. El ticket debe contener:
        - Código de venta
        - Detalle (código de producto, cantidad y precio unitario) de los productos que se pudieron vender. En
          caso de no haber stock suficiente, se venderá la máxima cantidad posible.
        - Monto total de la venta.
      c) Implementar un módulo que reciba la estructura generada en el inciso a) y un código de
        producto y retorne la cantidad de unidades vendidas de ese código de producto.
}

program Practica0_Ejercicio3;

const
  corteTicket = -1;
  corteProducto = 0;
  maxCodigoProducto = 1000;

type
  rangoCodigoProducto = 1..maxCodigoProducto;

  productoPrecioStock = record
    stock: integer;
    precio: real;
  end;

  vectorProductosPrecioStock = array [rangoCodigoProducto] of productoPrecioStock;

  productoVendido = record
    codigoProducto: integer;
    cantidad: integer;
    precio: real;
  end;

  listaProductos = ^nodoProducto;
  nodoProducto = record
    dato: productoVendido;
    sig: listaProductos;
  end;

  recordTicket = record
    codigoVenta: integer;
    detalle: listaProductos;
    montoTotal: real;
  end;

  listaTickets = ^nodoTicket;
  nodoTicket = record
    dato: recordTicket;
    sig: listaTickets;
  end;

procedure agregarProducto(pVendido: productoVendido; var lProductos: listaProductos);
var
  t: real;
  nuevo: listaProductos;
begin
  new(nuevo);
end;

procedure leerProducto(var p: productoVendido);
begin
  with p do begin
    write('Ingrese codigo del producto: ');
    readln(codigoProducto);
    write('Ingrese cantidad de unidades vendidas: ');
    readln(cantidad);
  end;
end;

procedure sustraerStock(var pVendido: productoVendido; var vProductosPrecioStock: vectorProductosPrecioStock);
begin
  if (vProductosPrecioStock[pVendido.codigoProducto].stock = 0) then begin
    pVendido.cantidad := 0;
  end else begin
    if (pVendido.cantidad >= vProductosPrecioStock[pVendido.codigoProducto].stock) then begin
      vProductosPrecioStock[pVendido.codigoProducto].stock := vProductosPrecioStock[pVendido.codigoProducto] - pVendido.cantidad;
    end else begin
      pVendido.cantidad := vProductosPrecioStock[pVendido.codigoProducto].stock;
      vProductosPrecioStock[pVendido.codigoProducto].stock := 0;
    end;
  end;
end;

procedure agregarProducto(var pVendido: productoVendido; var lProductos: listaProductos; var vProductosPrecioStock: vectorProductosPrecioStock);
var
  nuevo: listaProductos;
begin
  new(nuevo);

  sustraerStock(pVendido, vProductosPrecioStock);

  nuevo^.dato.cantidad := pVendido.cantidad;
  nuevo^.dato.precio := vProductosPrecioStock[pVendido.codigoProducto].precio;
  nuevo^.sig := lProductos;
  lProductos := nuevo;
end;

procedure cargarProductos(var lProductos: listaProductos; var total: real; var vProductosPrecioStock: vectorProductosPrecioStock);
var
  pVendido: productoVendido;
begin
  leerProducto(pVendido);
  total := 0;
  
  while (pVendido.cantidad <> corteProducto) do begin
    agregarProducto(pVendido, lProductos, vProductosPrecioStock);
    total := total + (pVendido.cantidad * vProductosPrecioStock[pVendido.codigoProducto]);
    leerProducto(pVendido);
  end;
end;

procedure leerTicket(var ticket: recordTicket; var vProductosPrecioStock: vectorProductosPrecioStock);
var
  total: real;
begin
  with ticket do begin
    write('Ingresde código de venta: ');
    readln(codigoVenta);

    if (codigoVenta <> corteTicket) then begin
      detalle := nil;

      cargarProductos(detalle, total, vProductosPrecioStock);

      montoTotal := total;
    end;
  end;
end;

procedure cargarTickets(var lTickets: listaTickets; var vProductosPrecioStock: vectorProductosPrecioStock);
var
  ticket: recordTicket;
  lProductos: listaProductos;
begin
  leerTicket(ticket, vProductosPrecioStock);

  while(ticket.codigoVenta <> corteTicket) do begin
    agregarTicket(lTickets, ticket, vProductosPrecioStock);
    leerTicket(ticket, vProductosPrecioStock);
  end;
end;

procedure solicitarCodigoParaBuscar(var cod: integer);
begin
  write('Ingrese el código del producto del que quiere obtener el total de unidades vendidas: ');
  readln(cod);
end;

function contarUnidadesVendidasPorCodigo(lTickets: listaTickets): integer;
var
  i, cod: integer;
  lProductos: listaProductos;
begin
  solicitarCodigoParaBuscar(cod);

  i := 0;
  while (lTickets <> nil) do begin
    lProductos := lTickets^.dato.detalle;

    while (lProductos <> nil) do begin
      if (lProductos^.dato.codigoProducto = cod) then begin
        i := i + lProductos^.dato.cantidad;
      end;

      lProductos := lProductos^.sig;
    end;

    lTickets := lTickets^.sig;
  end;

  contarUnidadesVendidasPorCodigo := i;
end;

var
  lTickets: listaTickets;
  vProductosPrecioStock: vectorProductosPrecioStock;
  productosVendidosPorCodigo: integer;
begin
  lTickets := nil;

  // Se dispone de la lista
  cargarVectorProductosPrecioStock(vProductosPrecioStock);

  // Se cargan los tickets. Se para el vector de precios para
  // descontar stock y calcular totales.
  cargarTickets(lTickets, vProductosPrecioStock);

  // Buscar unidades vendidas por código de producto
  productosVendidosPorCodigo := contarUnidadesVendidasPorCodigo(lTickets);
end.