
// 8. Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la administración de
// transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de Enero y Noviembre del año
// 2018.
// El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada
// transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuentadestino,
//  DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la transferencia (1:
// alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios). Esta estructura no posee
// orden alguno.
// Se pide:
// a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las que
// las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe estar
// ordenada por número de cuenta origen.
// Una vez generada la estructura del inciso a), utilizar dicha estructura para:
// b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
// c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
// d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales
// el número de cuenta destino posea menos dígitos pares que impares.

program ejercicio8;
type

    transferencia=record
        numDeCuentaOrigen:integer;
        dniTitularOrigen:integer;
        numDeCuentaDestino:integer;
        dniDeTitularCuentaDestino:integer;
        fecha:string;
        hora:string;
        monto:real;
        codigoMotivo:integer;
    
    end;
    
    lista:^nodo;
    nodo=record
        dato:transferencia;
        sig:lista;
    end;

//  a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las que
// las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe estar
// ordenada por número de cuenta origen.
procedure insertarOrdenado(var l2:lista; r:transferencia);
var
    anterior,actual,nuevo:lista;
begin
    new(nuevo);
    // falta completar
end;
procedure transTerceros(r:transferencia; var l2:lista);
var
    aux:lista;
begin
    if (r.dniTitularOrigen <> r.dniDeTitularCuentaDestino)  
        insertarOrdenado(l2, r);
end;

procedure recorrerLista2(l2:lista);
begin
    while l2<> nil do begin
        while()
        informarMonto(l2)pepeito 12 
    
end;
procedure recorrerLista(l:lista)
var
    l2:lista;

begin
    l2:=nil
    while l<>nil do begin
        transTerceros(l^.dato,l2);
        l:=l^.sig;
    end;
        recorrerlistaTerceros(l2);
end;
// {Programa Principal}
var
    l, l2: lista;
begin
    l:=nil;
    recorrerLista(l,l2);
end.