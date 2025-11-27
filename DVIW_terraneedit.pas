unit DVIW_terraneedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFTerraneEdit = class(TIWAppForm)
    iwDBeTerrane: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    IWLabel3: TIWLabel;
    iwDBlcbContinent: TIWDBLookupComboBox;
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
  ServerController, DVIW_dmStrat, DB, DVIW_terranes, usrIW_dm;




procedure TISFTerraneEdit.IWAppFormRender(Sender: TObject);
begin
  iwDBeTerrane.Enabled := UserSession.CanModify and (dmStrat.cdsTerranes.State in [dsEdit,dsInsert]);
  iwbEdit.Enabled := UserSession.CanModify and (dmStrat.cdsTerranes.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmStrat.cdsTerranes.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmStrat.cdsTerranes.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanModify and (dmStrat.cdsTerranes.State in [dsBrowse]);
  iwbReturn.Enabled := dmStrat.cdsTerranes.State in [dsBrowse];
end;

procedure TISFTerraneEdit.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbDelete.Visible := UserSession.CanDelete;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'User is ' + UserSession.UserDisplayName;
  end;
  dmStrat.qTerranes.Close;
  dmStrat.cdsTerranes.Close;
  dmStrat.qTerranes.SQL.Clear;
  dmStrat.qTerranes.SQL.Add('SELECT DOMAINS.DOMAINNAME,DOMAINS.CONTINENTID,');
  dmStrat.qTerranes.SQL.Add('  DOMAINS.DOMAINID,DOMAINS.DOMAINTYPEID');
  dmStrat.qTerranes.SQL.Add('FROM DOMAINS,DOMAINTYPES');
  dmStrat.qTerranes.SQL.Add('WHERE DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID');
  dmStrat.qTerranes.SQL.Add('AND DOMAINTYPES.DVLEVEL > 2');
  if (UserSession.IncludeContinentValues) then
  begin
    dmStrat.qTerranes.SQL.Add('AND ( DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStrat.qTerranes.SQL.Add('OR DOMAINS.ContinentID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qTerranes.SQL.Add(' ) ');
  end;
  //dmUser.SetDeveloperData('Terraneedit 0');
  //dmUser.SetDeveloperData(dmStrat.qTerranes.SQL.Text);
  dmStrat.cdsTerranes.Open;
  dmStrat.cdsContinents.Open;
  dmStrat.cdsTerranes.Locate('DOMAINID',UserSession.ParameterChosen,[loCaseInsensitive,loPartialKey]);
  //dmUser.SetDeveloperData('Terraneedit 1');
  iwDBeTerrane.Editable := UserSession.CanModify;
  iwDBlcbContinent.Editable := UserSession.CanModify;
  //dmUser.SetDeveloperData('Terraneedit 2');
end;

procedure TISFTerraneEdit.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsContinents.Close;
  dmStrat.cdsTerranes.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFTerranes.Create(WebApplication).Show;
end;

procedure TISFTerraneEdit.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmStrat.cdsTerranes.Post;
  except
  end;
  try
    dmStrat.cdsTerranes.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFTerraneEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmStrat.cdsTerranes.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFTerraneEdit.iwbDeleteClick(Sender: TObject);
begin
  try
    dmStrat.cdsTerranes.Delete;
    dmStrat.cdsTerranes.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

procedure TISFTerraneEdit.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsTerranes.Edit;
end;

end.
