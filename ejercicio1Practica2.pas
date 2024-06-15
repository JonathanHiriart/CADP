// a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. 
// Al finalizar la lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
// b. Implemente un programa que invoque al módulo del inciso a.

program practica2;
procedure escribir;
var input,a,b:integer;
begin
    writeln('Introduce numeros enteros');
    readln(input);
    a:=-1;
    //Solo  se guardan los valores positivos y si es mayor que el actual lo reemplaza 
    while (input>=0) do begin
        writeln('Introduce numeros enteros');
        readln(input);
        // Si el numero introducido es par y es mayor que el anterior lo guardamos
        if (input mod 2=0) and (input>a) then
            a:=input;
    end;
    writeln('el numero mas alto es ',a)
end;
begin
escribir;
end.