program ejer5prac3;

type
    datosAutos = record
        marca:string;
        modelo:string;
        precio:integer;
    end;

procedure Leer(var datos:datosAutos);
var
promedio:real;
precioTotal:real;
autosTotal:integer;
actual:string;
begin
promedio:=0;
precioTotal:=0;
autosTotal:=0;
writeln('ingrese marca de auto:');
    readln(datos.marca); 
    actual:=datos.marca;
    while(datos.marca <> 'zzz') do begin
        while (datos.marca = actual) and (datos.marca <> 'zzz') do begin
            writeln('ingrese modelo del auto');
            readln(datos.modelo);
            writeln('ingrese precio');
            readln(datos.precio); 
            precioTotal:=precioTotal + datos.precio;
            autosTotal:= autosTotal + 1;
            writeln('ingrese marca de auto:');
            readln(datos.marca);
        end;
        promedio:= precioTotal/autosTotal;
        writeln('el promedio de la marca ', actual, ' es de: ', promedio :2:2);
        precioTotal:=0;
        autosTotal:=0;
        actual:=datos.marca;
    end;
end;
var
datos: datosAutos;
begin
Leer(datos);
end.