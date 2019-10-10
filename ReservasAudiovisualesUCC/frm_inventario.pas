unit frm_inventario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, Data.Bind.Components,
  Data.Bind.DBScope, Data.Bind.Controls, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Layouts,
  FMX.Bind.Navigator, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.ListBox;

type
  TSingleton = class
  strict private
    class var FInstance: TSingleton;
    constructor create;
    destructor destroy;
  public
    class function GetInstance: TSingleton;
  end;

type
  TfrmInventario = class(TForm)
    Label1: TLabel;
    TabControl1: TTabControl;
    tabDesc: TTabItem;
    tabInventario: TTabItem;
    GridPanelLayout1: TGridPanelLayout;
    Button1: TButton;
    EditID_AUDIOVISUAL: TEdit;
    LabelID_AUDIOVISUAL: TLabel;
    EditNOMBRE: TEdit;
    LabelNOMBRE: TLabel;
    MemoDESCRIPCION: TMemo;
    EditSERIAL: TEdit;
    LabelSERIAL: TLabel;
    EditCANTIDAD: TEdit;
    LabelCANTIDAD: TLabel;
    Label2: TLabel;
    NavigatorBindSourceDB2: TBindNavigator;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    ListBox1: TListBox;
    LinkListControlToField1: TLinkListControlToField;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInventario: TfrmInventario;

implementation

{$R *.fmx}

uses DataModule;

procedure TfrmInventario.Button1Click(Sender: TObject);
begin
  self.Free;
end;

procedure TfrmInventario.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  TabControl1.ActiveTab := tabDesc;
end;

{ TSingleton }

constructor TSingleton.create;
begin
  inherited;
end;

destructor TSingleton.destroy;
begin
  if FInstance <> nil then
  begin
    FInstance.Free;
  end;
end;

class function TSingleton.GetInstance: TSingleton;
begin
  if FInstance = nil then
  begin
    FInstance := TSingleton.create;
  end;
  Result := FInstance;
end;

end.
