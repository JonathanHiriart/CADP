// una empresa de venta de pasajes aereos esta analizando la informacion de los viajes realizados por sus 
// aviones .


//  Para ello, DISPONE de una estructura de datos con la informacion de todos los viajes . 

// De cada viaje
// se conoce el codigo de avion (entre 1000 y 2500), el año en que se realizo el viaje,la cantidad de pasajeros
// que viajaron, y la ciudad de destino. La informacion no se encuentra ordenada por nigun criterio.
// Ademas, la empresa dispone de una estructura de datos con informacion sobre la capacidad maxima de cada avion.

// realiza un programa que procese la informacion de los viajes e:

// A informe el codigo del avion que realizo la mayor cantidad de viajes.
// B. genere una lista con los viajes realizados en años multiplo de 10 con destino "Punta Cana" en los que el
// avion no alcanzo su capacidad Maxima 
// C. Completo: para cada avion, informe  el promedio de pasajeros que viajaronentre todos sus viajes.


program parcial7;
type
    capacidadAviones = array[1000..2500] of integer;
    viajes = array[1000..2500] of integer;
    pasajeros = array[1000..2500] of integer;
    rango=1000..2500;
    viaje=record
        cAvion:rango;
        anioViaje:integer;
        cantPasajeros:integer;
        destino:string;
    end;
    lista=^nodo;
    nodo=record
        dato:viaje;
        sig:lista;
    end;
// {modulos}
// Insio a
// A informe el codigo del avion que realizo la mayor cantidad de viajes.
procedure llenarVector(l:lista; var v:viajes);
begin
    v[l^.dato.cAvion]:=v[l^.dato.cAvion] + 1;
end;

procedure maximo(v:viajes; var max:integer);
var 
    i:integer;
    pos:integer;
begin
    max:=0;
    for i:=1000 to 2500 do begin
        if v[i] > max then begin
            max:=v[i];
            pos:=i;
        end; 
    end;
    writeln('el codigo del avion que tiene mas viajes ',pos );
end;

// inciso b
// B. genere una lista con los viajes realizados en años multiplo de 10 con destino "Punta Cana" en los que el
// avion no alcanzo su capacidad Maxima


function multiploDe10(l:lista):boolean;
begin
    multiploDe10:=false;
    if ((l^.dato.anioViaje mod 10) = 0 )then
        multiploDe10:=true;
end;

function capMax(l:lista; cap:capacidadAviones ):boolean;
begin
    capMax:=false;
    if (l^.dato.cantPasajeros < cap[l^.dato.cAvion] ) then
        capMax:=true;
end;

procedure agregarEnlaLista(l:lista; var l2:lista);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=l^.dato;
    nuevo^.sig:=l2;
    l2:=nuevo;
end;
// inciso c 
// C. Completo: para cada avion, informe  el promedio de pasajeros que viajaron entre todos sus viajes.


procedure llenarPasajero(l:lista; var v:pasajeros);
begin
    v[l^.dato.cAvion]:=v[l^.dato.cAvion] + l^.dato.cantPasajeros;
end;

procedure promedioPasajeros(pas:pasajeros; v:viajes);
var 
    i:integer;
    prom:real;
begin
    for i := 1000 to 2500 do begin
        prom:= pas[i] / v[i];
        writeln('el avion ', i , 'tiene el promedio de ', prom);
    end;
end;


// recorrerLista
procedure recorrerLista(l:lista; var l2:lista; var v:viajes; var cap:capacidadAviones; var pas:pasajeros; var max:integer);
begin
    while l <> nil do begin
    // lleno el vector y luego comparo 
        llenarVector(l,v);
        llenarPasajero(l,pas);
        if ((multiploDe10(l) = true) and (l^.dato.destino = 'Punta Cana') and (capMax(l,cap)= true)) then begin
            agregarEnlaLista(l,l2);
        end;
        l:=l^.sig;
    end;
    maximo(v,max);
    promedioPasajeros(pas,v);
end;

// {programa principal}
var
    v:viajes;
    l:lista;
    cap:capacidadAviones;
    pas:pasajeros;
    l2:lista;
    max:integer;
begin
    l:=nil;
    cargarLista(l);// se dispone
    cargarVector(cap);// se dispone
    recorrerLista(l,l2,v,cap,pas,max);
end.