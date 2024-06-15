// 4. El siguiente programa intenta resolver un enunciado.
//  Sin embargo, el código posee 5 errores. Indicar en
// qué línea se encuentra cada error y en qué consiste el error.

// Enunciado: Realice un programa que lea datos de 130 programadores
// Java de una empresa. De cada
// programador se lee el número de legajo y el salario actual. 
// El programa debe imprimir el total del dinero
// destinado por mes al pago de salarios, y el salario del empleado mayor legajo.

program programadores;
    procedure leerDatos(var legajo: integer; salario : real);
        begin
            writeln(‘Ingrese el nro de legajo y el salario”);
            read(legajo);
            read(salario);
        end;
    procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer);
        var
            maxSalario : real;
        begin
            if (nuevoLegajo > maxLegajo) then begin
                maxLegajo:= nuevoLegajo;
                maxSalario := nuevoSalario
            end;
        end;
var
    legajo, maxLegajo, i : integer;
    salario, maxSalario : real;
begin
    sumaSalarios := 0;
    for i := 1 to 130 do begin
        leerDatos(salario, legajo);
        actualizarMaximo(legajo, salario, maxLegajo);
        sumaSalarios := sumaSalarios + salario;
    end;
    // {1} esta usando mal las comillas esas no representan una cadena de texto estas '' si.
    writeln(‘En todo el mes se gastan ‘, sumaSalarios, ‘ pesos’);
    writeln(‘El salario del empleado más nuevo es ‘,maxSalario);
end.