{
  2. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
    durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
    y mes del préstamo y cantidad de días prestados. Implementar un programa con:
    
    a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
      los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
      ser eficientes para buscar por ISBN.
        i. En una estructura cada préstamo debe estar en un nodo.
        ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
        (prestar atención sobre los datos que se almacenan).
    b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
      grande.
    c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
      pequeño.
    d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
      módulo debe retornar la cantidad de préstamos realizados a dicho socio.
    e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
      módulo debe retornar la cantidad de préstamos realizados a dicho socio.
    f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
      ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
      que se prestó.
    g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
      ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
      que se prestó.
    h. Un módulo recursivo que reciba la estructura generada en h. y muestre su contenido.
    i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
      módulo debe retornar la cantidad total de préstamos realizados a los ISBN
      comprendidos entre los dos valores recibidos (incluidos).
    j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
      módulo debe retornar la cantidad total de préstamos realizados a los ISBN
      comprendidos entre los dos valores recibidos (incluidos).
}

program Practica4_Ejercicio2;

const
  isbnFin = -1;

type
  fecha = record
    dia: 1..31;
    mes: 1..12;
  end;

  prestamo = record
    isbn: integer;
    socio: integer;
    fecha: fecha;
    diasPrestados: integer;
  end;

  // Arbol de prestamos (estructura 1)
  arbolPrestamos = ^nodoPrestamo;
  nodoPrestamo = record
    dato: prestamo;
    HI: arbolPrestamos;
    HD: arbolPrestamos;
  end;

  // Lista de prestamos
  listaPrestamos = ^nodoListaPrestamos;
  nodoListaPrestamos = record
    dato: prestamo;
    sig: listaPrestamos;
  end;

  // Arbol de ISBN (estructura 2)
  arbolISBN = ^nodoISBN;
  nodoISBN = record
    isbn: integer;
    prestamos: listaPrestamos;
    HI: arbolISBN;
    HD: arbolISBN;
  end;

// Cargar un prestamo
procedure leerPrestamo(var p: prestamo);
begin
  with p do begin
    write('ISBN: ');
    readln(isbn);

    // So el ISBN es distinto al de corte (-1) sigo leyendo
    if (isbn <> isbnFin) then begin
      write('Socio: ');
      readln(socio);
      write('Dia: ');
      readln(fecha.dia);
      write('Mes: ');
      readln(fecha.mes);
      write('Dias prestados: ');
      readln(diasPrestados);
    end;
  end;
end;

// Insertar un prestamo en un arbol de prestamos
procedure insertarPrestamoEnArbolPorPrestamo(var a: arbolPrestamos; p: prestamo);
begin
  // Si el nodo está vacío, lo creo
  if (a = nil) then begin
    new(a);
    a^.dato := p;
    a^.HI := nil;
    a^.HD := nil;

  // Si el nodo no está vacío, lo inserto en el subarbol correspondiente
  end else begin
    if (p.isbn > a^.dato.isbn) then begin
      insertarPrestamoEnArbolPorPrestamo(a^.HD, p)
    end else begin
      insertarPrestamoEnArbolPorPrestamo(a^.HI, p);
    end;
  end;
end;

// Insertar un prestamo en una lista de prestamos
procedure insertarPrestamoEnLista(var l: listaPrestamos; p: prestamo);
var
  nuevo: listaPrestamos;
begin

  // Si el elemento está vacío, lo creo
  if (l = nil) then begin
    new(nuevo);
    nuevo^.dato := p;
    nuevo^.sig := nil;
    l := nuevo;

  // Sino, llamo recursivo con su siguiente
  end else begin
    insertarPrestamoEnLista(l^.sig, p);
  end;
end;

// Insertar un prestamo en un arbol de ISBN
procedure insertarPrestamoEnArbolPorISBN(var a: arbolISBN; p: prestamo);
var
  nuevo: listaPrestamos;
begin
  // Si el nodo está vacío, lo creo
  if (a = nil) then begin
    new(a);
    a^.isbn := p.isbn;

    new(nuevo);
    nuevo^.dato := p;
    nuevo^.sig := nil;

    a^.prestamos := nuevo;
    a^.HI := nil;
    a^.HD := nil;

  // Si no está vacío busco donde insertarlo acorde a su ISBN
  end else begin

    // Si el ISBN es igual al del nodo, lo inserto en la lista de prestamos
    if (p.isbn = a^.isbn) then begin
      insertarPrestamoEnLista(a^.prestamos, p)

    // Sino, sigo buscando la posición correcta
    end else begin
      if (p.isbn > a^.isbn) then begin
        insertarPrestamoEnArbolPorISBN(a^.HD, p)
      end else begin
        insertarPrestamoEnArbolPorISBN(a^.HI, p);
      end;
    end;
  end;
end;

// Cargar los prestamos en ambos arboles
procedure cargarPrestamos(var aPrestamos: arbolPrestamos; var aISBN: arbolISBN);
var
  p: prestamo;
begin
  leerPrestamo(p);

  // Mientras el ISBN no sea el de corte (-1) sigo leyendo
  while (p.isbn <> isbnFin) do begin
    insertarPrestamoEnArbolPorPrestamo(aPrestamos, p);
    insertarPrestamoEnArbolPorISBN(aISBN, p);
    leerPrestamo(p);
  end;
end;

var
  aPrestamos: arbolPrestamos;
  aISBN: arbolISBN;
begin
  aPrestamos := nil;
  aISBN := nil;

  // Cargo los datos y lleno ambos árboles
  cargarPrestamos(aPrestamos, aISBN);
end.