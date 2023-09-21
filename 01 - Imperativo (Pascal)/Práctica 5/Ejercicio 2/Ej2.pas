{
  Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
  información de los autos en venta. Implementar un programa que:

    a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
      modelo) y los almacene en dos estructuras de datos:
        i. Una estructura eficiente para la búsqueda por patente.
        ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
          almacenar todos juntos los autos pertenecientes a ella.
    b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
      cantidad de autos de dicha marca que posee la agencia.
    c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
      la cantidad de autos de dicha marca que posee la agencia.
    d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
      la información de los autos agrupados por año de fabricación.
    e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
      modelo del auto con dicha patente.
    f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
      modelo del auto con dicha patente.
}

program Practica5_Ejercicio2;

const
  corte = 'zzz';
  anioMin = 2010;
  anioMax = 2018;

type
  str20 = string[20];
  rangoAnio = anioMin..anioMax;

  // Definicion de registro auto
  auto = record
    patente: str20;
    anio: rangoAnio;
    marca: str20;
    modelo: str20;
  end;

  // Arbol ordenado por patente
  arbolPatente = ^nodoPatente;
  nodoPatente = record
    dato: auto;
    HI: arbolPatente;
    HD: arbolPatente;
  end;

  // Lista de autos
  listaAutos = ^nodoAutos;
  nodoAutos = record
    dato: auto;
    sig: listaAutos;
  end;

  // Arbol ordenado por marca
  arbolMarca = ^nodoMarca;
  nodoMarca = record
    marca: str20;
    autos: listaAutos;
    HI: arbolMarca;
    HD: arbolMarca;
  end;

  // Vector de listas de autos
  // por año de fabricacion
  vectorAnios = array[rangoAnio] of listaAutos;

// Procedimiento de lectura del auto
procedure leerAuto(var au: auto);
begin
  with au do begin
    write('Ingrese la patente: ');
    readln(patente);
    if (patente <> corte) then begin
      write('Ingrese el anio de fabricacion: ');
      readln(anio);
      write('Ingrese la marca: ');
      readln(marca);
      write('Ingrese el modelo: ');
      readln(modelo);
    end;
  end;
end;

// Procedimiento que recibe un arbol ordenado por patente, y un auto
// e inserta el auto en dicho arbol como un nodo nuevo
procedure insertarPatente(var a: arbolPatente; au: auto);
begin

  // Si el nodo esta vacio, lo creo, con el dato y sin hijos
  if (a = nil) then begin
    new(a);
    a^.dato := au;
    a^.HI := nil;
    a^.HD := nil;
  end else begin

    // Si el dato es mayor a la raiz, lo inserto en el subarbol derecho
    // sino, lo inserto en el izquierdo
    if (au.patente > a^.dato.patente) then begin
      insertarPatente(a^.HD, au);
    end else begin
      insertarPatente(a^.HI, au);
    end;
  end;
end;

// Procedimiento que recibe un arbol ordenado por marca, y un auto,
// busca el nodo identificado con la marca del auto, y lo inserta en
// la lista de autos de dicho nodo. En caso de no existir el nodo,
// lo crea, con el dato como único elemento de la lista, y sin hijos
procedure insertarMarca(var a: arbolMarca; au: auto);
var
  lAuto: listaAutos;
begin
  
  // Si el noso está vacío, lo creo, con el dato y sin hijos
  if (a = nil) then begin
    new(a);
    a^.marca := au.marca;
    new(lAuto);
    lAuto^.dato := au;
    lAuto^.sig := nil;
    a^.autos := lAuto;
    a^.HI := nil;
    a^.HD := nil;
  end else begin

    // Si el dato es mayor a la raiz, lo inserto en el subarbol derecho
    if (au.marca > a^.marca) then begin
      insertarMarca(a^.HD, au);
    end else begin

      // Si el dato es menor a la raiz, lo inserto en el subarbol izquierdo
      if (au.marca < a^.marca) then begin
        insertarMarca(a^.HI, au);
      end else begin

        // Si el dato es igual a la raiz, lo inserto en la lista de autos
        new(lAuto);
        lAuto^.dato := au;
        lAuto^.sig := a^.autos;
        a^.autos := lAuto;
      end;
    end;
  end;
end;

// Procedimiento que lee los datos de los autos, y delega la carga en los arboles
// ordenados por patente y por marca a los correspondientes procedimientos
procedure cargarArboles(var aPatente: arbolPatente; var aMarca: arbolMarca);
var
  au: auto;
begin
  leerAuto(au);

  while (au.patente <> corte) do begin
    insertarPatente(aPatente, au);
    insertarMarca(aMarca, au);
    leerAuto(au);
  end;
end;

// Procedimiento para solicitar la marca a buscar
procedure solicitarMarca(var marca: str20);
begin
  write('Ingrese la marca a buscar: ');
  readln(marca);
end;

// Procedimiento recursivo que cuenta la cantidad de autos de una marca
// en un arbol ordenado por patente
function contarPorMarcaArbolPatente(a: arbolPatente; marca: str20): integer;
var
  act: integer;
begin
  act := 0;

  // Si la raiz no es nula, y la marca es igual a la marca de la raiz
  // cuento el nodo
  if ((a <> nil) and (a^.dato.marca = marca)) then begin
    act := 1;
  end;

  // Sumo el valor de este nodo, con el de los nodos siguientes de manera recursiva
  contarPorMarcaArbolPatente := act + contarPorMarcaArbolPatente(a^.HI, marca) + contarPorMarcaArbolPatente(a^.HD, marca);
end;

// Procedimiento que delega la solicitud de la marca a buscar, y muestra
// la cantidad de autos de dicha marca en el arbol ordenado por patente
procedure totalPorMarcaArbolPatente(a: arbolPatente);
var
  marca: str20;
begin
  if (a <> nil) then begin
    solicitarMarca(marca);
    writeln('La cantidad de autos de la marca ', marca, ' en el arbol ordenado por patentes es: ', contarPorMarcaArbolPatente(a, marca));
  end;
end;

// Procedimiento que recibe una lista de autos, y devuelve la cantidad de autos
// en la lista contando de manera recursiva
function contarAutosEnLaLista(l: listaAutos): integer;
begin
  if (l <> nil) then begin
    contarAutosEnLaLista := 1 + contarAutosEnLaLista(l^.sig);
  end else begin
    contarAutosEnLaLista := 0;
  end;
end;

// Procedimiento recursivo que cuenta la cantidad de autos de una marca
// en un arbol ordenado por marca.
function contarPorMarcaArbolMarca(a: arbolMarca; marca: str20): integer;
var
  act: integer;
begin
  act := 0;

  if (a^.marca = marca) then begin
    act := contarAutosEnLaLista(a^.autos);
  end else begin
    if (a^.marca < marca) then begin
      act := contarPorMarcaArbolMarca(a^.HD, marca);
    end else begin
      act := contarPorMarcaArbolMarca(a^.HI, marca);
    end;
  end;

  contarPorMarcaArbolMarca := act;
end;

// Procedimiento que delega la solicitud de la marca a buscar, y muestra
// la cantidad de autos de dicha marca en el arbol ordenado por marca
procedure totalPorMarcaArbolMarca(a: arbolMarca);
var
  marca: str20;
begin
  solicitarMarca(marca);
  writeln('La cantidad de autos de la marca ', marca, ' en el arbol ordenado por marcas es: ', contarPorMarcaArbolMarca(a, marca));
end;

// Procedimiento que inicializa el vector en nil
procedure inicializarVector(var v: vectorAnios);
var
  i: integer;
begin
  for i := anioMin to anioMax do begin
    v[i] := nil;
  end;
end;

// Procedimiento recursivo que recibe un nodo del arbol, y se encarga
// de agregarlo a la lista del vector correspondiente al año de fabricacion
// Luego se llama recursivamente con los hijos.
procedure crearVectorPorAnioRecursivo(a: arbolPatente; var v: vectorAnios);
var
  lAuto: listaAutos;
begin

  // Si el nodo no es nil es porque contiene datos, por lo que lo agrego
  // a la lista del vector correspondiente al año de fabricacion
  if (a <> nil) then begin

    // Creo el nodo de la lista y le asigno el valor del nodo del arbol
    // luego lo agrego al principio de la lista del vector
    new(lAuto);
    lAuto^.dato := a^.dato;
    lAuto^.sig := v[a^.dato.anio];
    v[a^.dato.anio] := lAuto;

    // Recorro recursivamente los hijos del nodo
    crearVectorPorAnioRecursivo(a^.HI, v);
    crearVectorPorAnioRecursivo(a^.HD, v);
  end;

// Procedimiento que inicializa el vector de años y delega
// a otro proceso para agregar los elementos al vector
procedure crearVectorPorAnio(a: arbolPatente; var v: vectorAnios);
begin
  inicializarVector(v);
  crearVectorPorAnioRec(a, v);
end;

var
  aPatente: arbolPatente;
  aMarca: arbolMarca;
  vAnios: vectorAnios;
begin

  // Punto a i y a ii
  cargarArboles(aPatente, aMarca);

  // Punto b
  totalPorMarcaArbolPatente(aPatente);

  // Punto c
  totalPorMarcaArbolMarca(aMarca);

  // Punto d
  crearVectorPorAnio(aPatente, vAnios);
end.