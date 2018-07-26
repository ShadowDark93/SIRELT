unit dmConexion;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni, UniProvider,
  MySQLUniProvider, Datasnap.DBClient, Datasnap.Provider, SQLiteUniProvider;

type
  TDataModule1 = class(TDataModule)
    qryLoggin: TUniQuery;
    qryIngreso: TUniQuery;
    qrySalida: TUniQuery;
    qryConsulta: TUniQuery;
    qryTiempo: TUniQuery;
    MySQL: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
