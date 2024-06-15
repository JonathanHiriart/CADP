// Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
// consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de
// cliente y cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos
// consumidos y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos
// de los clientes de la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
// a. Realizar un módulo que lea la información de una línea de teléfono.
// b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando
// el módulo desarrollado en el inciso a y retorne la cantidad total de minutos y la cantidad total de MB a
// facturar del cliente.
// Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta
// $1,35.


program ejercicio4Practica3;
type
    clientes=record
        codigo:integer;
        cantLineas:integer;
    end;
    linea=record
        numero:integer;
        cantMinutos:real;
        cantMb:real;
    end;
procedure lineas(var x:linea);
    begin
        writeln('ingrese su numero');
        readln(x.numero);
        writeln('ingrese la cantidad de minutos');
        readln(x.cantMinutos);
        writeln('ingrese la cantidad de MB');
        readln(x.cantMb);
    end;
// procedure cliente() poner los datos que va a recibir el cliente;
    var
    l:linea;
    begin
        linea:=0;
        writeln('ingrese su numero de cliente');
        readln(cl.codigo);
        writeln('ingrese la cantidad de lineas');
        readln(cl.cantLineas);
        while (cl.cantLineas>0) do 
            begin
                lineas(l);
            end;
    end;
// procedure factura(var m,mb:cliente);
// begin
    
// end;

var    
i:integer;
cl:clientes;
begin
    for i := 1 to 10 do
        begin
            cliente(cl);
        end;       
end.