program musicafunck;
type
    rango_genero:1..7;
    rango_albun:1..4000;

    albun=record
        cod_albun:rango_albun;
        cod_genero:rango_genero;
        titulo:string;
        año:integer;
        precio:real;
        artista:string;
    end;

    venta = record
        cod_albun:rango_albun;
        dni:integer;
        mes:integer;
        añov:integer;
    end;
    
    lista = ^nodo;
    nodo=record
        dato:venta;
        sig:lista;
    end;

    albumes=array[rango_albun] of albun;
    ventasgeneros= array [rango_genero] of real;


// procesos
procedure cargarlista(var l:lista);
begin
    
end;
procedure cargarvector(var v:albumes);
var
    i:integer;
    a:albun;
    
begin
    for i:=1 to 4000 do begin
        leeralbun(a);
        v[a.cod_albun]:=v[a.cod_albun] + a;
    end;
end;



procedure leeralbun(var a:albun);
begin
    readln(a.cod_albun);
    readln(a.cod_genero);
    readln(a.titulo);
    readln(a.año);
    readln(a.precio);
    readln(a.artista);
end;


procedure recorrerlista(l:lista var v:ventasgeneros);
var
    i,cant,total:integer;
    max1,max2,prom :real;
    gen1,gen2:integer;
begin
    max1:=0;
    max2:=0;
    cant:=0;
    total:=0;
    prom:=0;
    while (l <> nil) do begin
        v[l^.dato.cod_genero]:=v[l^.dato.cod_genero] + l^.dato.precio;{incisio a}

        if (dnimpar(l^.dato.dni) and (v[l^.dato.cod_albun].año=>2010)and (v[l^.dato.cod_albun].año<=2019)) then{incisio b}
            writeln(l^.dato.añov,v[l^.dato.cod_albun].titulo);
        
        if (v[l^.dato.cod_albun].precio > 3000)then {inciso c}
            cant:=cant + 1;
        total:=total + 1; 

        agregarOrdenado(l^.dato)
        l:=l^.sig;
    end;
    prom:=(cant / total)*100;
    writeln(prom);
    maximos(v,max1,max2,gen1,gen2);
end;
procedure maximos(v:ventasgeneros var max1,max2:real var gen1,gen2:integer;);
var 
    i:integer;
begin
    for i:=1 to 7 do begin
        if v[i]>max1 then begin
            max2:=max2;
            gen2:=gen1;
            max1:=v[i];
            gen1:=i;
        end
        else begin
            if(v[i]>max2)then begin
                max2:=v[i];
                gen2:=i;
            end;
    end;
end;

function dnimpar(dni:integer):boolean;
var
    dig, cant,total:integer;
begin
    dig:=0;
    cant:=0;
    total:=0;
    dnimpar:=false;
    while dni <>0 do begin
        dig:=dni mod 10;
        if ((dig mod 2)=0) then 
            cant:=cant + 1;
        dni:=dni div 10;
        total:=total +1 ;
    end;
    if  (total = cant) then
        dnimpar:=true;
end;
// programa principal
var
    l:lista;
    v:albumes;
begin
    l:=nil;
    cargarlista(l);
    cargarvector(v);
    recorrerlista(l)
end;







