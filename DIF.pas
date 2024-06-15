{1.
a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}

program ej1;
const
    dimF = 500;
type
    vector = array[1..dimF] of integer;

{vector desordenado}
function busquedaSerial(vector: vector; dimL: integer; n: integer): boolean;
var i, iteraciones: integer;
begin
    busquedaSerial:= false;
    iteraciones:= 1;

    for i:=1 to dimL do begin
        writeln('serial | iteracion: ', iteraciones);
        iteraciones:= iteraciones + 1;

        if(vector[i] = n) then busquedaSerial:= true;
    end;

    if (busquedaSerial) then writeln('serial | ENCONTRADO (', iteraciones, ' iteraciones)')
    else writeln('serial | NO ENCONTRADO (', iteraciones, ' iteraciones)');
end;

{vector ordenado}
function busquedaDicotomica(vector: vector; dimL: integer; n: integer): boolean;
var first, last, mid, iteraciones: integer;
begin
    first:= 1;
    last:= dimL;
    mid:= (first+last) div 2;
    busquedaDicotomica:= false;
    iteraciones:= 1;

    while (first <= last) and (vector[mid] <> n) do begin;
        writeln('dicot | iteracion: ', iteraciones, ' | rango: ', first, ' <- ', mid ,' -> ', last);
        iteraciones:= iteraciones + 1;

        if (vector[mid] < n) then
            first:= mid + 1
        else last:= mid - 1;

        mid:= (first + last) div 2;
    end;

    if (first <= last) and (vector[mid] = n) then busquedaDicotomica:= true;

    if (busquedaDicotomica) then writeln('dicot | ENCONTRADO (', iteraciones, ' iteraciones)')
    else writeln('dicot | NO ENCONTRADO (', iteraciones, ' iteraciones)');
end;

procedure cargarOrdenado(var vector: vector; var dimL: integer);
var inp, pos, i: integer;
    stop: boolean;
begin
    dimL:= 0;
    stop:= false;

    writeln('#', dimL+1, '| Ingrese el número: (-1 para cancelar)');
    readln(inp);

    while (inp <> -1) and (dimL < dimF) do begin
        {encontrar el primer item menor que INP}
        pos:= 1;
        while (pos <= dimL) and (not stop) and (dimL > 0) do begin
            writeln('pos = ', pos, ' | vector[pos] = ', vector[pos]);
            if (vector[pos] < inp) then
                stop:= true
            else
                pos:= pos + 1;
        end;
        stop:= false; {resetear variable}
        
        {insertar en la posición pos}
        {primero, mover todos los items de "abajo"}
        for i:=dimL downto pos do
            vector[i+1]:= vector[i];
        vector[pos]:= inp;
        dimL:= dimL + 1;

        if (dimL < 500) then begin
            writeln('#', dimL+1, '| Ingrese el número: (-1 para cancelar)');
            readln(inp);
        end;
    end;
end;
// {programa principal}
var
    vec: vector;
    i, inp, dimL: integer;
begin
    dimL:= 0;

    cargarOrdenado(vec, dimL);

    for i:=1 to dimL do begin
        writeln(vec[i]);
    end;

    writeln('Inserte un numero para buscar serial y dicotómicamente:');
    readln(inp);
    busquedaSerial(vec, dimL, inp);
    busquedaDicotomica(vec, dimL, inp);
end.
ej1