// La catedra de cadp necesita un programa para generar el listado de alumnos igresantes que rendiran el parcial ,
// para ellos, la catedra dispone de un listado con todos almunos que ingresaron este año a la facultad .
// De cada alumno se conoce su DNI, nombre y apellido, nota obtenida en curso de ingreso (entre 4 y 10 ), turno (entre 1 y 4) y
// si estuvo presente o ausente en cada una de las 12 clases de practica.
// A. Realizar un modulo que reciba la informacion de los alumnos y retorne una nueva estructura de datos que contega solo aquellos alumnos
// que podran rendir el parcial.Para poder rendir el parcial, los alumnos deben contar con al menos 8 asistencias en las 12 clases de practica.
// B. Realizar un modulo que reciba la estructura de datos generada en el inciso anterior, e IMPRIMIR en pantalla:
// 1. apellido y nombre y el dni de los alumnos que hayan obtendio nota 8 o superior en el ingreso.
// 2. Turno con mayor cantidad de alumnos en condiciones de rendir el examen.
// 3. cantidad de alumnos que no posean ningun digito cero en su DNI.


program parcial5;
type
    asis=array [1.12] of boolean;
    almunos=record
        dni:integer;
        nombre:string;
        apellido:string;
        notaIngreso:notaAprobada;
        turno:Tturnos;
        asistencias:asis;
    end;
    lista=^nodo;
    nodo=record
        dato:alumnos;
        sig:lista;
    end;


// inciso a
function puedeAsistir(l:lista):boolean;
var 
    i,contador:integer;
begin
    puedeAsistir:=false;
    for i := 1 to 12 do begin
        if (l^.dato.asistencias[i]=true) then 
            contador:=contador + 1;
    end;
    if (contador => 8) then
        puedeAsistir:=true;
end;

procedure agregarLista(l:lista; var l2:lista);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=l;
    nuevo^.sig:=l2;
    l2:=nuevo;
end;

//  inciso b 
// apellido y nombre y el dni de los alumnos que hayan obtendio nota 8 o superior en el ingreso.

procedure recorrerLista(l:lista; var l2:lista);
begin
    while l <> nil do begin
        if (puedeAsistir(l)=true)then
            agregarLista(l,l2);
        l:=l^.sig;
    end;
end;


// {programa principal}
var
    l:lista;
begin
    l:=nil;
    // se dispone de la lista de alumnos 
    cargarLista(l);
    recorrLista(l,l2)
end;


// sin terminar falta hacer todo el inciso b
