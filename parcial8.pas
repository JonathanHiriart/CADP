// se desea procesar la informacion de estancias del pais. de cada estancia se lee: codigo de estancia, localidad,codigo de provincia(1..23)
// y cantidad de cabeas de ganado. la lectura finaliza al ingresar el codigo de estancia 0, que no debe procesarse. Se pide:
// 1. realizar un modulo para almacenar en una estructura la informacion leida.
// 2. realizar un modulo que reciba la estrucutra generada en el 1. y retorne si se encuentra almacenada, o no, la estancia con codigo 234.
// 3. realizar un modulo que reciba la estancia generada en en el 1. y calcule los codigos de las 2 provincias con mayor cantidad de cabezas de ganado
// NOTA :realizar el programa principal que invoca a los modulos implementados.
program parcial8;
type
    estancia=record
        codigoE:integer;
        localidad:string;
        codigoProv:rango;
        cantGanado:integer;
    end;
    lista= ^nodo;
    nodo=record
        dato:estancia;
        sig:lista;
    end;
// {Procesos}
procedure agregarListaOrdnada(var l:lista);
begin
    
end;
    
// {Programa principal}
var 
begin
    
end;



procedure insertarOrdenado(var l:lista dato:estancia);
var
    nue,ant,act:lista;
begin
    new(nue);
    act:=l;
    ant:=l;
    while l<>nil and (dato >l^.dato) do begin 
        ant:=act;
        act:=act^.sig;
    end;
    if (act=ant) then
        l:=nue;
    else
        ant^.sig:=nue;
    nue^.sig:=act;    
end;

procedure eliminar(var l:lista elm:eliminar);
var 
    act:lista;
    ant:lista;
begin
    act:=l;
    ant:=l;
    while l <> nil and elm <> act^.dato do begin 
        ant:=act;
        act:=act.sig;
    end;
    if act = nil then 
        if act = l then 
            l:=l^.sig;
        else
            ant^.sig:=act^.sig;
        dispose(act);

end;