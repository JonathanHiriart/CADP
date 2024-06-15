// 3. Encontrar los 6 errores que existen en el siguiente programa. Utilizar los comentarios entre llaves como
// guía, indicar en qué línea se encuentra cada error y en qué consiste:
program ejercicio5;
    { suma los números entre a y b, y retorna el resultado en c }
    procedure sumar(a, b, c : integer){1} {3}
        // falta el ;  y esta usando el procedure para que te retorne una variable tendria que utilizarse una function
        var
            suma : integer;
    begin
    {4}
    // no esta inicializado la variable suma ,lo que puede provocar un comportamiento indefinido.
        for i := a to b do
            suma := suma + i;
        c := c + suma;
    end;
var
result: integer;
{2}
// falta declaracion de variables  a ,b ,i y 'ok'
begin
    result := 0;
    readln(a); 
    readln(b);
    sumar(a, b, 0);
    {5}
    // error de comillas tendrian que usar estas '' para  mostrar las cadenas de texto
    write(‘La suma total es ‘,result);
    { averigua si el resultado final estuvo entre 10 y 30}
    {6}
    // usando el 'or' no se asegura que este en el rango de 10 y 30 tendria que usar un 'and'
    ok := (result >= 10) or (result <= 30);
    if (not ok) then
        write (‘La suma no quedó entre 10 y 30’);
end.