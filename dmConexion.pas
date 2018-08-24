unit dmConexion;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni, UniProvider,
  MySQLUniProvider, Datasnap.DBClient, Datasnap.Provider, SQLiteUniProvider;

type
  Tdm = class(TDataModule)
    qryLoggin: TUniQuery;
    qryIngreso: TUniQuery;
    qrySalida: TUniQuery;
    qryConsulta: TUniQuery;
    MySQL: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    qryExportar: TUniQuery;
    qryTiempo: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
