{
  2.- Implementar un programa que procese información de propiedades que están a la venta
    en una inmobiliaria.
    Se pide:
      a) Implementar un módulo para almacenar en una estructura adecuada, las propiedades
        agrupadas por zona. Las propiedades de una misma zona deben quedar almacenadas
        ordenadas por tipo de propiedad. Para cada propiedad debe almacenarse el código, el tipo de
        propiedad y el precio total. De cada propiedad se lee: zona (1 a 5), código de propiedad, tipo
        de propiedad, cantidad de metros cuadrados y precio del metro cuadrado. La lectura finaliza
        cuando se ingresa el precio del metro cuadrado -1.
      b) Implementar un módulo que reciba la estructura generada en a), un número de zona y un tipo de
        propiedad y retorne los códigos de las propiedades de la zona recibida y del tipo recibido. 
}

program Practica0_Ejercicio2;

const
  corte = -1;
  maxZona = 5;

type
  rangoZonas = 1..maxZona;

  propiedadLeida = record
    zona: rangoZonas;
    codigo: integer;
    tipo: integer;
    metrosCuadrados: integer;
    precioPorMetroCuadrado: real;
  end;

  propiedad = record
    codigo: integer;
    tipo: integer;
    precioTotal: real;
  end;

  listaPropiedades = ^nodoPropiedad;

  nodoPropiedad = record
    dato: propiedad;
    sig: listaPropiedades;
  end;

  listaCodigos = ^nodoCodigos;

  nodoCodigos = record
    codigo: integer;
    sig: listaCodigos;
  end;

  vectorZonas = array [rangoZonas] of listaPropiedades;

// Inicializo en nil todas las zonas porque contienen listas vacías.
procedure inicializarVectorZonas(var v: vectorZonas);
var
  i: integer;
begin
  for i := 1 to maxZona do begin
    v[i] := nil;
  end;
end;



procedure leerPropiedad(var p: propiedadLeida);
var
  total: real;
begin
  using p do begin
    write('Ingrese la zona de la propiedad: ');
    readln(zona);
    write('Ingrese el codigo de la propiedad: ');
    readln(codigo);
    write('Ingrese el tipo de la propiedad: ');
    readln(tipo);
    write('Ingrese los metros cuadrados de la propiedad: ');
    readln(metrosCuadrados);
    write('Ingrese el precio por metro cuadrado: ');
    readln(precioPorMetroCuadrado);
  end;
end;

// Agrega un elemento ordenado dentro de una lista, de menor a mayor.
procedure agregarOrdenadoEnLista(var l: listaPropiedades; p: propiedad);
var
  nuevo, actual, anterior: listaPropiedades;
begin

  // Creo el elemento nuevo, y le pongo siguiente nil por default
  new(nuevo);
  nuevo^.dato := p;
  nuevo^.sig := nil;

  // Si es nil, la lista está vacía, lo pongo como primero
  // porque está por referencia.
  if (l = nil) then begin
    l := nuevo;

  end else begin
    // Sino, guardo variables locales para recorrer la lista
    actual := l;
    anterior := l;

    // Busco el lugar donde ubicarlo
    while (actual <> nil) and (actual^.dato.tipo < p.tipo) do begin
      anterior := actual;
      actual := actual^.sig;
    end;

    // Si actual es igual a L, entonces tiene que ir primero
    if (actual = l) then begin
      nuevo^.sig := l;
      l := nuevo;
    end else begin
      // Sino, lo ubico entre el anterior y el actual.
      nuevo^.sig := actual;
      anterior^.sig := nuevo;
    end;
  end;
end;

// Procedimiento que delega, recibiendo el vector, la lista y la propiedad para ser agregadas.
procedure agregarPropiedad(var v: vectorZonas; p: propiedadLeida);
var
  tmp: propiedad;
begin
  act.codigo := p.codigo;
  act.tipo := p.tipo;
  act.precioTotal := p.metrosCuadrados * p.precioPorMetroCuadrado;

  agregarOrdenadoEnLista(v[p.zona], act);
end;

// Loopea la lectura y carga y delega las responsabilidades
procedure leerPropiedades(var v: vectorZonas);
var
  p: propiedadLeida;
begin
  leerPropiedad(p);

  while (p.precioPorMetroCuadrado <> corte) do begin
    agregarPropiedad(v, p);
    leerPropiedad(p);
  end;
end;

procedure codigosDePropiedadesPorZonaTipo(vZonas: vectorZonas; var lCodigos: listaCodigos);
var
  z: rangoZonas;
  t: integer;
  lPropiedades: listaPropiedades;
  nuevo: lCodigos;
begin
  write('Ingrese la zona a buscar: ');
  readln(z);
  write('Ingrese el tipo de propiedad: ');
  readln(t);

  lPropiedades := v[z];

  while ((lPropiedades <> nil) and (lPropiedades^.dato.tipo <= t) then begin
    if (lPropiedades^.dato.tipo = t) then begin
      new(nuevo);
      nuevo^.codigo := lPropiedades^.dato.codigo;
      nuevo^.sig := lCodigos;
      lCodigos := nuevo;
    end;
  end;
end;

var
  vZonas: vectorZonas;
  lCodigos: listaCodigos;
begin

  inicializarVectorZonas(vZonas);

  leerPropiedades(vZonas);

  lCodigos := nil;
  codigosDePropiedadesPorZonaTipo(vZonas, lCodigos);
end.