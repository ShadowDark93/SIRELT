unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, UniProvider, MySQLUniProvider, MemDS, DBAccess, Uni;

type
  Tdm = class(TDataModule)
    conexion: TUniConnection;
    qryAudiovisuales: TUniQuery;
    MySQLUniProvider1: TMySQLUniProvider;
    qryPrestamos: TUniQuery;
    qryReservas: TUniQuery;
    prvAudiovisuales: TDataSetProvider;
    prvPrestamos: TDataSetProvider;
    prvReservas: TDataSetProvider;
    cdsAudiovisuales: TClientDataSet;
    cdsPrestamos: TClientDataSet;
    cdsReservas: TClientDataSet;
    cdsAudiovisualesID_AUDIOVISUAL: TIntegerField;
    cdsAudiovisualesNOMBRE: TStringField;
    cdsAudiovisualesDESCRIPCION: TStringField;
    cdsAudiovisualesSERIAL: TStringField;
    cdsAudiovisualesCANTIDAD: TIntegerField;
    cdsAudiovisualesDISPONIBLES: TIntegerField;
    cdsPrestamosID_PRESTAMO: TIntegerField;
    cdsPrestamosID_PERSONA: TIntegerField;
    cdsPrestamosID_AUDIOVISUAL: TIntegerField;
    cdsPrestamosTIMESTAMP_PRESTAMO: TDateTimeField;
    cdsPrestamosLUGAR_PRESTAMO: TStringField;
    cdsPrestamosOBSERVACIONES_PRESTAMO: TStringField;
    cdsPrestamosTIMESTAMP_ENTREGA: TDateTimeField;
    cdsPrestamosOBSERVACIONES_ENTREGA: TStringField;
    cdsPrestamosESTADO_PRESTAMO: TStringField;
    cdsReservasID_RESERVA: TIntegerField;
    cdsReservasID_PERSONA: TIntegerField;
    cdsReservasID_AUDIOVISUAL: TIntegerField;
    cdsReservasFECHA_RESERVA: TDateField;
    cdsReservasHORA_RESERVA: TTimeField;
    cdsReservasLUGAR_RESERVA: TStringField;
    cdsReservasOBSERVACIONES_RESERVA: TStringField;
    cdsReservasESTADO_RESERVA: TStringField;
    qryPersona: TUniQuery;
    prvPersonas: TDataSetProvider;
    cdsPersonas: TClientDataSet;
    cdsPersonasDOCUMENTO: TIntegerField;
    cdsPersonasID_INTERNO: TIntegerField;
    cdsPersonasPRIMER_NOMBRE: TStringField;
    cdsPersonasSEGUNDO_NOMBRE: TStringField;
    cdsPersonasPRIMER_APELLIDO: TStringField;
    cdsPersonasSEGUNDO_APELLIDO: TStringField;
    cdsPersonasCARGO: TStringField;
    cdsPersonasSEDE: TStringField;
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
