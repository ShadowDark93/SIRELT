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
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Grid, FMX.DateTimeCtrls, FMX.Objects;

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
    CONSULTAS: TTabItem;
    StringGrid1: TStringGrid;
    cmbTipoPersona: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    txtInicio: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label9: TLabel;
    Image5: TImage;
    exit: TImage;
    excelExport: TImage;
    procedure Button1Click(Sender: TObject);
    procedure btnSalidaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure exitClick(Sender: TObject);
    procedure excelExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIndex: TfrmIndex;

implementation

{$R *.fmx}

uses dmConexion, u_Loggin, u_ExcelExport;

procedure TfrmIndex.Button1Click(Sender: TObject);
begin
  try
    with dm.qryingreso do
    begin
      sql.Clear;
      sql.Add('INSERT INTO USO_LIBRE_NVO (TIPO_PERSONA, ID_PERSONA, PROGRAMA, SALA, EQUIPO, FECHA_INICIO, HORA_INICIO)');
      sql.Add(' VALUES(:TIPO_PERSONA, :ID_PERSONA, :PROGRAMA, :SALA, :EQUIPO, :FECHA_INICIO, :HORA_INICIO)');
      ParamByName('TIPO_PERSONA').AsString := cmbTipoPersona.Selected.Text;
      ParamByName('ID_PERSONA').AsString := txtCodEst.Text;
      ParamByName('PROGRAMA').AsString := cmbPrograma.Selected.Text;
      ParamByName('SALA').AsString := cmbSala.Selected.Text;
      ParamByName('EQUIPO').AsString := cmbEquipo.Selected.Text;
      ParamByName('FECHA_INICIO').AsString := formatdatetime('yyyy-mm-dd', now);
      ParamByName('HORA_INICIO').AsString := formatdatetime('HH:MM:SS', now);

      ExecSQL;
      ShowMessage('INGRESO EXITOSO!!!');
      txtCodEst.Text := '';
      cmbPrograma.ItemIndex := -1;
      cmbSala.ItemIndex := -1;
      cmbEquipo.ItemIndex := -1;
      cmbTipoPersona.ItemIndex := -1;
    end;
  except
    ShowMessage('Ha ocurrido un error, por favor valide la informacion.');
  end;
end;

procedure TfrmIndex.FormCreate(Sender: TObject);
begin
  btnSalida.Enabled := false;
  TabControl1.ActiveTab := INGRESO;
  frmLoggin.hide;
end;

procedure TfrmIndex.btnSalidaClick(Sender: TObject);
begin
  try
    with dm.qrySalida do
    begin
      sql.Clear;
      sql.Add('UPDATE USO_LIBRE_NVO SET OBSERVACIONES = :OBSERVACIONES, FECHA_SALIDA = :FECHA_SALIDA, HORA_SALIDA = :HORA_SALIDA, ESTADO = 0');
      sql.Add('WHERE ESTADO = 1 AND ID_PERSONA = ' +
        QuotedStr(txtConsEst.Text));
      Params.ParamByName('OBSERVACIONES').AsString := Memo1.Text;
      Params.ParamByName('FECHA_SALIDA').AsString :=
        formatdatetime('yyyy-mm-dd', now);
      Params.ParamByName('HORA_SALIDA').AsString :=
        formatdatetime('HH:MM:SS', now);
      // Params.ParamByName('ID_PERSONA').AsString := txtCodEst.Text;
      ExecSQL;
      ShowMessage('SE HA REGISTRADO LA SALIDA CON SATISFACCIÓN!!!');
      txtConsEst.Text := '';
      Memo1.Text := '';
      btnSalida.Enabled := false;
      txtInicio.Text := '';
    end;

  EXCEPT
    ShowMessage('Ha ocurrido un error, por favor valide de nuevo');
  END;
end;

procedure TfrmIndex.Image1Click(Sender: TObject);
begin
  with dm.qryingreso do
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

procedure TfrmIndex.Image4Click(Sender: TObject);
begin
  if txtConsEst.Text = '' then
  begin
    ShowMessage('Digite el codigo de estudiante a consultar');
    Memo1.Enabled := false;
    btnSalida.Enabled := false;
  end
  else
  begin
    Memo1.Enabled := true;
    btnSalida.Enabled := true;
    with dm.qrySalida do
    begin
      sql.Clear;
      sql.Add('SELECT * FROM USO_LIBRE_NVO WHERE `ID_PERSONA` = ' +
        QuotedStr(txtConsEst.Text) + ' AND ESTADO = 1');
      // sql.Clear;

      ExecSQL;

      if RecordCount > 0 then
      begin
        with dm.qryTiempo do
        begin
          sql.Clear;
          sql.Add('SELECT HORA_INICIO, FECHA_INICIO FROM USO_LIBRE_NVO WHERE `ID_PERSONA`='
            + QuotedStr(txtConsEst.Text) + ' AND ESTADO =1;');
          ExecSQL;
          txtInicio.Text := 'El usuario ingreso el ' + Fields[1].AsString +
            ' a las ' + Fields[0].AsString;
          sql.Clear;
        end;

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

procedure TfrmIndex.Image5Click(Sender: TObject);
begin
  with dm.qryConsulta do
  begin
    ExecSQL;
  end;
end;

procedure TfrmIndex.excelExportClick(Sender: TObject);
begin
  frmexport := tfrmexport.create(application);
  frmexport.showmodal;

end;

procedure TfrmIndex.exitClick(Sender: TObject);
begin
  ShowMessage
    ('Recuerde sacar todas los estudiantes que se encuentren en uso libre');
  application.Terminate;
end;

end.
