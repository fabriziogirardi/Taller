{
  1.- Implementar un programa que procese la información de los alumnos de la Facultad de
    Informática.
      a) Implementar un módulo que lea y retorne, en una estructura adecuada, la información de
        todos los alumnos. De cada alumno se lee su apellido, número de alumno, año de ingreso,
        cantidad de materias aprobadas (a lo sumo 36) y nota obtenida (sin contar los aplazos) en cada
        una de las materias aprobadas. La lectura finaliza cuando se ingresa el número de alumno
        11111, el cual debe procesarse.
      b) Implementar un módulo que reciba la estructura generada en el inciso a) y retorne número
        de alumno y promedio de cada alumno.
      c) Analizar: ¿qué cambios requieren los puntos a y b, si no se sabe de antemano la cantidad de
        materias aprobadas de cada alumno, y si además se desean registrar los aplazos? ¿cómo
        puede diseñarse una solución modularizada que requiera la menor cantidad de cambios?
}

program Practica0_Ejercicio1;

const
  corteAlumno = 11111;
  materiasMax = 36;

type
  str20 = string[20];
  rangoMaterias = 1..materiasMax;
  rangoNota = 1..10;

  vectorNotas = array[1..36] of rangoNota;

  recordAlumno = record
    apellido: str20;
    numeroAlumno: integer;
    anioIngreso: integer;
    cantidadMateriasAprobadas: rangoMaterias;
    notasObtenidas: vectorNotas;
  end;

  listaAlumnos = ^nodoAlumno;
  
  nodoAlumno = record
    dato: recordAlumno;
    sig: listaAlumnos;
  end;

  promedioDeAlumno = record
    numeroAlumno: integer;
    promedio: real;
  end;

  listaPromedios = ^nodoPromedio;

  nodoPromedio = record
    dato: promedioDeAlumno;
    sig: listaPromedios;
  end;

// Leer un alumno y devolverlo por referencia
procedure leerAlumno(var a: recordAlumno);
var
  i: integer;
begin
  with a do begin
    write('Ingrese el numero de alumno: ');
    readln(numeroAlumno);

    // Si el numero de alumno es distinto al corte, sigo la carga
    if (numeroAlumno <> corteAlumno) then begin
      write('Ingrese el apellido del alumno: ');
      readln(apellido);
      write('Ingrese el anio de ingreso: ');
      readln(anioIngreso);
      write('Ingrese la cantidad de materias aprobadas: ');
      readln(cantidadMateriasAprobadas);
      for i := 1 to cantidadMateriasAprobadas do begin
        write('Ingrese la nota obtenida en la materia ', i, ': ');
        readln(notasObtenidas[i]);
      end;
    end else begin

      // Sino, seteo todo a cosas vacías, e informo que se terminó la carga.
      apellido := '';
      anioIngreso := 0;
      cantidadMateriasAprobadas := 0;
      for i := 1 to materiasMax do
        notasObtenidas[i] := 0;
      
      write('Se detecto el numero de corte. La carga no continuara.');
    end;
  end;
end;

// Agregar un alumno a la lista (agregar adelante, ya que no hay orden establecido en el enunciado)
procedure agregarAlumno(var lAlumnos: listaAlumnos; a: recordAlumno);
var
  nuevo: listaAlumnos;
begin
  new(nuevo);
  nuevo^.dato:= a;
  nuevo^.sig:= lAlumnos;
  lAlumnos:= nuevo;
end;

// Procedimiento que loopea la carga de alumnos y delega a otros procedimientos
// la lectura de los datos y la carga en la lista
procedure cargarListaAlumnos(lAlumnos: listaAlumnos);
var
  a: recordAlumno;
begin
  leerAlumno(a);
  while (a.numeroAlumno <> corteAlumno) do begin
    agregarAlumno(lAlumnos, a);
    leerAlumno(a);
  end;
end;

// Agregar un promedio a la lista (agregar adelante, ya que no hay orden establecido en el enunciado)
procedure agregarPromedio(var lPromedios: listaPromedios; p: promedioDeAlumno);
var
  nuevo: listaPromedios;
begin
  new(nuevo);
  nuevo^.dato:= p;
  nuevo^.sig:= lPromedios;
  lPromedios:= nuevo;
end;

// Procedimiento que itera la lista de alumnos y calcula el promedio de cada uno
procedure obtenerPromediosDeAlumnos(lAlumnos: listaAlumnos; var listaPromedios: listaPromedios);
var
  i: integer;
  suma: integer;
  promedio: promedioDeAlumno;
begin
  while (lAlumnos <> nil) do begin
    // Calculo el promedio del alumno
    suma := 0;
    for i := 1 to lAlumnos^.dato.cantidadMateriasAprobadas do
      suma := suma + lAlumnos^.dato.notasObtenidas[i];
    
    promedio.numeroAlumno := lAlumnos^.dato.numeroAlumno;
    promedio.promedio := suma / lAlumnos^.dato.cantidadMateriasAprobadas;

    // Agrego el promedio a la lista de promedios
    agregarPromedio(listaPromedios, promedio);

    // Avanzo en la lista de alumnos
    lAlumnos := lAlumnos^.sig;
  end;
end;

var
  lAlumnos: listaAlumnos;
  lPromedios: listaPromedios;

begin
  lAlumnos := nil;
  lPromedios := nil;

  // Cargo la lista
  cargarListaAlumnos(lAlumnos);

  // Obtengo los promedios de todos
  obtenerPromediosDeAlumnos(lAlumnos, lPromedios);
end.