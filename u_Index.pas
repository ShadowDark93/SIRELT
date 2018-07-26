unit u_Index;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, DateUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Edit, FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.ScrollBox, FMX.Memo, FMX.Layouts, FMX.ExtCtrls, System.Rtti,
  FMX.Grid.Style, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Grid, FMX.DateTimeCtrls;

type
  TfrmIndex = class(TForm)
    Label1: TLabel;
    TabControl1: TTabControl;
    INGRESO: TTabItem;
    SALIDA: TTabItem;
    txtCodEst: TEdit;
    Label2: TLabel;
    cmbPrograma: TComboBox;
    cmbProgramaas: TLabel;
    cmbSala: TComboBox;
    Label4: TLabel;
    cmbEquipo: TComboBox;
    Label5: TLabel;
    Button1: TButton;
    txtConsEst: TEdit;
    Label3: TLabel;
    Memo1: TMemo;
    Label6: TLabel;
    btnSalida: TButton;
    ImageViewer1: TImageViewer;
    CONSULTAS: TTabItem;
    StringGrid1: TStringGrid;
    ImageViewer2: TImageViewer;
    cmbTipoPersona: TComboBox;
    Label7: TLabel;
    txtDuracion: TEdit;
    Label8: TLabel;
    txtInicio: TEdit;
    Label9: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    procedure Button1Click(Sender: TObject);
    procedure btnSalidaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImageViewer1Click(Sender: TObject);
    procedure ImageViewer2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIndex: TfrmIndex;

implementation

{$R *.fmx}

uses dmConexion, u_Loggin;

procedure TfrmIndex.Button1Click(Sender: TObject);
begin
  with DataModule1.qryingreso do
  begin
    sql.Clear;
    sql.Add('INSERT INTO USO_LIBRE (`TIPO_PERSONA`,`ID_PERSONA`,`PROGRAMA`,`SALA`,`EQUIPO`)');
    sql.Add('VALUES (' + QuotedStr(cmbTipoPersona.Selected.Text) + ',' +
      QuotedStr(txtCodEst.Text) + ',' + QuotedStr(cmbPrograma.Selected.Text) +
      ',' + QuotedStr(cmbSala.Selected.Text) + ',' +
      QuotedStr(cmbEquipo.Selected.Text) + ')');
    ExecSQL;
    ShowMessage('INGRESO EXITOSO!!!');
    txtCodEst.Text := '';
    cmbPrograma.ItemIndex := -1;
    cmbSala.ItemIndex := -1;
    cmbEquipo.ItemIndex := -1;
    cmbTipoPersona.ItemIndex := -1;
  end;
end;

procedure TfrmIndex.FormCreate(Sender: TObject);
begin
  btnSalida.Enabled := false;
end;

procedure TfrmIndex.btnSalidaClick(Sender: TObject);
begin
  with DataModule1.qrySalida do
  begin
    begin
      sql.Clear;
      sql.Add('UPDATE USO_LIBRE SET OBSERVACIONES = ' + QuotedStr(Memo1.Text) +
        ', ESTADO = 0, DURACION = ' + QuotedStr(txtDuracion.Text));
      sql.Add('WHERE ID_PERSONA =' + QuotedStr(txtConsEst.Text) +
        ' AND ESTADO = 1');
      ExecSQL;
    end;
    ShowMessage('SE HA REGISTRADO LA SALIDA CON SATISFACCIÓN!!!');
    txtConsEst.Text := '';
    Memo1.Text := '';
    btnSalida.Enabled := false;
  end;
end;

procedure TfrmIndex.ImageViewer1Click(Sender: TObject);
begin
  if txtConsEst.Text = '' then
  begin
    ShowMessage('Digite el codigo de estudiante a consultar');
  end
  else
  begin
    with DataModule1.qrySalida do
    begin
      sql.Clear;
      sql.Add('SELECT * FROM USO_LIBRE WHERE `ID_PERSONA` = ' +
        QuotedStr(txtConsEst.Text) + ' AND ESTADO = 1');
      // sql.Clear;
      with DataModule1.qryTiempo do
      begin
        //realiza consulta del tiempo en sala del individuo

        sql.Add('SELECT SEC_TO_TIME(TIMESTAMPDIFF(MINUTE,`HORA_INICIO`,NOW())) FROM `USO_LIBRE` WHERE `ID_PERSONA`='
          + QuotedStr(txtConsEst.Text) + ' AND ESTADO=1');
        ExecSQL;
        txtDuracion.Text := Fields[0].AsString;
        sql.Clear;
        sql.Add('SELECT CAST(`HORA_INICIO` AS TIME) FROM USO_LIBRE WHERE `ID_PERSONA`=' +
          QuotedStr(txtConsEst.Text) + ' AND ESTADO =1;');
        ExecSQL;
        txtInicio.Text:= Fields[0].AsString;
        sql.Clear;
      end;

      ExecSQL;

      if RecordCount > 0 then
      begin
        ShowMessage('Persona Activa');
        btnSalida.Enabled := true;
      end
      else
      begin
        ShowMessage('Persona Inactiva');
        btnSalida.Enabled := false;
      end;
    end;

  end;

end;

procedure TfrmIndex.ImageViewer2Click(Sender: TObject);
begin
  with DataModule1.qryConsulta do
  begin
    ExecSQL;
  end;
end;

end.
