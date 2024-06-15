// Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
// alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
// nro de alumno de manera ascendente. Se pide:
// a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
// alumno seguro existe.
// b. Un módulo que reciba un alumno y lo inserte en el vector.
// c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
// d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
// e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
// Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
// leídos de teclado


program ej4;
const 
    dmf=1000;
type
    rango = [1..dmf];
    
    datosAlumno=record
        nro:integer;
        apellido:string;
        nombre:string;
        asistencias:integer;
    end;
    
    alumno = array[rango] to datosAlumno;

//Inciso A
procedure posAlumno ( a:alumno; pos: integer);
begin
    writeln('Los datos del alumno en la ', pos,' son: ');
    writeln('Número de alumno: ', a[pos].datosAlumno.nro);
    writeln('Nombre ', a[pos].datosAlumno.nombre);
    writeln('asistencias ', a[pos].datosAlumno.asistencias);
end;

// Inciso B Un módulo que reciba un alumno y lo inserte en el vector.
procedure insertarAlumnoOrdenado( var a:alumno; dato:datosAlumno; var dml:integer; var pude:boolean);
var
    i: integer;
begin
    pude:=false;
    // se puede agregar 
    if (dml < dmf)  then begin
        pude:=true;
        i:=1;
        // busca la posicion 
        while  (i <= dml) and (a[i].nro < dato.nro) do 
            i:=i+1;
        // hace lugar
        for i:=dml downto i do
            a[i+1]:=a[i];
        // ubica al nuevo elemento
        a[i]:=dato;
        dml:=dml+1;
        end;
    end;
end;

// {Programa principal}
var
    a: alumno;
    pos:integer;
    dml:integer;
    pude:boolean;
    dato:datosAlumno;
begin
    cargarAlumnos(a,dml); //Se dispone la carga del arreglo
    writeln('Ingrese la posicion del alumno: '); readln(pos); 
    posAlumno(a, pos);
    cargarNuevoAlumno(nuevoalumno);
    insertarAlumnoOrdenado(a,nuevoalumno,dml,ok);

end.