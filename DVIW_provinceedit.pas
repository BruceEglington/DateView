unit DVIW_provinceedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel;

type
  TISFProvinceEdit = class(TIWAppForm)
    iwDBeProvince: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSave: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    IWLabel3: TIWLabel;
    iwDBlcbContinent: TIWDBLookupComboBox;
    TopBar: TISFTopBar;
    iwbEdit: TIWButton;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dmStrat, DB, DVIW_provinces, usrIW_dm;




procedure TISFProvinceEdit.IWAppFormRender(Sender: TObject);
begin
  iwDBeProvince.Enabled := UserSession.CanModify and (dmStrat.cdsProvinces.State in [dsEdit,dsInsert]);
  iwbEdit.Enabled := UserSession.CanModify and (dmStrat.cdsProvinces.State in [dsBrowse]);
  iwbSave.Enabled := UserSession.CanModify and (dmStrat.cdsProvinces.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Enabled := UserSession.CanModify and (dmStrat.cdsProvinces.State in [dsEdit,dsInsert]);
  iwbDelete.Enabled := UserSession.CanDelete and (dmStrat.cdsProvinces.State in [dsBrowse]);
  iwbReturn.Enabled := dmStrat.cdsProvinces.State in [dsBrowse];
end;

procedure TISFProvinceEdit.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbDelete.Visible := UserSession.CanDelete;
  //dmUser.SetDeveloperData('Create provinceedit');
  //dmUser.SetDeveloperData(UserSession.ParameterChosen);
  dmStrat.qProvinces.Close;
  dmStrat.cdsProvinces.Close;
  dmStrat.qProvinces.SQL.Clear;
  dmStrat.qProvinces.SQL.Add('SELECT DOMAINS.DOMAINNAME,DOMAINS.CONTINENTID,');
  dmStrat.qProvinces.SQL.Add('  DOMAINS.DOMAINID,DOMAINS.DOMAINTYPEID');
  dmStrat.qProvinces.SQL.Add('FROM DOMAINS,DOMAINTYPES');
  dmStrat.qProvinces.SQL.Add('WHERE DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID');
  dmStrat.qProvinces.SQL.Add('AND DOMAINTYPES.DVLEVEL <= 2');
  if (UserSession.IncludeContinentValues) then
  begin
    dmStrat.qProvinces.SQL.Add('AND ( DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStrat.qProvinces.SQL.Add('OR DOMAINS.ContinentID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qProvinces.SQL.Add(' ) ');
  end;
  //dmUser.SetDeveloperData(dmStrat.qProvinces.SQL.Text);
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  //try
    //dmUser.SetDeveloperData('provinceedit 0');
    dmStrat.cdsProvinces.Open;
    //dmUser.SetDeveloperData('provinceedit 0b');
    dmStrat.cdsProvinces.Locate('DOMAINID',UserSession.ParameterChosen,[loCaseInsensitive,loPartialKey]);
    //dmUser.SetDeveloperData('provinceedit 1');
  //except
  //end;
  dmStrat.cdsContinents.Open;
  //dmUser.SetDeveloperData('provinceedit 2');
  iwDBeProvince.Editable := UserSession.CanModify;
  iwDBlcbContinent.Editable := UserSession.CanModify;
  //dmUser.SetDeveloperData('provinceedit 3');
end;

procedure TISFProvinceEdit.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsProvinces.Close;
  dmStrat.cdsContinents.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFProvinces.Create(WebApplication).Show;
end;

procedure TISFProvinceEdit.iwbSaveClick(Sender: TObject);
var
  i, Cnt : integer;
begin
  try
    dmStrat.cdsProvinces.Post;
  except
  end;
  try
    dmStrat.cdsProvinces.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFProvinceEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmStrat.cdsProvinces.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFProvinceEdit.iwbDeleteClick(Sender: TObject);
begin
  try
    dmStrat.cdsProvinces.Delete;
    dmStrat.cdsProvinces.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

procedure TISFProvinceEdit.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsProvinces.Edit;
end;

end.
