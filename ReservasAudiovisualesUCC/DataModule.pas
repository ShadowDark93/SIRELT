unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, UniProvider, MySQLUniProvider, MemDS, DBAccess, Uni;

type
  Tdm = class(TDataModule)
    conexion: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    qryReservas: TUniQuery;
    prvReservas: TDataSetProvider;
    cdsReservas: TClientDataSet;
    qryInternos: TUniQuery;
    prvInternos: TDataSetProvider;
    qryProductos: TUniQuery;
    prvProductos: TDataSetProvider;
    cdsProductos: TClientDataSet;
    cdsProductosID_INV: TIntegerField;
    cdsProductosID_PRODUCTO: TIntegerField;
    cdsProductosNOMBRE_PRODUCTO: TStringField;
    cdsProductosDESCRIPCION_PRODUCTO: TStringField;
    cdsProductosSERIAL_INV: TStringField;
    cdsProductosCANTIDAD_INV: TStringField;
    qryProducto: TUniQuery;
    prvProducto: TDataSetProvider;
    cdsProducto: TClientDataSet;
    qryExternos: TUniQuery;
    prvExternos: TDataSetProvider;
    cdsExternos: TClientDataSet;
    cdsExternosID_PERSONA_EXTERNA: TIntegerField;
    cdsExternosTIPO_DOCUMENTO: TStringField;
    cdsExternosDESC_TIPO_PERSONA: TStringField;
    cdsExternosPRIMER_APELLIDO: TStringField;
    cdsExternosSEGUNDO_APELLIDO: TStringField;
    cdsExternosPRIMER_NOMBRE: TStringField;
    cdsExternosSEGUNDO_NOMBRE: TStringField;
    cdsInternos: TClientDataSet;
    cdsInternosID_PERSONA: TIntegerField;
    cdsInternosTIPO_DOCUMENTO: TStringField;
    cdsInternosPRIMER_APELLIDO: TStringField;
    cdsInternosSEGUNDO_APELLIDO: TStringField;
    cdsInternosPRIMER_NOMBRE: TStringField;
    cdsInternosSEGUNDO_NOMBRE: TStringField;
    cdsInternosID_INTERNO: TIntegerField;
    cdsInternosDESC_TIPO_PERSONA: TStringField;
    cdsInternosCARGO_INTERNO: TStringField;
    cdsInternosSEDE_INTERNO: TStringField;
    qryPrestamos: TUniQuery;
    prvPrestamos: TDataSetProvider;
    cdsPrestamos: TClientDataSet;
    cdsPrestamosID_PRESTAMO: TIntegerField;
    cdsPrestamosID_PERSONA: TIntegerField;
    cdsPrestamosID_RESERVA: TIntegerField;
    cdsPrestamosID_AUDIOVISUAL: TIntegerField;
    cdsPrestamosTIMESTAMP_PRESTAMO: TDateTimeField;
    cdsPrestamosLUGAR_PRESTAMO: TStringField;
    cdsPrestamosOBSERVACIONES_PRESTAMO: TStringField;
    cdsPrestamosTIMESTAMP_ENTREGA: TDateTimeField;
    cdsPrestamosOBSERVACIONES_ENTREGA: TStringField;
    cdsPrestamosESTADO_PRESTAMO: TStringField;
    qryInventario: TUniQuery;
    prvInventario: TDataSetProvider;
    cdsInventario: TClientDataSet;
    cdsInventarioID_INV: TIntegerField;
    cdsInventarioID_PRODUCTO: TIntegerField;
    cdsInventarioSERIAL_INV: TStringField;
    cdsInventarioCANTIDAD_INV: TStringField;
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
