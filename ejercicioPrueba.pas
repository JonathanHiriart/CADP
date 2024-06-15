// ultizando los siguientes modulos realizar un programa que lea las 10 numeros
// enteros e informe la cantidad de digitos que contiene cada numero, 
// y la cantidad total de digitos multiplo de 3 entre todos los numeros 

program Ejercicio3;
function cumple(x,y:integer):boolean;
    begin
        cumple:=((x MOD 10)MOD y)=0;
    end;

procedure descomponer(num:integer, m:integer , var total:integer, var mul:integer);
    begin
        total:=0;
        while(num <> 0 ) do 
            begin
                total:=total +1;
                if cumple(num,m)then
                    begin
                        mul:= mul +1;>
                    end; 
                num:=num div 10;
            end;     
    end;
var
    i,dato,multiplo3,totalD:integer;
begin
    for i := 0 to 10 do
        begin
            writeln('ingrese su numero');
            readln(dato);
            descomponer(dato,3,totalD,multiplo3);
            writeln('el numero de digitos es ', totalD);
        end;
    writeln('el total de multiplos de 3 es', multiplo3);    
end.