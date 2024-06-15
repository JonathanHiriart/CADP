// una tienda virtual necestia un programa para administrar la informacion de sus clientes de cada cliente se lee:
// numero , dni apellido y nombre , fecha de nacimiento (dia , mes y año ), nivel (1..5)y puntaje. la lectura finaliza 
// cuando se lee el cliente DNI 33444555, que debe procesarse.
// se pide 
// A. Generar una estructura que contega numero , apellido y nombre de aquellos clientes con dni compuesto solamente por digitos impares.
// B. Informar los niveles con mayor y menor puntaje acumulado por los clientes nacidos antes del año 2000.
// C. Implementar un modulo que elimine, de la estructura generada , la informacion relacionada a un numero de cliente recibido por parametro.
// tener en cuenta que dicho numero puede no existir en la estructura 
program parcial4;
const
    rango = [1..5];
type
    nacimiento=record
        dia:integer;
        mes:integer;
        anio:integer;
    end;
    // lista 1
    
    cliente=record
        numero:string;
        dni:integer;
        apellido:string;
        nombre:string;
        Anio:nacimiento;
        nivel:integer;
        puntaje:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:cliente;
        sig:lista;
    end;

    // lista 2
    clienteImpar=record
        numero:integer;
        apellido:string;
        nombre:string;
    end;
    listaImpar=^nodoImpar;
    nodoImpar=record
        dato:clienteImpar;
        sig:listaImpar;
    end;

    nivel = array[1..5] of integer;
// {modulo}

procedure agregarCliente(c:cliente; var l:lista);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=c;
    nuevo^.sig:=l;
    l:=nuevo;
end;

procedure cargarCliente(var l:lista);
var
    c:cliente;
begin
    repeat
        writeln('ingrese su DNI');  
        readln(c.dni);
        if (c.dni <> 33444555) then begin
            writeln('ingrese su apellido');
            readln(c.apellido);
            writeln('ingrese su nombre');
            readln(c.nombre);
            writeln('ingrese su dia de nacimiento');
            readln(c.Anio.dia);
            writeln('ingrese su mes de nacimiento');
            readln(c.Anio.mes);
            writeln('ingrese su anio de nacimiento');
            readln(c.Anio.anio);
            writeln('ingrese su nivel');
            readln(c.nivel);
            writeln('ingrese su puntaje');
            readln(c.puntaje);
            agregarCliente(c,l);
        end;
    until (c.dni <> 33444555);
end;

function impar(l:lista):boolean;
var
    ok:boolean;
    num,dig:integer;
begin
    ok:=true;
    num:=l^.dato.dni;
    while (num <> 0) do begin
        dig:=num mod 10;
        if (dig mod 2 = 0) then
            impar:=false;
        num:= num div 10;
    end;
    impar:=ok;
end;
procedure agregarNuevaLista(l:lista; var l2:listaImpar);
var
    nuevo:lista;
begin
// agregar adelante
    new(nuevo);
    nuevo^.dato.nombre:=l^.dato.nombre;
    nuevo^.dato.numero:=l^.dato.numero;
    nuevo^.dato.apellido:=l^.dato.apellido;
    nuevo^.sig:=l2;
    l2:=nuevo;
end;

// Inciso B
// inicializas el vector en 0
procedure vectorEn0(var v:nivel);
var 
    i:integer;
begin
    for i:=1 to 5 do begin
        v[i]:=0;
    end;
end;

// cargar los puntajes de los jugadores en el vector
procedure cargarPuntaje(l:lista; var v:nivel);
begin
    v[l^.dato.nivel]:=v[l^.dato.nivel] + l^.dato.puntaje;
end;

// informar los maximos y min de los puntajes 
procedure informarMaxMin(v:nivel);
var 
    max,min:integer;
    i:integer;
    posMax,posMin:integer;
begin
    max:=0;
    min:=0;
    for i:=1 to 5 do begin
        if (v[i]> max) then
            max:=v[i];
            posMax:=i;
        if (v[i]< min)then  
            min:=v[i];
            posMin:=i;
    end;
    writeln('los mayores puntajes se encontraron en ',posMax,' y es ',max);
    writeln('los menores puntajes se encontraron en ',posMin,' y es ',min);
end;
// eliminar
procedure eliminarL(num:integer; var l2:listaImpar);
var
    act,ant:listaImpar;
begin
    act:=l2;
    ant:=l2;
    while (act <> nil) do begin
    // busca el elemento a eliminar 
        if (act^.dato.numero <> num) then begin
            ant:=act;
            act:=act^.sig;
        end
        else
        // si es el inicio 
            if (act = l2) then 
                l2:=act^.sig;
        // evalua si no es el final
            if (act^.sig <> nil) then begin
                ant^.sig:=act^.sig;
            end;
            dispose(act);
            act:=ant;
    // avanza 
        act:=act^.sig;
    end;
end;

procedure recorrerLista(l:lista; var l2:listaImpar; var v:nivel);
begin
    vectorEn0(v);
    while l<>nil do begin
        if (impar(l)) then
            agregarNuevaLista(l,l2);
        if (l^.dato.Anio.anio <= 2000) then
            cargarPuntaje(l,v);
        l:=l^.sig;
    end;
    informarMaxMin(v);
end;



// {programa principal}
var 
    l:lista;
    num:integer;
    l2:listaImpar;
    v:nivel;
begin
    l:=nil;
    cargarCliente(l);
    recorrerLista(l,l2,v);
    writeln('ingrese el codigo a eliminar');
    readln(num);
    eliminarL(num,l2);
end.