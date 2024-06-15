program palindromo;

type
    arreglo = array[1..20] of char; // Define un naaaaaaaaasuevo tipo llamado arreglo que es un array de caracteres de longitud 20.

procedure leerPalabra(var Palabra: arreglo; var Longitud: integer);
var
    i: integer;
    entrada: string; // Declara una variable para almacenar la palabra ingresada como una cadena de caracteres.
begin
    write('Ingrese la palabra: '); // Solicita al usuario que ingrese la palabra.
    readln(entrada); // Lee la palabra ingresada por el usuario.
    Longitud := length(entrada); // Obtiene la longitud de la palabra ingresada.
    // Copia los caracteres de la palabra ingresada al arreglo Palabra.
    for i := 1 to Longitud do
        Palabra[i] := entrada[i];
end;

function esPalindroma(const Palabra: arreglo; Longitud: integer): boolean;
var
    i: integer;
    esPalindromo: boolean; // Variable local para almacenar el resultado de la función.
begin
    i := 1; // Inicializa el índice i en 1.
    esPalindromo := true; // Inicializa la variable esPalindromo a true, asumiendo que la palabra es un palíndromo.
    // El bucle while continuará mientras no se encuentren discrepancias y esPalindromo sea true.
    while (i <= Longitud div 2) and esPalindromo do
    begin
        // Ignora los espacios en blanco al principio de la palabra.
        while (Palabra[i] = ' ') do
            i := i + 1; // Avanza al siguiente carácter si el carácter actual es un espacio en blanco.
        // Ignora los espacios en blanco al final de la palabra.
        while (Palabra[Longitud - i + 1] = ' ') do
            Longitud := Longitud - 1; // Reduce la longitud para saltar los espacios en blanco al final.
        // Si los caracteres en los extremos no coinciden, la palabra no es un palíndromo.
        if (Palabra[i] <> Palabra[Longitud - i + 1]) then
            esPalindromo := false; // Asigna false a la variable local esPalindromo.
        i := i + 1; // Incrementa i para comparar el siguiente par de caracteres.
    end;
    // Después de salir del bucle, asignamos el valor de esPalindromo a la función para devolver el resultado.
    esPalindroma := esPalindromo; // Asigna el valor de la variable local a la función.
end;


procedure mostrarResultado(const Palabra: arreglo; Longitud: integer; const EsPalindroma: boolean);
var
    i: integer;
begin
    // Muestra la palabra ingresada por el usuario.
    writeln('La palabra ingresada fue:'); 
    for i := 1 to Longitud do
        write(Palabra[i]); 
    writeln;
    // Muestra si la palabra es un palíndromo o no.
    writeln('La palabra es palindroma? ', EsPalindroma); 
end;

var
    Palabra: arreglo;
    Longitud: integer;
begin
    // Llama a leerPalabra para obtener la palabra ingresada por el usuario y su longitud.
    leerPalabra(Palabra, Longitud);
    // Llama a esPalindroma para determinar si la palabra es un palíndromo.
    mostrarResultado(Palabra, Longitud, esPalindroma(Palabra, Longitud));
end.
