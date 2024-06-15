// una revista deportiva dispone de informacin de los jugadores de futbol participantes de la liga profesional 2022 . 
// de cada jugador se conoce , codigo de jugador , apellido y nombre , codigo de equipo (1-28),año de nacimiento y
// la calificacion obtenida para cada una de las 27 fechas del torneo ya finalizado . la calificacion es numerica de 0 a 10,
// donde el valor 0 significa que el jugador no ha participado de la fecha.
// se solicita 
// a. informar para cada equipo la cantidad de jugadores mayores a 35 años.

// b. informar los codigos de los 2 jugadores con mejor calificacion promedio en los partidos en los que participo 
// solo deben considerarse los jugadores que participaron en mas de 14 fechas.

// c. completo : implementar e invocar a un modulo que genere una lista con los jugadores cuyo codigo posee exactamente 3 digitos
//  impares y haya nacido entre 1983 y 1990.
// la lista debe estar ordenado por codigo de jugador.
program parcial3;
type
    calificacion= 0..10;
    jugador=record
        codigoJ:integer;
        apellido:string;
        nombre:string;
        equipo:array [1..28] of integer;
        anioNac:integer;
        calificaciones:array [1..27] of calificacion;
    end;
    lista=^nodo;
    nodo=record
        dato:jugador;
        sig:nodo;
    end;
// {Modulos}

// Inciso A
// a. informar para cada equipo la cantidad de jugadores mayores a 35 años.

procedure vectorEn0(l:lista; var v:equipo);
var 
    i:integer
begin
    for i := 1 to 28 do begin
        v[i]:=0;
end;

procedure cargarVector(l:lista; var v:equipo);
begin
    if (l^.dato.anioNac => 1989) then
        v[l^.dato.equipo]:=v[l^.dato.equipo] + 1;
end;

procedure informarV(v:equipo);
var
    i:integer;
begin
    for i:=1 to 28 do begin
        writeln('los jugadores mayores de 35 anios del equipo',i,' son de ',v[i]);
    end;    
end;

// insicio b
// b. informar los codigos de los 2 jugadores con mejor calificacion promedio en
//  los partidos en los que participo 
// solo deben considerarse los jugadores que participaron en mas de 14 fechas.

function tieneMasde14Fechas(l:lista):boolean;
var
    i,contador:integer;
begin
    tieneMasde14Fechas:=false;
    contador:=0;
    for i:=1 to 27 to begin
        if (l^.dato.calificaciones[i] <> 0) then
            contador:=contador + 1;
    end;
    if (contador > 14) then
        tieneMasde14Fechas:=true;
end;

function calcularPromedio(l:lista):real;
var
    i,contador:integer;
begin
    for i:= 1 to 27 do begin
        if (l^.dato.calificaciones[i] <> 0) then begin
            sumaClasificacion:= sumaClasificacion + l^.dato.calificaciones[i];
            contador:=contador + 1;
        end;
    end;
    calcularPromedio:= sumaClasificacion / contador;
end;

procedure maximos(prom:real; var max1,max2:real; var codigo1,codigo2:integer; l:lista);
begin
    // si el dato que me dieron es mas grande que mi max
    if (prom > max1 )then begin
        codigo2:=codigo1;
        codigo1:=l^.dato.codigoJ;
        max2:=max1; //entonces guardo el valor de max1 en el aux
        max1:=prom; // Actualizamos 'max1' con el nuevo valor más alto, que es 'dato'
    end else
    // si no es mayor que el primero pregunta por el segundo max
        if (prom > max2) then begin
            max2:=prom;
            codigo2:=l^.dato.codigoJ;
        end;
end;

// Inciso c
// c. completo : implementar e invocar a un modulo que genere 
// una lista con los jugadores cuyo codigo posee exactamente 3 digitos
//  impares y haya nacido entre 1983 y 1990.
// la lista debe estar ordenado por codigo de jugador.
procedure recorrerLista(l:lista; var v:equipo; var max1,max2:real);
var
    contador:integer;
begin
    max1:=0;
    max2:=0;
    vectorEn0(l,v);
    while (l <> nil) do begin
        cargarVector(l,v);
        // pregunta si tiene mas de 14 fechas 
        if (tieneMasde14Fechas(l) = true)then
            maximos(calcularPromedio(l), max1, max2, l);
        // avanza   
        l:=l^.sig;
    end;
    informar(v);
end;

// {programa principal}
var
    l:lista;
    j:jugador;
begin
// {inicializar lista}
    l:=nil;
    // se dispone 
    cargarLista(l);
    recorrerLista(l,v,max1,max2);
end.