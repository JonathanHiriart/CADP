//Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se tiene:
//código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5:
//comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. Dicha estructura
//no posee orden alguno.
//Se pide:
//a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se debe
//leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI del crítico,
//apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura finaliza cuando se lee
//el código de película -1 y la información viene ordenada por código de película.
//b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
//c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares que
//impares en su DNI.
//d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe como
//parámetro (el mismo puede no existir).

program parcia11;
type
    rango_genero:1..8;
    pelicula=record
        codigoPeli:integer;
        titulo:string;
        codGenero:rango_genero;
        puntajeProm:real;
    end
    criticas=record
        dni:integer;
        apellido:string;
        nombre:string;
        codigo_pelicula:integer;
        puntaje:real;
    end

    lista:^nodo;
    nodo=record
        dato:pelicula;
        sig:lista;
    end;
{procesos}
procedure cargarlista(var l:lista);
begin
end;
procedure actulizarlista(var l:lista;);
begin
    while (l<>nil) do begin
        
        
        l:=l^.sig;
    end;
end;
procedure cargarCriticas(var c:criticas; var l:lista);
begin
    readln(c.dni);
    readln(c.apellido);
    readln(c.nombre);
    readln(c.codigo_pelicula);
    readln(c.puntaje);
    while (c.codigo_pelicula <> -1) do begin
        agregarOrdenado(c,l);
        readln(c.dni);
        readln(c.apellido);
        readln(c.nombre);
        readln(c.codigo_pelicula);
        readln(c.puntaje);
    end;
end
procedure agregarOrdenado (c:criticas var l:lista);
var
    ant:lista;
    act:lista;
begin
    act:=l;ant:=l;
    while (act<>nil) and ()
end;
{programa principal}
var 
    l:lista;

begin
    l:=nil;
    cargarlista(l);
    actulizarlista(l);
end;