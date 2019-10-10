unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style,
  FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Controls,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components, FMX.Layouts,
  FMX.Bind.Navigator, Data.Bind.Grid, FMX.ScrollBox, FMX.Grid,
  Data.Bind.DBScope, Data.DB;

type
  TForm1 = class(TForm)
    Switch1: TSwitch;
    DataSource1: TDataSource;
    BindSourceDB1: TBindSourceDB;
    StringGridBindSourceDB1: TStringGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    BindingsList1: TBindingsList;
    procedure Switch1Switch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses dmConexion;

procedure TForm1.Switch1Switch(Sender: TObject);
begin
  if Switch1.Enabled = true then
  begin
    dm.MySQL.Connected := true;
    dm.qryPersona.Active := true;
  end
  else
  begin
    dm.MySQL.Connected := false;
    dm.qryPersona.Active := false;
  end;
end;

end.
