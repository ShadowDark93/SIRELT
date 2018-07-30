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
    UniConnection1: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    qryExportar: TUniQuery;
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
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure excelExportClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure exportExcel;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExport: TfrmExport;

implementation

{$R *.fmx}

procedure TfrmExport.Button1Click(Sender: TObject);
begin
  ShowMessage('inicio');
  if CheckBox1.IsChecked = true then
  begin
    with qryExportar do
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
    with qryExportar do
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
  if CheckBox1.IsChecked = true then
  begin
    with qryExportar do
    begin
      sql.Add('AND PROGRAMA = ' + QuotedStr(cmbPrograma.Selected.Text) +
        ' AND SALA = ' + QuotedStr(cmbSala.Selected.Text));
      Params.ParamByName('hi').Value := dateInicio.Text ;
      Params.ParamByName('hs').Value := dateFinal.Text;
      ExecSQL;
    end;
    // Ejecuta el procedimiento de exportación a Excel
    exportExcel;

  end
  else
  begin
   { with qryExportar do
    begin
      Params.ParamByName('hi').Value := dateInicio.Text + '%';
      Params.ParamByName('hs').Value := dateFinal.Text + '%';
      ExecSQL;
    end;
    }
    // Ejecuta el procedimiento de exportación a Excel
    exportExcel;

  end;

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
  libro.Cells[i, 7] := 'HORA_INICIO';
  libro.Cells[i, 8] := 'OBSERVACIONES';
  libro.Cells[i, 9] := 'HORA_SALIDA';
  libro.Cells[i, 10] := 'ESTADO';
  libro.Cells[i, 11] := 'DURACION';

  with qryExportar do
  begin
    First;
    while not qryExportar.Eof do
    begin
      // Incremente el numero de linea antes de escribir estos datos
      // Son los datos de cabecera
      i := i + 1;
      libro.Cells[i, 1] := qryExportar.FieldByName('NUM_REGISTRO').AsString;
      libro.Cells[i, 2] := qryExportar.FieldByName('TIPO_PERSONA').AsString;
      libro.Cells[i, 3] := qryExportar.FieldByName('ID_PERSONA').AsString;
      libro.Cells[i, 4] := qryExportar.FieldByName('PROGRAMA').AsString;
      libro.Cells[i, 5] := qryExportar.FieldByName('SALA').AsString;
      libro.Cells[i, 6] := qryExportar.FieldByName('EQUIPO').AsString;
      libro.Cells[i, 7] := qryExportar.FieldByName('HORA_INICIO').AsString;
      libro.Cells[i, 8] := qryExportar.FieldByName('OBSERVACIONES').AsString;
      libro.Cells[i, 9] := qryExportar.FieldByName('HORA_SALIDA').AsString;
      libro.Cells[i, 10] := qryExportar.FieldByName('ESTADO').AsString;
      libro.Cells[i, 11] := qryExportar.FieldByName('DURACION').AsString;

      Next;
    end;

    ProgressBar1.Min:=0;
    ProgressBar1.max:=qryExportar.RecordCount;

  end;
  Excel.visible := true;

end;

procedure TfrmExport.FormCreate(Sender: TObject);
begin
  Panel1.Enabled := false;
end;

end.
