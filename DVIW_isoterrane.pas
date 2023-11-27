unit DVIW_isoterrane;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFIsoTerrane = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    iwDBlcb: TIWDBLookupComboBox;
    iwDBgrid: TIWDBGrid;
    iwbEdit: TIWButton;
    iwbAddTerrane: TIWButton;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbAddTerraneClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DB, DVIW_detailsedit, DVIW_constants;




procedure TISFIsoTerrane.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsTerrane.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsTerrane.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsTerrane.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanDelete and (dmDV.cdsTerrane.State in [dsBrowse]);
end;

procedure TISFIsoTerrane.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.qTerranes.Close;
  dmDV.qTerranes.SQL.Clear;
  dmDV.qTerranes.SQL.Add('SELECT DOMAINS.DOMAINNAME,DOMAINS.CONTINENTID,');
  dmDV.qTerranes.SQL.Add('  DOMAINS.DOMAINID,DOMAINS.DOMAINTYPEID');
  dmDV.qTerranes.SQL.Add('FROM DOMAINS,CONTINENT,DOMAINTYPE');
  dmDV.qTerranes.SQL.Add('WHERE CONTINENT.CONTINENTID = DOMAINS.CONTINENTID');
  dmDV.qTerranes.SQL.Add('AND DOMAINS.DOMAINTYPEID=DOMAINTYPE.DOMAINTYPEID');
  dmDV.qTerranes.SQL.Add('AND DOMAINTYPE.DOMAINTYPELEVEL > 2');
  if (UserSession.IncludeContinentValues) then
  begin
    dmDV.qTerranes.SQL.Add('AND ( DOMAINS.ContinentID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDV.qTerranes.SQL.Add('OR DOMAINS.ContinentID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qTerranes.SQL.Add(' ) ');
  end;
  dmDV.qTerranes.SQL.Add('ORDER BY DOMAINS.DOMAINNAME');
  dmDV.cdsTerranes.Open;
  dmDV.cdsTerrane.Locate('DOMAINID',UserSession.ParameterChosen,[]);
  iwDBlcb.Editable := UserSession.CanModify;
end;

procedure TISFIsoTerrane.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsTerranes.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetailsEdit.Create(WebApplication).Show;
end;

procedure TISFIsoTerrane.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsTerrane.Post;
  except
  end;
  try
    dmDV.cdsTerrane.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFIsoTerrane.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsTerrane.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFIsoTerrane.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsTerrane.Delete;
    dmDV.cdsTerrane.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this link.',smAlert);
  end;
end;

procedure TISFIsoTerrane.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsTerrane.Edit;
end;

procedure TISFIsoTerrane.iwbAddTerraneClick(Sender: TObject);
begin
  try
    dmDV.cdsTerrane.Append;
    dmDV.cdsTerraneRECORDID.AsString := UserSession.RecordChosen;
    dmDV.cdsTerraneDOMAINNAME.AsString := 'NEW';
    dmDV.cdsTerrane.Post;
    UserSession.ParameterChosen := 'NEW';
  except
  end;
end;

end.
