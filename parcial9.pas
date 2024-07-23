// Una librería dispone de información sobre los libros que tiene en su inventario. De cada libro se conoce:
//  código del libro, título, autor, año de publicación, género (1: Ficción, 2: No Ficción, 3: Infantil, 4: Científico, 5: Fantasía) 
// y una calificación de los clientes (un arreglo con 10 calificaciones de 1 a 5). Se solicita:

// Informar la cantidad de libros por cada género.
// Informar los códigos de los 3 libros con mejor calificación promedio.
// Implementar e invocar un módulo que genere una lista con los libros cuyo código es un número primo y hayan sido publicados entre 2000 y 2010.
//  La lista debe estar ordenada por título.

program parcial9;
type
    
    rango: 1..5;
    libro = record 
        codigoL:integer;
        titulo:string;
        autor:string;
        anioPub:integer;
        genero:integer;
        calificacion:array[1..10] of rango;
    end;
    lista= ^nodo;

    nodo=record
        dato:libros;
        sig:lista;
    end;    
    libros =array[1..5] of integer;

// procesos
procedure llenarVector(var v:libros; g:integer;);
begin
    v[g]:=v[g]+ 1;
end;


procedure recorrerLista(l:lista);
var     
    libT:integer;
begin
    while l <> nil do begin 
        llenarVector(v,l^.dato.genero);
        libT:=libT + 1;
        l:=l^.sig;
    end;
end;

procedure mejorcalificacion(v:libros);
var  
    i:integer;
begin
    for i:=1 to 10 then begin 
    
end;