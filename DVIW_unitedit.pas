unit DVIW_unitedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion;

type
  TISFUnitEdit = class(TIWAppForm)
    TopBar: TISFTopBar;
    iwrUnitArea: TIWRegion;
    IWLabel3: TIWLabel;
    iwDBlcbArea: TIWDBLookupComboBox;
    iwrUnitDetails: TIWRegion;
    IWLabel1: TIWLabel;
    iwDBeUnitName: TIWDBEdit;
    IWLabel2: TIWLabel;
    iwDBlcbUnitRank: TIWDBLookupComboBox;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    IWLabel7: TIWLabel;
    iwdbeStratDBID: TIWDBEdit;
    iwdbeOffset3: TIWDBEdit;
    iwdbeOffset2: TIWDBEdit;
    iwdbeOffset1: TIWDBEdit;
    IWLabel8: TIWLabel;
    iwdbeUnitID: TIWDBEdit;
    IWDBEdit1: TIWDBEdit;
    iwrButtonsTop: TIWRegion;
    iwbReturn: TIWButton;
    iwbEdit: TIWButton;
    IWDBNavigator1: TIWDBNavigator;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
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
  ServerController, DVIW_dm, DB, DVIW_units, usrIW_dm;




procedure TISFUnitEdit.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsThisUnit.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsThisUnit.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsThisUnit.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanModify and (dmDV.cdsThisUnit.State in [dsBrowse]);
end;

procedure TISFUnitEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwrUnitArea.Visible := false;
  dmDV.cdsThisUnit.Close;
  dmDV.qThisUnit.Close;
  dmDV.qThisUnit.ParamByName('UnitID').AsString := UserSession.Parameter2Chosen;
  //dmUser.SetDeveloperData(dmDV.qThisUnit.SQL.Text);
  dmDV.cdsThisUnit.Open;
  dmDV.cdsUnitRanks.Open;
  dmDV.cdsCountries.Open;
  try
  dmDV.cdsThisUnitCountry.Close;
  dmDV.qThisUnitCountry.Close;
  dmDV.qThisUnitCountry.ParamByName('UnitID').AsString := UserSession.Parameter2Chosen;
  dmDV.qThisUnitCountry.ParamByName('CountryAbr').AsString := UserSession.NewAreaID;
  //dmUser.SetDeveloperData(dmDV.qThisUnitCountry.SQL.Text);
  dmDV.cdsThisUnitCountry.Open;
  except
  end;
  if (UserSession.ParameterChosen = 'NEW'+UserSession.UserID) then
  begin
    iwrUnitArea.Visible := true;
  end;
end;

procedure TISFUnitEdit.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsUnitRanks.Close;
  dmDV.cdsThisUnit.Close;
  dmDV.cdsThisUnitCountry.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFUnits.Create(WebApplication).Show;
end;

procedure TISFUnitEdit.iwbSaveChangesClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := true;
  {
  try
    dmDV.cdsThisUnit.Post;
  except
    //dmUser.SetDeveloperData('Unsuccessful Post UnitEditSaveChanges 1 '+dmDV.qThisUnit.SQL.Text);
  end;
  }
  try
    dmDV.cdsThisUnit.ApplyUpdates(0);
    //dmUser.SetDeveloperData('Successful UnitEditSaveChanges 1 '+dmDV.qThisUnit.SQL.Text);
  except
    //dmUser.SetDeveloperData('Unsuccessful UnitEditSaveChanges 1 '+dmDV.qThisUnit.SQL.Text);
    //WebApplication.ShowMessage('Not able to update changes to this record');
  end;
  //dmUser.SetDeveloperData('UnitEditSaveChanges 1 '+dmDV.qThisUnit.SQL.Text);
  //now insert link to area
  if (iwDBlcbArea.KeyValue <> '') then
  begin
    dmDV.AddUnitAreaLink(iwDBeUnitID.Text,iwDBlcbArea.KeyValue,WasSuccessful);
    if not WasSuccessful then WebApplication.ShowMessage('Not able to insert link to Area');
  end;
  //dmUser.SetDeveloperData('UnitEditSaveChanges 2 '+dmDV.qThisUnit.SQL.Text);
end;

procedure TISFUnitEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsThisUnit.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFUnitEdit.iwbDeleteClick(Sender: TObject);
begin
  try
    dmDV.cdsThisUnit.Delete;
    dmDV.cdsThisUnit.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this unit.',smAlert);
  end;
end;

procedure TISFUnitEdit.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsThisUnit.Edit;
end;

end.
