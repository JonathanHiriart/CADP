el siguiente programa imprime el alumno con mejor promerdio entre todos los examnes que rindio (maximo 30 )
completar con los tipos de datos y el modulo maximo
program 
type
    datosnotas:array[1...maxnotas]of integer;
    datos:array[1...100] of alumno;
    alumno:record
        nombre:string;
        nota:datosnotas;
        promedio:real;
        diml:integer;
        end;
function sumar (v:alumnos; cant:integer):integer;
var
    i,sum:integer;
begin
    sum:=0;
    for i:=1 to cant do
        suma:=suma +v[i];
        sumar:=suma;
end;

procedure imprimiralumnos (a:alumno);
begin
    writeln(a.nombre, 'obtuvo el promedio',a.prom,'entre los',a.dimf 'examnes que rindio')
end;


function maximo(a:datos):integer;
var 
    i,posmax:integer
    max:real;
begin
    max:=-999
    for i to dimf do begin
        if (a[i].prom => max)then
            max:= a[i].prom;
            posmax:= i; 
    end;
    maximo:=max;
end
const dimf= 100; 
const maxnotas=30;
var 
alumnos:datos;
i,suma:integer;
begin
    cargardatos(alumnos);
    for i:=1 to dimf do begin
        suma:=sumar (alumno[i].notas,alumnos[i].dimf);
        alumnos[i].prom=suma /alumnos[i].dimf;
    end;
    imprimiralumnos(alumnos[maximo (alumno)]);
    maximo(alumnos)
end.    