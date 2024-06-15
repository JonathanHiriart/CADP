// La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales
// lanzadas al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la
// misión (cantidad de meses que permanecerá activa), el costo de construcción, el costo de
// mantenimiento mensual y rango del espectro electromagnético sobre el que realizará estudios. Dicho
// rango se divide en 7 categorías: 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta;
// 6. rayos X; 7. rayos gamma.
// Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura
// finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse.
// Una vez finalizada la lectura, informar:
// a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
// b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
// c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
// d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las
// sondas.
// Nota: para resolver los incisos a), b), c) y d), 
// la lista debe recorrerse la menor cantidad de veces posible



program ejercicio6;

type
    rango = array [1..7] of integer;
    
    sondas = record
        nombre: string;
        duracion: integer;
        costo_construccion: real;
        costo_mantenimiento: real;
        rango_espectro: integer;
    end;
    
    lista = ^nodo;
    nodo = record
        dato: sondas;
        sig: lista;
    end;

// {modulos}

procedure agregarSonda(s: sondas; var l: lista);
var
    aux: lista;
begin
    new(aux);
    aux^.dato := s;
    aux^.sig := l;
    l := aux;
end;

procedure leerlista(var l: lista);
var 
    s: sondas;
begin
    repeat
        writeln('Introduce el nombre de la sonda:');
        readln(s.nombre);
    
        writeln('Introduce la duracion de la sonda:');
        readln(s.duracion);
    
        writeln('Introduce el costo de construccion de la sonda:');
        readln(s.costo_construccion);
        
        writeln('Introduce el costo de mantenimiento de la sonda:');
        readln(s.costo_mantenimiento);
        
        writeln('Introduce el rango de espectro de la sonda (1-7):');
        readln(s.rango_espectro);

        agregarSonda(s, l);
        writeln ('---------------------------');
    until (s.nombre = 'GAIA');
end;

procedure contarRango(l: lista; var v: rango);
begin  
    while l <> nil do
    begin
        v[l^.dato.rango_espectro] := v[l^.dato.rango_espectro] + 1;
        l := l^.sig;
    end;
end;

function superaPromedio(l: lista; promedio: real): integer;
var
    cantQueSuperan: integer;
begin
    cantQueSuperan := 0; 
    while (l <> nil) do begin
        if (l^.dato.duracion > promedio) then
            cantQueSuperan := cantQueSuperan + 1;
        l := l^.sig;
    end;
    superaPromedio := cantQueSuperan;
end;

procedure superaPromedioConstrucion(l:lista; promedio:real);    
begin
    while (l <> nil) do begin
        if (l^.dato.costo_construccion > promedio) then begin
            write(l^.dato.nombre,'');
        end;
        l := l^.sig;
    end;
end;


procedure recorrerLista(l: lista; var sondaMasCostoso: string; var promSupDuracion: real; v: rango); 
var
    promedio,promedioContruncion,totalConstrucion, max: real;
    cantidad, totalDuracion, i: integer;
    aux:lista;
begin
    promedioContruncion:=0;
    cantidad := 0;
    totalDuracion := 0;
    max := -99;
    totalConstrucion:=0;
    aux:=l;
    // recorro una vez la lista 
    while l <> nil do begin
        if (l^.dato.costo_construccion + l^.dato.costo_mantenimiento > max) then
        begin
            max := l^.dato.costo_construccion + l^.dato.costo_mantenimiento; 
            sondaMasCostoso := l^.dato.nombre; 
        end;
        cantidad := cantidad + 1;
        totalDuracion := totalDuracion + l^.dato.duracion;
        totalConstrucion:=totalConstrucion + l^.dato.costo_construccion;
        l := l^.sig;
    end;
    // {incio b}
    for i:= 1 to 7 do begin
        writeln('cantidad de sondas del rango ', i ,' fue de ', v[i]);
    end;
    writeln('la sonda mas costosa es: ', sondaMasCostoso); 
    if(cantidad <> 0) then begin
        promedio:= totalDuracion / cantidad;
        promedioContruncion:= totalConstrucion / cantidad;
    end
    else
        promedio:= 0; 
    writeln('la cantidad de sondas que superan el promedio de duracion son: ',superaPromedio(aux,promedio));
    writeln('la sondas que superan el promedio de construcion son: ');
    superaPromedioConstrucion(aux , promedioContruncion);
end;

// {programa principal}
var
    l: lista;
    sondaMasCostoso: string;
    promSupDuracion: real;
    v: rango;
begin
    l := nil; 
    leerlista(l);
    contarRango(l, v); 
    recorrerLista(l, sondaMasCostoso, promSupDuracion, v); 
end.
