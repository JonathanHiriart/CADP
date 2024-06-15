{8. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando
llega el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus
dígitos pares y la cantidad de dígitos impares que posee}

program ejer8prac2_2;
procedure pares_impares(num:integer);
var
dig:integer;
par:integer;
impar:integer;
begin
par:=0;
impar:=0;
    while (num <> 0) do begin
        dig:= num mod 10;
        if((dig mod 2)= 0) then
            par := par + dig;
        if((dig mod 2)<>0) then
            impar:= impar +1;
        num := num DIV 10;
    end;
    writeln('la suma de sus numero pares es de : ', par);
    writeln('la cantidad de numero impares es de :', impar);
end;
var
num:integer;
begin
    writeln('ingrese un numero :');
    readln(num);
    while (num <> 123456) do begin
        pares_impares(num);
        writeln('ingrese un numero :');
        readln(num);
    end;
end.
