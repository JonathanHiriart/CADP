// 1. Una productora nacional realiza un casting de personas para la selección de actores extras de una nueva
// película, para ello se debe leer y almacenar la información de las personas que desean participar de dicho
// casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación que
// prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura finaliza cuando llega una
// persona con DNI 33555444, la cual debe procesarse.
// Una vez finalizada la lectura de todas las personas, se pide:
// a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
// b. Informar los dos códigos de género más elegidos.
// c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir.
// Invocar dicho módulo en el programa principal.

program ejercicio1;
const 
    rango = 5;
type
    genero= array [1..rango] of integer;

    persona = record
        dni: integer;
        apellido: string;
        nombre: string;
        edad: integer;
        codigo_genero: integer;
    end;
    
    lista= ^nodo;
    
    nodo = record
        dato: persona;  
        sig:lista;
    end;


procedure agregarPersona(var l:lista; p:persona);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=p;
    nuevo^.sig:=l;
    l:=nuevo;
end;


procedure leerPersona(var l:lista);
var
    p:persona;
begin
    repeat
        writeln('ingrese el dni:');
        readln(p.dni);
        writeln('ingrese el apellido');
        readln(p.apellido);
        writeln('ingrese el nombre');
        readln(p.nombre);
        writeln('ingrese la edad');
        readln(p.edad);
        writeln('ingrese el codigo de genero');
        readln(p.codigo_genero);
        agregarPersona(l,p);
    until (p.dni <> 33555444 );
end;


procedure llenarvector(l:lista; var v:genero);
begin
    v[l^.dato.codigo_genero]:=v[l^.dato.codigo_genero]+1;
end;

procedure codigoMasElegido(v:genero; var max1,max2:integer);
var
    i:integer;
begin
    max1:=0;
    max2:=0;
    for i:=1 to 5 do begin
        if (v[i]>max1) then begin
            max2:=max1;
            max1:=v[i];
        end
            else if (v[i] > max2) then
                max2:=v[i];
    end;
end;

procedure dniParImpar(l:lista; var cantidadTotal:integer);
var
    sumaPar, sumaImpar,num, digito:integer;  
begin
    sumaPar:=0;
    sumaImpar:=0;
    num:=l^.dato.dni;
    while(num<> 0) do begin
        digito:=num mod 10;
        if (digito mod 2 = 0) then
            sumaPar:=sumaPar + 1
        else 
            sumaImpar:=sumaImpar + 1;
        num:= num div 10 ;    
    end;
    if (sumaPar > sumaImpar) then
        cantidadTotal:=cantidadTotal + 1;
end;


procedure recorrerLista(l:lista);
var
    cantidadTotal,max1,max2:integer;
    v:genero;
begin
    while (l<>nil) do begin
        dniParImpar(l,cantidadTotal);
        llenarvector(l,v);
        l:=l^.sig;
    end;
    codigoMasElegido(v,max1,max2);
    writeln('los 2 generos mas elegidos son ',max1,' ',max2);
    writeln('la cantidad de personas con dni par es ',cantidadTotal);
end;

procedure eliminarPersona(var l:lista; dniParaEliminar:integer);
var
    actual, anterior:lista;
begin
    actual:=l;
    // esto funciona para eliminar 1 solo codigo 
    while(actual>nil) and(dniParaEliminar <> actual^.dato.dni ) do begin
        anterior:=actual;
        actual:=actual^.sig
    end;
    if actual <> nil then begin
        if (actual = l) then
                l:= l^.sig
        // si el del medio o el final 
            else
                anterior^.sig:=actual^.sig;
            dispose(actual);
    end;
end;

// {programa principal}
var
    l:lista;
    dniParaEliminar: integer;
begin
    l:= nil;
    leerPersona(l);
    recorrerLista(l);
    writeln('Ingrese DNI a eliminar');
    readln(dniParaEliminar);
    eliminarPersona(l, dniParaEliminar);
end.