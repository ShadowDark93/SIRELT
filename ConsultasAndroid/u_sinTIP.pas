unit u_sinTIP;

interface

uses sysutils;

var
  documento, tipoPersona, nombre1, nombre2, apellido1, apellido2, cargo, sede,
    bloque: String;

procedure ingresarRegistriSinTip(documento, motivoST: string);
function registrarSalidaPersona(idPersona: string): boolean;

implementation

uses dmConexion;

procedure ingresarRegistriSinTip(documento, motivoST: string);
begin
  with dm.cdsST do
  begin
    Active := true;
    Open;
    Append;
    dm.cdsSTID_ST.Value := StrToInt(documento);
    dm.cdsSTMOTIVO_ST.Value := motivoST;
    dm.cdsSTESTADO.Value := '1';
    dm.cdsSTBLOQUE.Value := bloque;
    Post;
    ApplyUpdates(3);
    Active := false;
    close;
  end;
end;

function registrarSalidaPersona(idPersona: string): boolean;
begin

  with dm.cdsST do
  begin
    Active := true;
    Open;
    Filter := 'ESTADO = 1 AND ID_ST =' + idPersona;
    Filtered := true;
    if dm.cdsST.RecordCount > 0 then
    begin
      Edit;
      dm.cdsSTESTADO.Value := '0';
      Post;
      ApplyUpdates(0);
      result := true;
      Filtered := false;
      Active := false;
      close;
    end
    else
    begin
      Filtered := false;
      Active := false;
      result := false;
      close;
    end;
  end;

end;

end.
