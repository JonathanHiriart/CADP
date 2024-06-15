// Una empresa de venta de tickets de tren esta analizando la informacion de los viajes realizados por sus trenes durante el año 2023
// Para ello ,se dispone una estructura de datos con la informacion de todos los viajes . De cada viaje se conoce el codigo de tren,
// el mes en que se realizo el viaje (1 y 12),la cantidad de pasajeros que viajaron,y el codigo de la ciudad de destino (1 y 20).LA INFORMACION
// SE ENCUENTRA ORDENADA POR CODIGO DE TREN.
// Ademas la empresa dispone una estructura de datos con informacion del costo del ticket por ciudad destino.
// Realizar un progrmaa que procese la informacion de los viajes y:+
// A.Genere una lista que tenga por cada codigo del tren, la cantidad de viajes realizados.
// B.Informe el mes con mayor monto recaudado.
// C.Informe el promedio de pasajeros por cada tren ente todos sus viajes.
program parcial1;
type
    codigodeviaje= [1..20];
    mesesTotal=array [1..12] of real;
    meses=[1..12];
    costPasaje= array [1..20] of real;

    viajes= record
        codigoTren:integer;
        mes:meses;
        cantidadPasajeros:integer;
        ciudadDestino:codigodeviaje;
    end;

    lista=^nodo;
    nodo=record
        dato:viajes;
        sig:lista;
    end; 
    tren=record
        cantidadViajes:integer;
        codigo:integer;
    end;
    lista2=^nodo
        dato:tren;
        sig:lista2;
// {modulos}

// insio a
procedure cargarEnLista(l:lista; var l2:lista);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=l;
    nuevo^.sig:=l2;
    l2:=nuevo;
end;


// insio b 





procedure recorrerLista(l:lista);
var
    tren:integer;
begin
    tren:=l^.dato.codigoTren;
    while l<>nil do begin
        if (tren = l^.dato.codigoTren) then
            cargarEnLista(l,l2);
        else
            tren:=l^.dato.codigoTren;

        l:=l^.sig;
    end;

end;

// A.Genere una lista que tenga por cada codigo del tren, la cantidad de viajes realizados.

// {programa principal}
var
    viaje:viajes;
    l:lista;
    l2:lista;
    v:costPasaje;
begin
    l:=nil;
    // se carga la lista con los viajes 
    cargarLista(l,v);// se dispone la lista 
    vectorEn0(v);// se dispone la lista 

    recorrerLista(l);
end.