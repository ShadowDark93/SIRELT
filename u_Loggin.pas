unit u_Loggin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.ExtCtrls, FMX.StdCtrls,
  FMX.Objects;

type
  TfrmLoggin = class(TForm)
    ImageViewer1: TImageViewer;
    txtNombre: TEdit;
    txtPassword: TEdit;
    Button1: TButton;
    Label1: TLabel;
    StyleBook1: TStyleBook;
    Image1: TImage;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoggin: TfrmLoggin;

implementation

{$R *.fmx}

uses dmConexion, u_Index;

procedure TfrmLoggin.Button1Click(Sender: TObject);
begin
  with DataModule1.qryLoggin do
  begin
      Params.ParamByName('usr').Value :=txtNombre.Text;
      Params.ParamByName('pwd').Value:= txtPassword.Text;
      open;
      ExecSQL;
    if RecordCount >0 then
    begin
      frmIndex:=TfrmIndex.Create(Application);
      frmIndex.Show;
    end
    else
    begin
      ShowMessage('Error de usuario o contraseña');
    end;

  end;
end;

end.
