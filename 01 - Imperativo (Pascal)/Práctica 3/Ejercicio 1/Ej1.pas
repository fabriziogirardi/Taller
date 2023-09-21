{
  Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
xi. Informe los números de socio en orden creciente.
x. Informe los números de socio pares en orden decreciente.
}

program Practica3_Ejercicio1;

// CONSTANTES
const
  socioCorte = 0;

// TIPOS
type
  socio = record
    numeroSocio: integer;
    nombre: string;
    edad: integer;
  end;

  arbolSocios = ^nodoSocio;
  nodoSocio = record
    dato: socio;
    HI: arbolSocios;
    HD: arbolSocios;
  end;

// Para separar los textos y dar mejor legibilidad
procedure separadorDeTexto();
begin
  writeln('----------------------------------------------');
  writeln('');
end;

// Leer el socio
procedure leerSocio(var s: socio);
begin
  with s do begin
    write('Ingrese el numero de socio: ');
    readln(numeroSocio);

    // Si el num es distinto al num de corte
    // seguir leyendo los demás datos
    if (numeroSocio <> socioCorte) then begin
      write('Ingrese el nombre del socio: ');
      readln(nombre);
      write('Ingrese la edad del socio: ');
      readln(edad);
    end;
  end;
end;

// Insertar el socio en el arbol
procedure insertarSocio(var a: arbolSocios; s: socio);
begin

  // Si el arbol esta vacio
  // crear un nuevo nodo
  if (a = nil) then begin
    new(a);
    a^.dato := s;
    a^.HI := nil;
    a^.HD := nil;
  end else begin

    // Si el numero del socio es menor al numero del nodo
    // insertar el socio en el hijo izquierdo
    if (s.numeroSocio < a^.dato.numeroSocio) then begin
      insertarSocio(a^.HI, s)

    // Si el numero del socio es mayor al numero del nodo
    // insertar el socio en el hijo derecho
    end else begin
      insertarSocio(a^.HD, s);
    end;
  end;
end;

// Cargar los socios en el arbol
procedure cargarSocios(var a: arbolSocios);
var
  s: socio;
begin
  leerSocio(s);

  // Mientras el numero del socio sea distinto al numero de corte
  // insertar el socio en el arbol y leer el siguiente socio
  while (s.numeroSocio <> socioCorte) do begin
    insertarSocio(a, s);
    leerSocio(s);
  end;
end;

// Buscar el numero de socio mas grande
function buscarSocioConNumeroDeSocioMasGrande(a: arbolSocios): integer;
begin

  // Estan ordenados, así que el mas grande
  // es el ultimo hacia la derecha
  if (a^.HD = nil) then begin
    buscarSocioConNumeroDeSocioMasGrande := a^.dato.numeroSocio;
  end else begin
    buscarSocioConNumeroDeSocioMasGrande := buscarSocioConNumeroDeSocioMasGrande(a^.HD);
  end;
end;

// Informar el numero de socio mas grande
procedure informarNumeroDeSocioMasGrande(a: arbolSocios);
var
  num: integer;
begin
  num := buscarSocioConNumeroDeSocioMasGrande(a);
  writeln('El numero de socio mas grande es: ', num);
end;

// Buscar el socio con el numero de socio mas chico
procedure buscarSocioConNumeroDeSocioMasChico(a: arbolSocios; var socio: socio);
begin

  // Estan ordenados, así que el mas chico
  // es el ultimo hacia la izquierda
  if (a^.HI = nil) then begin
    socio := a^.dato;
  end else begin
    buscarSocioConNumeroDeSocioMasChico(a^.HI, socio);
  end;
end;

// Informar los datos del socio con el numero de socio mas chico
procedure informarDatosSocioConNumeroDeSocioMasChico(a: arbolSocios);
var
  s: socio;
begin
  buscarSocioConNumeroDeSocioMasChico(a, s);
  
  // Muestro los datos del socio
  writeln('Los datos del socio con el numero de socio mas chico son: ');
  writeln('Numero de socio: ', s.numeroSocio);
  writeln('Nombre: ', s.nombre);
  writeln('Edad: ', s.edad);
end;

// Buscar el numero de socio con mayor edad
procedure buscarNumeroDeSocioConMayorEdad(a: arbolSocios; edad: integer; var numeroDeSocio: integer);
begin

  // Si el hijo izquierdo no es nil, buscar en el hijo izquierdo
  if (a^.HI <> nil) then begin
    buscarNumeroDeSocioConMayorEdad(a^.HI, edad, numeroDeSocio);
  end;

  // Si la edad del socio actual es mayor a la edad
  // del socio con mayor edad, actualizar la edad y el numero de socio
  if (a^.dato.edad > edad) then begin
    edad := a^.dato.edad;
    numeroDeSocio := a^.dato.numeroSocio;
  end;

  // Si el hijo derecho no es nil, buscar en el hijo derecho
  if (a^.HD <> nil) then begin
    buscarNumeroDeSocioConMayorEdad(a^.HD, edad, numeroDeSocio);
  end;
end;

// Informar el numero de socio con mayor edad
procedure informarNumeroDeSocioConMayorEdad(a: arbolSocios);
var
  edad: integer;
  numeroDeSocio: integer;
begin
  // Inicializo la edad en 0
  edad := 0;

  // Busco el numero de socio con mayor edad e imprimo el resultado
  buscarNumeroDeSocioConMayorEdad(a, edad, numeroDeSocio);
  writeln('El numero de socio con mayor edad es: ', numeroDeSocio);
end;

// Aumentar en 1 la edad de todos los socios
procedure aumentarEdadDeSocios(var a: arbolSocios);
begin

  // Si el arbol no es nil, aumentar la edad de todos recursivamente
  if (a <> nil) then begin
    aumentarEdadDeSocios(a^.HI);
    a^.dato.edad := a^.dato.edad + 1;
    aumentarEdadDeSocios(a^.HD);
  end;
end;

// Buscar si existe socio con el numero de socio leido
function existeSocioConNumeroDeSocioLeido(a: arbolSocios; numeroDeSocio: integer): boolean;
begin

  // Si llegamos al final y no lo encontramos, no existe
  if (a = nil) then begin
    existeSocioConNumeroDeSocioLeido := false;
  end else begin

    // Si el numero de socio actual es igual al numero de socio leido, existe
    if (a^.dato.numeroSocio = numeroDeSocio) then begin
      existeSocioConNumeroDeSocioLeido := true;
    end else begin

      // Si el numero de socio actual es mayor al numero de socio leido
      // se busca en los hijos derechos, sino en los hijos izquierdos
      if (numeroDeSocio > a^.dato.numeroSocio) then begin
        existeSocioConNumeroDeSocioLeido := existeSocioConNumeroDeSocioLeido(a^.HD, numeroDeSocio);
      end else begin
        existeSocioConNumeroDeSocioLeido := existeSocioConNumeroDeSocioLeido(a^.HI, numeroDeSocio);
      end;
    end;
  end;
end;

// Informar si existe socio con el numero de socio leido
procedure informarSiExisteSocioConNumeroDeSocioLeido(a: arbolSocios);
var
  numeroDeSocio: integer;
begin

  // Leo los datos
  write('Ingrese el numero de socio a buscar: ');
  readln(numeroDeSocio);

  // Imprimo el resultado luego de buscar el numero de socio en el arbol
  if (existeSocioConNumeroDeSocioLeido(a, numeroDeSocio)) then begin
    writeln('Existe socio con el numero de socio leido');
  end else begin
    writeln('No existe socio con el numero de socio leido');
  end;
end;

// Buscar si existe socio con el nombre leido
function existeSocioConNombreLeido(a: arbolSocios; nombre: string): boolean;
begin

  // Si llegamos al final y no lo encontramos, no existe
  if (a = nil) then begin
    existeSocioConNombreLeido := false;
  end else begin

    // Si el nombre del socio actual es igual al nombre leido, existe
    if (a^.dato.nombre = nombre) then begin
      existeSocioConNombreLeido := true;
    end else begin

      // Busco en los hijos
      existeSocioConNombreLeido := (existeSocioConNombreLeido(a^.HI, nombre) or existeSocioConNombreLeido(a^.HD, nombre));
    end;
  end;
end;

// Informar si existe socio con el nombre leido
procedure informarSiExisteSocioConNombreLeido(a: arbolSocios);
var
  nombre: string;
begin

  // Leo los datos
  write('Ingrese el nombre del socio a buscar: ');
  readln(nombre);

  // Imprimo el resultado luego de buscar el nombre en el arbol
  if (existeSocioConNombreLeido(a, nombre)) then begin
    writeln('Existe socio con el nombre leido');
  end else begin
    writeln('No existe socio con el nombre leido');
  end;
end;

// Contar la cantidad de socios
function contarSocios(a: arbolSocios): integer;
begin

  // Si el arbol es nil, no hay socios
  if (a = nil) then begin
    contarSocios := 0;
  end else begin

    // Si el arbol no es nil, sumar 1 y contar los hijos
    contarSocios := 1 + contarSocios(a^.HI) + contarSocios(a^.HD);
  end;
end;

// Informar la cantidad de socios
procedure informarCantidadDeSocios(a: arbolSocios);
begin
  writeln('La cantidad de socios es: ', contarSocios(a));
end;

// Sumar las edades de los socios
function sumarEdadesDeSocios(a: arbolSocios): integer;
begin

  // Si el arbol es nil, no hay edades
  if (a = nil) then begin
    sumarEdadesDeSocios := 0;
  end else begin

    // Si el arbol no es nil, sumar la edad del socio actual
    // y sumar las edades de los hijos
    sumarEdadesDeSocios := a^.dato.edad + sumarEdadesDeSocios(a^.HI) + sumarEdadesDeSocios(a^.HD);
  end;
end;

// Informar el promedio de edad de los socios
procedure informarPromedioDeEdadDeSocios(a: arbolSocios);
begin
  writeln('El promedio de edad de los socios es: ', sumarEdadesDeSocios(a) / contarSocios(a));
end;

// Informar los numeros de socio en orden creciente
procedure informarNumerosDeSocioEnOrdenCreciente(a: arbolSocios);
begin

  // Si el arbol no es nil, imprimir los numeros de socio en orden creciente
  if (a <> nil) then begin
    informarNumerosDeSocioEnOrdenCreciente(a^.HI);
    writeln('Numero de socio: ', a^.dato.numeroSocio);
    informarNumerosDeSocioEnOrdenCreciente(a^.HD);
  end;
end;

// Informar los numeros de socio pares en orden decreciente
procedure informarNumerosDeSocioParesEnOrdenDecreciente(a: arbolSocios);
begin

  // Si el arbol no es nil, imprimir los numeros de socio pares en orden decreciente
  if (a <> nil) then begin
    informarNumerosDeSocioParesEnOrdenDecreciente(a^.HD);

    // Si el numero de socio es par, imprimirlo
    if (a^.dato.numeroSocio mod 2 = 0) then begin
      writeln('Numero de socio: ', a^.dato.numeroSocio);
    end;

    informarNumerosDeSocioParesEnOrdenDecreciente(a^.HI);
  end;
end;

var
  socios: arbolSocios;

begin

  // Cargo el arbol de socios (inciso a)
  cargarSocios(socios);
  separadorDeTexto();

  // Informo el numero de socio mas grande (inciso b.i)
  informarNumeroDeSocioMasGrande(socios);
  separadorDeTexto();

  // Informo los datos del socio con el numero de socio mas chico (inciso b.ii)
  informarDatosSocioConNumeroDeSocioMasChico(socios);
  separadorDeTexto();

  // Informo el numero de socio con mayor edad (inciso b.iii)
  informarNumeroDeSocioConMayorEdad(socios);
  separadorDeTexto();

  // Aumento en 1 la edad de todos los socios (inciso b.iv)
  aumentarEdadDeSocios(socios);

  // Informar si existe socio con el numero de socio leido (inciso b.v)
  informarSiExisteSocioConNumeroDeSocioLeido(socios);
  separadorDeTexto();

  // Informar si existe socio con el nombre leido (inciso b.vi)
  informarSiExisteSocioConNombreLeido(socios);
  separadorDeTexto();

  // Informar la cantidad de socios (inciso b.vii)
  informarCantidadDeSocios(socios);
  separadorDeTexto();

  // Informar el promedio de edad de los socios (inciso b.viii)
  informarPromedioDeEdadDeSocios(socios);
  separadorDeTexto();

  // Informar los numeros de socio en orden creciente (inciso b.ix)
  informarNumerosDeSocioEnOrdenCreciente(socios);
  separadorDeTexto();

  // Informar los numeros de socio pares en orden decreciente (inciso b.x)
  informarNumerosDeSocioParesEnOrdenDecreciente(socios);
  separadorDeTexto();
end.
