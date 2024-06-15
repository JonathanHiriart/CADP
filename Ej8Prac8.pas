// 11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
// entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y
// el promedio obtenido durante toda su carrera.
// Implementar un programa que:
// a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
// b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
// egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio
// del egresado (de mayor a menor).
program ejercicio11;
type
    egresado = record
        numeroAlumno:integer;
        apellido:string[20];
        promedio:real;
        end;
    lista = ^nodo;
    nodo = record
        datos:egresado;
        sig:lista;
    end;

procedure leerEgresado(var e:egresado);
begin
    writeln('ingresar apellido del egresado');
    read(e.apellido);
    writeln('ingresar el numero de alumno');
    read(e.numeroAlumno);
    writeln('ingresar el promedio');
    read(e.promedio);
end;

procedure insertarOrdenado(var l: lista);
var
    e: egresado;       // Variable para almacenar el egresado leído
    nuevo: lista;      // Puntero al nuevo nodo a insertar
    act, ant: lista;   // Punteros auxiliares para la posición actual y el anterior en la lista
begin
    leerEgresado(e); // Función que lee un egresado y lo guarda en 'e'
    while (e.numeroAlumno <> 0) do begin
        new(nuevo);           // Crear un nuevo nodo
        nuevo^.datos := e;    // Asignar los datos del egresado al nuevo nodo
        nuevo^.sig := nil;    // El siguiente nodo del nuevo es inicialmente nil
        
        // Si la lista está vacía, insertar el nuevo nodo como el primer nodo
        if (l = nil) then
            l := nuevo
        else
        begin
            ant := l;  // Inicializar 'ant' al principio de la lista
            act := l;  // Inicializar 'act' al principio de la lista
            
            // Buscar la posición correcta para insertar el nuevo nodo
            while (act <> nil) and (act^.datos.promedio < e.promedio) do begin
                ant := act;      // Avanzar 'ant' a la posición actual
                act := act^.sig; // Avanzar 'act' al siguiente nodo
            end;
            
            // Insertar el nuevo nodo al principio de la lista
            if (act = l) then begin
                nuevo^.sig := l; // El siguiente del nuevo nodo es el primer nodo actual
                l := nuevo       // El nuevo nodo se convierte en el primer nodo de la lista
            end
            // Insertar el nuevo nodo en el medio o al final de la lista
            else begin
                ant^.sig := nuevo; // El siguiente del nodo anterior es el nuevo nodo
                nuevo^.sig := act; // El siguiente del nuevo nodo es el nodo actual
            end;
        end;
        leerEgresado(e); // Leer el siguiente egresado
    end;
end;

procedure cargarLista(var l:lista);
var
    e:egresado;
begin
    leerEgresado(e);
    while e.numeroAlumno <> 0 do begin
        insertarOrdenado(l,e);
        leerEgresado(e);
    end;
end;

// { programa principal}

var
    l:lista;
    e:egresado;
begin
    l:=nil;  
    cargarLista(l);
end.