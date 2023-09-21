{
  El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
  de las expensas de dichas oficinas. Implementar un programa con:

    a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
      administra. Se debe leer, para cada oficina, el código de identificación, DNI del
      propietario y valor de la expensa. La lectura finaliza cuando llega el código de
      identificación -1.
    b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
      código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
      vistos en la cursada.
    c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
      generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
      retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
      Luego el programa debe informar el DNI del propietario o un cartel indicando que no
      se encontró la oficina.
    d) Un módulo recursivo que retorne el monto total de las expensas.
}

program Practica5_Ejercicio1;
const
  dimF = 300;
  corte = -1;

type 
  oficinaRecord = record
    codigoIdentificacion: integer;
    dniPropietario: integer;
    valorExpensa: real;
  end;

  rangoDimF = 1..dimF;
  rangoDimL = 0..dimF;

  vectorOficinas = array [rangoDimF] of oficinaRecord;
  
procedure leerOficina(var o: oficinaRecord);
begin
  with o do begin
    write('Ingrese el codigo de identificacion: ');
    readln(codigoIdentificacion);

    if (codigoIdentificacion <> corte) then begin
      write('Ingrese el DNI del propietario: ');
      readln(dniPropietario);
      write('Ingrese el valor de la expensa: ');
      readln(valorExpensa);
    end;
  end;
end;

procedure cargarVector(var v: vectorOficinas; var dimL: rangoDimL);
var
  oficina: oficinaRecord;
begin
  leerOficina(oficina);

  while (oficina.codigoIdentificacion <> corte) and (dimL < dimF) do begin
    dimL := dimL + 1;
    v[dimL] := oficina;

    if (dimL < dimF) then begin
      leerOficina(oficina);
    end;
  end;
end;

procedure ordenarVector(var v: vectorOficinas; dimL: rangoDimL);
var
  i, j: integer;
  tmp: oficinaRecord;
begin
  for i := 2 to dimL do begin
    tmp := v[i];
    j := i - 1;

    while (j > 0) and (v[j].codigoIdentificacion > tmp.codigoIdentificacion) do begin
      v[j + 1] := v[j];
      j := j - 1;
    end;

    v[j + 1] := tmp;
  end;
end;

function busquedaDicotomicaFunction(v: vectorOficinas; dimL: rangoDimL; codigoIdentificacion: integer): integer;
var
  medio, pri, ult: integer;
  encontro: boolean;
begin
  encontro := false;
  pri := 1;
  ult := dimL;

  medio := (pri + ult) div 2;

  while ((pri <= ult) and (not encontro)) do begin
    if (v[medio].codigoIdentificacion = codigoIdentificacion) then begin
      encontro := true;
    end else begin
      if (codigoIdentificacion < v[medio].codigoIdentificacion) then begin
        ult := medio - 1;
      end else begin
        pri := medio + 1;
      end;
    end;
  end;

  if (encontro) then begin
    busquedaDicotomicaFunction := medio;
  end else begin
    busquedaDicotomicaFunction := 0;
  end;
end;

procedure busquedaDicotomica(v: vectorOficinas; dimL: rangoDimL);
var
  codigoIdentificacion: integer;
  pos: integer;
  encontro: boolean;
begin
  write('Ingrese el codigo de identificacion a buscar: ');
  readln(codigoIdentificacion);

  pos := busquedaDicotomicaFunction(v, dimL, codigoIdentificacion);

  if (pos <> 0) then begin
    writeln('El DNI del propietario es: ', v[pos].dniPropietario);
  end else begin
    writeln('No se encontro la oficina');
  end;
end;

function montoTotalExpensas(v: vectorOficinas; dimL: rangoDimL): real;
begin
  if (dimL = 0) then begin
    montoTotalExpensas := 0;
  end else begin
    montoTotalExpensas := v[dimL].valorExpensa + montoTotalExpensas(v, dimL - 1);
  end;
end;

var
  vOficinas: vectorOficinas;
  dimL: rangoDimL;

begin
  dimL := 0;

  cargarVector(vOficinas, dimL);
  ordenarVector(vOficinas, dimL);
  busquedaDicotomica(vOficinas, dimL);
end.