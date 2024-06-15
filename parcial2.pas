program parcial2;
type,
    Tgenero=[1..5];
    sesiones=record
        titulo:string;
        nombreA:string;
        genero:Tgenero;
        añoDeEstreno:integer;
        cantRepSpoty:integer;
        end;
    lista=^nodo
    nodo=record
        datos:sesiones;
        sig:lista;
    end;
// {modulo}

procedure menor(l:lista; var min1,min2:integer);
var
    aux:integer;
begin
    aux:=l^.datos.cantRepSpoty;
    if (aux < min1)then begin
        min2:=min1
        min1:=aux;
        end
    else if (aux < min2) then 
        min2:=aux;
    end;
end;

function multiploDe5(l:lista; var pude:boolean):boolean;
var
    aux:integer;
    digitosSumados:integer;
begin
    aux:=l^.datos.añoDeEstreno
    pude:=false;
// suma de digitos de la cantidad de reporducciones sea multiplo de 5
    while (aux > 0) do begin
        aux:=aux mod 10;
        digitosSumados:=digitosSumados + aux;
    end;
    if (digitosSumados div 5 = 0) then
        pude:=true
    multiploDe5:=pude;
end;


procedure agregarOrdenado(l:lista; var l2:lista);
var
    nuevo,ant,act:lista;
begin
    new(nuevo);
    nuevo^.datos:=l.datos;
    nuevo^.sig:=nil;
    // agrego al inicio si esta vacia 
    if (l2 = nil) then
        l2:=nuevo;
    else
    begin
        act:=l2;
        ant:=l2;
        // si no es el primero tengo que buscarlo
        while (act <> nil) and (act^.dato.añoDeEstreno <) do begin
            ant:=act;
            act:=act^.sig;
        end;
        // si es el primero 
        if (act = l2) then begin
            nuevo^.sig:=l2;
            l2:=nuevo;
        else begin // si esta en el medio y tambien en el final
            ant^.sig:=nuevo;
            nuevo^.sig:=act;
        end;
end;

procedure listaOrdenada(l:lista; var l2:lista);
begin
    if (l^.datos.genero = 1) or (l^.datos.genero = 3) then begin
        if (multiploDe5(l,pude)=true)then
            agregarOrdenado(l,l2);
end;

procedure lista2(l2:lista);
var
    añoActual:integer;
    cantSesiones,cantRep:integer;
begin
    if l2<>nil then
        añoActual:=l2^.datos.añoDeEstreno;
    while l2<> nil do begin
        if añoActual= l2^.datos.añoDeEstreno then begin
            cantSesiones:=cantSesiones + 1;
            cantRep:=cantRep + l2^.datos.cantRepSpoty;
            end;
        else begin
            writeln('Año: ',añoActual,' Cant sesiones: ',cantSesiones, 'cantidad de reproduciones', cantRep);
            añoActual:=l2^.datos.añoDeEstreno;
            cantRep:=0;
            cantSesiones:=0;
        end;
        l2:=l2^.sig;    
end;

procedure recorrerLista(l:lista; var min1,min2:integer; var l2:lista);
begin
    while (l<>nil) do begin
        menor(l,min1,min2);
        listaOrdenada(l,l2)
        l:=l^.sig;
    end
end;

// {Program principal}
var
    l:lista;
    l2:lista;
    min1,min2:integer;
    
begin
    l:=nil;
    recorrerLista(l,min1,min2,l2);
end;
    