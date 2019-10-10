unit dmConexion;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni, UniProvider,
  MySQLUniProvider, Datasnap.DBClient, Datasnap.Provider, SQLiteUniProvider;

type
  Tdm = class(TDataModule)
    MySQL: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    qryPersona: TUniQuery;
    qryConsultarNombre: TUniQuery;
    prvPersna: TDataSetProvider;
    prvNombres: TDataSetProvider;
    cdsPersona: TClientDataSet;
    cdsNombres: TClientDataSet;
    cdsNombresPRIMER_NOMBRE: TStringField;
    cdsNombresSEGUNDO_NOMBRE: TStringField;
    cdsNombresPRIMER_APELLIDO: TStringField;
    cdsNombresSEGUNDO_APELLIDO: TStringField;
    cdsNombresDOCUMENTO: TIntegerField;
    cdsNombresTIPO_DOCUMENTO: TStringField;
    cdsNombresTIPO_PERSONA: TStringField;
    cdsNombresID_INTERNO: TIntegerField;
    cdsPersonaDOCUMENTO: TIntegerField;
    cdsPersonaTIPO_DOCUMENTO: TStringField;
    cdsPersonaTIPO_PERSONA: TStringField;
    cdsPersonaID_INTERNO: TIntegerField;
    cdsPersonaRFID: TStringField;
    cdsPersonaPRIMER_APELLIDO: TStringField;
    cdsPersonaSEGUNDO_APELLIDO: TStringField;
    cdsPersonaPRIMER_NOMBRE: TStringField;
    cdsPersonaSEGUNDO_NOMBRE: TStringField;
    qryST: TUniQuery;
    prvST: TDataSetProvider;
    cdsST: TClientDataSet;
    cdsSTID_ST: TIntegerField;
    cdsSTMOTIVO_ST: TStringField;
    cdsSTESTADO: TStringField;
    qryExt: TUniQuery;
    cdsExt: TClientDataSet;
    prvExt: TDataSetProvider;
    cdsExtDOCUMENTO_PERSONA: TIntegerField;
    cdsExtLUGAR_DESTINO_EXT: TStringField;
    cdsExtLUGAR_DEST_OPC: TStringField;
    cdsExtESTADO_EXTERNO: TStringField;
    qryConsultaReiterativos: TUniQuery;
    cdsPersonaCARGO: TStringField;
    cdsPersonaSEDE: TStringField;
    cdsSTBLOQUE: TStringField;
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
