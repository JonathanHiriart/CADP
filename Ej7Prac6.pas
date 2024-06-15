// Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
// funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
// número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado
// por su número, en cuyo caso sale de la lista de espera. Se pide:

// a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.

// b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de
// clientes en espera, asigna un número al cliente y retorna la lista de espera actualizada.

// c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera,
// y retorna el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe
// eliminarse de la lista de espera.

// d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero
// llegarán todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se
// los atenderá de a uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no
// debe procesarse.

program ejercicio10;

type 
    cliente = record
        dni: integer;
        numero: integer;
    end;
    
    lista = ^nodo;
    nodo = record
        // dato: cliente;
        // sig: lista;
    end;

procedure RecibirCliente(x: cliente; var l: lista);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato.dni := x.dni;
    
    // Asignar el número de cliente
    if l = nil then
        nuevo^.dato.numero := 1  // Primer cliente
    else
        nuevo^.dato.numero := l^.dato.numero + 1;  // Incrementar número para el siguiente cliente
    
    nuevo^.sig := l;  // Enlazar el nuevo nodo al inicio de la lista
    l := nuevo;  // Actualizar el inicio de la lista
end;

procedure leerCliente(var l: lista);
var 
    x: cliente;
begin
    writeln('Introduce el DNI del cliente: ');
    readln(x.dni);
    
    // Continuar leyendo clientes hasta que el DNI sea 0
    while (x.dni <> 0) do begin
        RecibirCliente(x, l);
        writeln('finaliza el programa con el numero 0');
        writeln('Introduce el DNI del cliente: ');
        readln(x.dni);
    end;
end;

procedure AtenderCliente(var l: lista; var num, dni: integer);
var
    temp: lista;
begin
    if (l <> nil) then begin
        num := l^.dato.numero;
        dni := l^.dato.dni;
        temp := l;
        l := l^.sig;  // Mover al siguiente cliente en la lista
        dispose(temp);  // Liberar la memoria del nodo atendido
    end 
    else
        writeln('No hay clientes en espera');
end;

// Programa principal
var
    l: lista;
    x: cliente;
begin
    l := nil;  // Inicializar la lista a nil
    
    leerCliente(l);  // Leer y agregar clientes a la lista
    
    while (l <> nil) do begin
        AtenderCliente(l, x.numero, x.dni);
        writeln('Atendiendo al cliente con DNI: ', x.dni);
        writeln('Numero de cliente: ', x.numero);
        writeln('----------------');
    end;
end.
