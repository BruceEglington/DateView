unit DVIW_isochemtype;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFIsoChemType = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    iwDBlcb: TIWDBLookupComboBox;
    iwDBgrid: TIWDBGrid;
    iwbEdit: TIWButton;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DB, DVIW_detailsedit, DVIW_constants;




procedure TISFIsoChemType.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsIsoChemType.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoChemType.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsIsoChemType.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsIsoChemType.State in [dsBrowse]);
end;

procedure TISFIsoChemType.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.qChemTypes.Close;
  dmDV.qChemTypes.SQL.Clear;
  dmDV.qChemTypes.SQL.Add('SELECT DISTINCT ChemTypes.ChemTypeAbr, ChemTypesLIST.ContinentID');
  dmDV.qChemTypes.SQL.Add('FROM ChemTypes,CONTINENT');
  dmDV.qChemTypes.SQL.Add('WHERE CONTINENT.ContinentID = ChemTypes.ContinentID');
  if (UserSession.IncludeContinentValues) then
  begin
    dmDV.qChemTypes.SQL.Add('AND ( ChemTypes.ContinentID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDV.qChemTypes.SQL.Add('OR ChemTypes.ContinentID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qChemTypes.SQL.Add(' ) ');
  end;
  dmDV.cdsChemTypes.Open;
  dmDV.cdsChemTypes.Locate('CHEMTYPEABR',UserSession.ParameterChosen,[]);
  iwDBlcb.Editable := UserSession.CanModify;
end;

procedure TISFIsoChemType.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsIsoChemType.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFIsoChemType.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoChemType.Post;
  except
  end;
  try
    dmDV.cdsIsoChemType.ApplyUpdates(0);
    UserSession.ParameterChosen := dmDV.cdsIsoChemTypeCHEMTYPEABR.AsString;
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFIsoChemType.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoChemType.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFIsoChemType.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsIsoChemType.Delete;
    dmDV.cdsIsoChemType.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this link.',smAlert);
  end;
end;

procedure TISFIsoChemType.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsIsoChemType.Edit;
end;

end.
