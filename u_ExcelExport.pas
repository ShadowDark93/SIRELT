unit u_ExcelExport;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.DB,
  FMX.Controls.Presentation, FMX.StdCtrls, ComObj, excelXP, MemDS, DBAccess,
  Uni, UniProvider, MySQLUniProvider, FMX.Objects, FMX.ListBox,
  FMX.DateTimeCtrls;

type
  TfrmExport = class(TForm)
    Label1: TLabel;
    dateInicio: TDateEdit;
    dateFinal: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    cmbPrograma: TComboBox;
    Label4: TLabel;
    cmbSala: TComboBox;
    Label5: TLabel;
    Panel1: TPanel;
    StyleBook1: TStyleBook;
    CheckBox1: TCheckBox;
    excelExport: TImage;
    AniIndicator1: TAniIndicator;
    exit: TImage;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure excelExportClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure exportExcel;
    procedure exitClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExport: TfrmExport;

implementation

{$R *.fmx}

uses dmConexion;

procedure TfrmExport.Button1Click(Sender: TObject);
begin
  ShowMessage('inicio');
  if CheckBox1.IsChecked = true then
  begin
    with dm.qryExportar do
    begin
      sql.Add('AND PROGRAMA = ' + QuotedStr(cmbPrograma.Selected.Text) +
        ' AND SALA = ' + QuotedStr(cmbSala.Selected.Text));
      Params.ParamByName('hi').Value := dateInicio.Text + '%';
      Params.ParamByName('hs').Value := dateFinal.Text + '%';
      ExecSQL;
    end;
  end
  else
  begin
    with dm.qryExportar do
    begin
      Params.ParamByName('hi').Value := dateInicio.Text + '%';
      Params.ParamByName('hs').Value := dateFinal.Text + '%';
      ExecSQL;
    end;
  end;
  ShowMessage('final');
end;

procedure TfrmExport.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.IsChecked = true then
  begin
    Panel1.Enabled := true;
  end
  else
    Panel1.Enabled := false;
end;

procedure TfrmExport.excelExportClick(Sender: TObject);
begin
  AniIndicator1.Enabled := true;
  if CheckBox1.IsChecked = true then
  begin
    with dm.qryExportar do
    begin
      OPEN;
      SQL.Clear;
      sql.Add('SELECT * FROM USO_LIBRE_NVO WHERE FECHA_INICIO BETWEEN :fi AND :fs AND PROGRAMA =:p  AND SALA =:s');
      Params.ParamByName('p').Value := cmbPrograma.Selected.Text;
      Params.ParamByName('s').Value := cmbSala.Selected.Text;
      Params.ParamByName('fi').Value := dateInicio.Text;
      Params.ParamByName('fs').Value := dateFinal.Text;
      ExecSQL;

    end;
    // Ejecuta el procedimiento de exportación a Excel
    exportExcel;

  end
  else
  begin
    with dm.qryExportar do
    begin
      OPEN;
      SQL.Clear;
      sql.Add('SELECT * FROM USO_LIBRE_NVO  WHERE FECHA_INICIO BETWEEN :fi AND :fs');
      Params.ParamByName('fi').Value := dateInicio.Text;
      Params.ParamByName('fs').Value := dateFinal.Text;
      ExecSQL;
    end;

    // Ejecuta el procedimiento de exportación a Excel
    exportExcel;

  end;
  AniIndicator1.Enabled := false;
end;

procedure TfrmExport.exitClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmExport.exportExcel;
var
  Excel, libro: Variant;
  i, i_det: Integer;
begin
  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.Add(-4167);
  Excel.WorkBooks[1].WorkSheets[1].Name := 'Reporte';
  libro := Excel.WorkBooks[1].WorkSheets['Reporte'];

  // Esto se escribe en la primera linea
  // Son los titulos
  i := 1;
  libro.Cells[i, 1] := 'NUM_REGISTRO';
  libro.Cells[i, 2] := 'TIPO_PERSONA';
  libro.Cells[i, 3] := 'ID_PERSONA';
  libro.Cells[i, 4] := 'PROGRAMA';
  libro.Cells[i, 5] := 'SALA';
  libro.Cells[i, 6] := 'EQUIPO';
  libro.Cells[i, 7] := 'FECHA_INICIO';
  libro.Cells[i, 8] := 'HORA_INICIO';
  libro.Cells[i, 9] := 'OBSERVACIONES';
  libro.Cells[i, 10] := 'FECHA_SALIDA';
  libro.Cells[i, 11] := 'HORA_SALIDA';
  libro.Cells[i, 12] := 'ESTADO';
  libro.Cells[i, 13] := 'DURACION';

  with dm.qryExportar do
  begin
    First;
    while not dm.qryExportar.Eof do
    begin
      // Incremente el numero de linea antes de escribir estos datos
      // Son los datos de cabecera
      i := i + 1;
      libro.Cells[i, 1] := dm.qryExportar.FieldByName('NUM_REGISTRO').AsString;
      libro.Cells[i, 2] := dm.qryExportar.FieldByName('TIPO_PERSONA').AsString;
      libro.Cells[i, 3] := dm.qryExportar.FieldByName('ID_PERSONA').AsString;
      libro.Cells[i, 4] := dm.qryExportar.FieldByName('PROGRAMA').AsString;
      libro.Cells[i, 5] := dm.qryExportar.FieldByName('SALA').AsString;
      libro.Cells[i, 6] := dm.qryExportar.FieldByName('EQUIPO').AsString;
      libro.Cells[i, 7] := dm.qryExportar.FieldByName('HORA_INICIO').AsString;
      libro.Cells[i, 8] := dm.qryExportar.FieldByName('HORA_INICIO').AsString;
      libro.Cells[i, 9] := dm.qryExportar.FieldByName('OBSERVACIONES').AsString;
      libro.Cells[i, 10] := dm.qryExportar.FieldByName('HORA_SALIDA').AsString;
      libro.Cells[i, 11] := dm.qryExportar.FieldByName('HORA_SALIDA').AsString;
      libro.Cells[i, 12] := dm.qryExportar.FieldByName('ESTADO').AsString;
      libro.Cells[i, 13] := dm.qryExportar.FieldByName('DURACION').AsString;

      Next;
    end;

  end;
  Excel.visible := true;

end;

procedure TfrmExport.FormCreate(Sender: TObject);
begin
  Panel1.Enabled := false;
end;

end.
