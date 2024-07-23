// una revista deportiva dispone de informacion de los jugadores de futbol participantes de la liga profesional 2022 de cada
// jugador se conoce codigo de jugador , apellido y nombre, codigo de equipo (1..28)
// ,año de nacimiento y la calificacion optenida para cada una de las 27 fechas del torneo ya finalizado. 
// la calificacion es numerica de 0 a 10 donde el valor 0 significa que el jugador no ha participado de la fecha 

// Se solicita:
// a. informar para cada equipo la cantidad de jugadores mayores a 35 años.

// b. informar los codigos de los 2 jugadores con mejor calificacion promedio en los partidos en los que participo. 
// solo deben considerarse los jugadores que participaron en mas de 14 fechas

// c.implementar e invocar un modulo que genere una lista con los jugadores cuyo codigo posee exactamente 3 digitos impares
// y haya nacido entre 1983 y 1990. la lista debe estar ordenada por digo de jugador.

program parcial12;
type
    calificaion:0...10;
    rango_torneo:1...27;
    rango_equipo:1..28;

    fechas= array [rango_torneo] of calificaion; 

    equipos= array [rango_equipo] of integer;

    jugador=record
        Cjugador:integer;
        apellido:string;
        nombre:string;
        CEquipo:rango_equipo;
        nacimiento:integer;
        calificaciones:fechas;
    end;

    lista= ^nodo;
    
    nodo=record
        dato:jugador;
        sig:lista;
    end;
{procesos}

procedure cargarlista(var l:lista);{se dispone}

procedure vaciarvector(var v:equipos);{incisio a}
var
    i:integer;
begin
    for i:=1 to 28 do begin
        v[i]:=0;
    end;
end;

procedure llenarvector(var v:equipos; posicionE:rango_equipo);{incisio a}
begin
    v[posicionE]:=v[posicionE] + 1;
end;

function verficar14partidos(v:equipos):boolean;{incisio b}
var
    i,cant:integer;
begin
    cant:=0;
    verficar14partidos:=false;
    for i:=1 to 27 do begin
        if (v[i] > 0)then 
            cant:=cant + 1;
    end;
    if (cant >14) then 
        verficar14partidos:=true;
end;
function sacarPromedio(v:equipos):real;{inciso b}
var
    i,total,participo:integer;
begin
    for i:=1 to 27 do begin
        if v[i] > 0 then begin
            cant:=cant + v[i];
            total:=total + 1;
        end;
    end;
    sacarPromedio:=cant/ total  ;
end;
procedure maximos(x:real; v:integer; var max1, max2:real; var cod1,cod2:integer;);{incisio b}
begin
    if (x >max1)then begin
        max2:=max1;
        cod2:=cod1;
        cod1:= v;
        max1:=x;
    else begin 
        if max2 > x then begin
            max2:=x;
            cod2:=v;
        end;
    end;
end;


procedure insertarOrdenado(var l2:lista d:jugador;);{inciso c}
var
    act,ant,nue:lista;
begin
    new(nue);
    nue^.dato:=d;
    act:=l2;
    ant:=l2;
    
    while act <> nil and (d.Cjugador > l2^.dato.Cjugador) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act = ant ) then  
        l:=nue;
    else 
        ant^.sig:=nue;
    nue^.sig:=act;
end;


procedure procesarLista(l:lista var v:equipos var l2:lista);
var 
    i:integer;
    cod1,cod2:integer;
    max1,max2:real;
begin
    while (l <>nil) do begin

        if (l^.dato.nacimiento-2022>= 35) then {incisio a}
            llenarvector(v,l^.dato.CEquipo);

        if (verficar14partidos(l^.dato.calificaciones))then {incisio b}
            maximos((sacarPromedio(l^.dato.calificaciones)),l^.dato.Cjugador,cod1,cod2,max1,max2)

        if (digimpar(l^.dato.Cjugador) and (l^.dato.nacimiento=>1983) and (l^.dato.nacimiento<=1990))then {incisio c}
            insertarOrdenado(l2,l^.dato);
        l:=l^.sig;
    end;
    for i:= 1 to 28 do begin 
        writeln('el equipo ',i,' tuvo ',v[i],' jugadores mayores de 35')
    end;
    writeln(cod1,cod2);
end;

{programa principal}
var
    l:lista;
    v:equipos;
    l2:lista;
begin
    l:=nil;
    cargarlista(l);
    vaciarvector(v);
    procesarLista(l,v,l2);
end.