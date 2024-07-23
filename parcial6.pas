program franja_musica;

const
    anoActual = 2024;
    maxGeneros = 7;
    maxAlbumes = 4000;

type
    rangoGeneros = 1 .. maxGeneros;
    rangoAlbumes = 1 .. maxAlbumes;
    rangoAnos = 1 .. anoActual;
    rangoMeses = 1 .. 12;

    album = record
        codigoAlbum: rangoAlbumes;
        codigoGenero: rangoGeneros;
        titulo: string;
        anoLanzamiento: rangoAno;
        precio: real;
        artista: string;
    end;

    venta = record
        codigoAlbum: rangoAlbumes;
        dniCliente: integer;
        anoVenta: rangoAnos;
        mesVenta: rangoMeses;
    end;

    listaVentas = ^nodoVentas;
    nodoVentas = record
        elem: venta;
        sig: listaVentas;
    end;

    listaAlbumes = ^nodoAlbumes;
    nodoAlbumes = record
        elem: album;
        sig: listaAlbumes;
    end;

    arrAlbumes = array[rangoAlbumes] of album;
    arrGeneros = array[rangoGeneros] of integer;

procedure cargarAlbum(var a: album);
begin
    writeln('   Código de género (1 -> 7):');
    readln(a.codigoGenero);
    writeln('   Título:');
    readln(a.titulo);
    writeln('   Año de lanzamiento:');
    readln(a.anoLanzamiento);
    writeln('   Precio:');
    readln(a.precio);
    writeln('   Artista:');
    readln(a.artista);
end;

procedure cargarInventario(var i: arrAlbumes);
var i: integer;
    tempAlbum: album;
begin
    for i:= 1 to maxAlbumes do begin
        writeln('Carga de album #', i, ':');
        tempAlbum.codigoAlbum:= i;
        cargarAlbum(tempAlbum);
        v[i]:= tempAlbum;
    end;
end;

procedure cargarVentas(var v: listaVentas); {se dispone}








function tieneDigitosImpares(n: integer): boolean;
begin
    tieneDigitosImpares:= false;
    while (n > 0) do begin
        if (((n mod 10) mod 2) <> 0) then tieneDigitosImpares:= true;
        n:= n div 10;
    end;
end;

procedure procEjerB(i: arrAlbumes; v: venta);
var a: album;
begin
    a:= i[v.codigoAlbum];
    if tieneDigitosImpares(v.dniCliente);
        and (a.anoLanzamiento >= 2010) and (a.anoLanzamiento <= 2019) then
            writeln('Título: ', a.titulo, ' | Año de venta: ', v.anoVenta);
end;

procedure recorrerVentas(l: listaVentas, var vectEjerA: arrCategorias;
                        var cantVentas: integer; var cantVentasSobre3000: integer);
begin
    while (l <> nil) do begin
        {ejer A}
        vectEjerA[l^.elem.codigoGenero]:= vectEjerA[l^.elem.codigoGenero] + l^.elem.precio;

        {ejer B}
        procEjerB(l^.elem);

        {ejer C}
        cantVentas:= cantVentas + 1;
        if (l^.elem.precio > 3000) then cantVentasSobre3000:= cantVentasSobre3000 + 1;

        l:= l^.sig;
    end;
end;


procedure insertarAlbumOrdenado(var l: listaAlbumes; a: album);
var n, ant, act: listaVentas;
begin
    ant:= l; act:= l;
    while (act <> nil) and (l^.elem.titulo < a.titulo) do begin
        ant:= act;
        act:= act^.sig;
    end;

    new(n);
    n^.elem:= v;

    if (act = ant) then
        l:= n;
    else
        ant^.sig:= n;
    n^.sig:= act;
end;

procedure procEjerD(var l: listaAlbumes; inv: inventario);
var i: integer;
begin
    for i:= 1 to maxAlbumes do
        insertarAlbumOrdenado(inv[i]);
end;


procedure eliminarAlbum(var l: listaAlbumes);
var i: rangoAlbumes;
    ant, act: listaAlbumes;
begin
    writeln('Código del album a eliminar:');
    readln(i);

    ant:= l; act:= l;
    while (act <> nil) and (act^.elem.codigoAlbum <> i) do begin
        ant:= act;
        act:= act^.sig;
    end;
    
    if (act <> nil) then begin
        if (act = l) then l:= l^.sig;
        else ant^.sig:= act^.sig;
        dispose(act);
        writeln('Album #', i, ' eliminado');
    end else
        writeln('No existe el album #', i);
end;


procedure modificarAlbum(var l: listaAlbumes);
var i: rangoAlbumes;
    aux: listaAlbumes;
    tempAlbum: album;
begin
    writeln('Inserte código de album a modificar');
    readln(i);

    while (aux <> nil) and (aux^.elem.codigoAlbum <> i) do
        aux:= aux^.sig;
    
    tempAlbum.codigoAlbum:= i;
    cargarAlbum(tempAlbum);

    if (aux <> nil) then begin
        aux^.elem:= tempAlbum;
        writeln('Album modificado');
    end else writeln('No existe el album #', i);
end;


function diferenciaParImpar(i: integer): integer; {par = +1 | impar = -1}
begin
    diferenciaParImpar:= 0;
    while (i > 0) do begin
        if ((i mod 10) mod 2) then diferenciaParImpar:= diferenciaParImpar + 1;
        else diferenciaParImpar:= diferenciaParImpar - 1;

        i:= i div 10;
    end;
end;

procedure agregarAlbumAdelante(var l: listaAlbumes; a: album);
var n: listaAlbumes;
begin
    new(n);
    n^.elem:= a;
    n^.sig:= l;
    l:= n;
end;

procedure procEjerG(var l: listaAlbumes; l2: listaAlbumes);
begin
    while (l2 <> nil) do begin
        if (diferenciaParImpar(l2^.elem.codigoAlbum) = 2) then
            agregarAlbumAdelante(l, l2^.elem);
        l2:= l2^.sig;
    end;
end;


procedure inicializar(var a: listaVentas;
                    var b: arrGeneros;
                    var c: integer;
                    var d: integer;
                    var e: listaAlbumes;
                    var f: listaAlbumes);
var i: integer;
begin
    a:= nil;
    for i:= 1 to maxGeneros do
        b[i]:= 0;
    c:= 0;
    d:= 0;
    e:= nil;
    f:= nil;
end;

procedure informar(vectEjerA: arrGeneros; cantVentas: integer; cantVentasSobre3000: integer);
var i, posMax1, posMax2: integer;
begin
    posMax1:= 1; posMax2:= 1;
    for i:= 1 to maxGeneros do begin
        if (vectEjerA[i] > vectEjerA[posMax1]) then begin
            posMax2:= posMax1;
            posMax1:= i;
        end else if (vectEjerA[i] > vectEjerA[posMax2]) then
            posMax2:= i;
    end;

    writeln('Los dos géneros con mayor recaudación en ventas fueron el #', posMax1, ' y el #', posMax2);
    writeln('El porcentaje de ventas que superaron los $3000 fue de ', (cantVentas/cantVentasSobre3000*100):1:1);
end;

var
    inventario: arrAlbumes;
    ventas: listaVentas;

    vectEjerA: arrGeneros;
    cantVentas, cantVentasSobre3000: integer;
    listaEjerD, listaEjerG: listaAlbumes;
begin
    inicializar(ventas, vectEjerA, cantVentas, cantVentasSobre3000, listaEjerD, listaEjerG);

    cargarVentas(ventas);
    cargarInventario(inventario);

    procEjerD(listaEjerD, inventario);
    procEjerG(listaEjerG, listaEjerD);

    informar(vectEjerA, cantVentas, cantVentasSobre3000);
end.