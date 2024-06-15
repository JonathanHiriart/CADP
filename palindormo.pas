Retornar V si TODAS las palabras de una oracion son palindromes. Las palabras pueden estar separadas por uno o mas espacios.

procedure cargarpalabra(var a:oracion var diml : integer)
    var
        letra:char
    begin
        read(letra)

    end;

function procesaroracion(a:oracion; diml:integer): boolean;
var
    sonPalindromos: boolean;
    inicio,fin,i: integer;
begin
    i:= 1;
    sonPalindromos:= true;
    while ((oracion[i]=diml)no termine oracion and (palindromo= true )sonPalindromos)
        while ((oracion[i]=diml)no termine oracion and oracion[i]=''hay espacios en blanco)
            i:= i + 1;
        if i <= diml then begin
        inicio:= i;
        fin:=i-1
        Identificar palabra: recorrer oracion hasta fin de la palabra. Obtener inicio y fin.
        oso ojo.
        recorrer hasta el espacio, y setear inicio en 1, fin en 3.
        if !esPalindromo(a, inicio, fin)
            sonPalindromos:= false;
        end;
        
        


end;
