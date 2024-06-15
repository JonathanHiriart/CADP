procedure eliminarL(num:integer; var l2:listaImpar);
var
    act,ant:listaImpar;
begin
    act:=l2;
    ant:=l2;
    while (act <> nil) do begin
    // busca el elemento a eliminar 
        if (act^.dato.numero <> num) then begin
            ant:=act;
            act:=act^.sig;
        end else
        // si es el inicio 
            if (act = l2) then 
                l2:=act^.sig;
        // evalua si no es el final
            if (act^.sig <> nil) then begin
                ant^.sig:=act^.sig;
            end;
            dispose(act);
            act:=ant;
    // avanza 
        act:=act^.sig;
    end;
end;

// eliminar 1
Comienzo a recorrer la lista desde el nodo inicial.

mientras ((no sea el final de la lista)y(no encuentre el elemento))

    el puntero anterior toma la dirección del puntero actual
    avanzo el puntero actual

si (encontré el elemento) entonces
	si (es el primer nodo) entonces
        actualizo el puntero inicial de la lista
        elimino la dirección del puntero actual
    sino
	    actualizo el siguiente del puntero anterior con el siguiente de actual
        elimino la dirección del puntero actual






//  aca 
recoorrer (l);
1,1,3,3,4,4,5,
actual := l^.dato.codigoTren;

while l <> nil do begin 
    cant:=cant + 1;
    if (l^.dato.codigoTren = actual)then
        cant:= cant + 1
    else begin
            cargarLista(actual,cant,l2);
            cant:=0
            actual:=l^.dato.codigoTren;
            cant:=cant + 1;
        end;
    l:= l^.sig;
end; 



procedure cargarLista (actual:integer cant:integer var l2:lista2);
var
    nuevo:lista2;
begin
    new (nuevo);
    nuevo^.dato.codigo2:=actual;
    nuevo^.dato.cant:=cant;
    nuevo^.sig:=l2;
    l2:=nuevo;
end;