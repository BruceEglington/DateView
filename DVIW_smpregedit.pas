unit DVIW_smpregedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWCompText;

type
  TISFSmpRegEdit = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    iwDBlcbIncluded: TIWDBLookupComboBox;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    IWLabel7: TIWLabel;
    IWLabel8: TIWLabel;
    IWLabel9: TIWLabel;
    iwDBeLatitude: TIWDBEdit;
    iwDBeLongitude: TIWDBEdit;
    iwDBeElevation: TIWDBEdit;
    iwDBeLatitudePrecision: TIWDBEdit;
    iwDBeLongitudePrecision: TIWDBEdit;
    iwDBeElevationPrecision: TIWDBEdit;
    iwDBlcbIsoSystem: TIWDBLookupComboBox;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDeleteSample: TIWButton;
    iwDBlcbSample: TIWDBLookupComboBox;
    IWLabel10: TIWLabel;
    IWText1: TIWText;
    iwbAdd: TIWButton;
    iwbEdit: TIWButton;
    IWLabel11: TIWLabel;
    iwDBeOriginalNo: TIWDBEdit;
    iwDBlcbFrac: TIWDBLookupComboBox;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteSampleClick(Sender: TObject);
    procedure iwbAddClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwDBlcbSampleChange(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DB, DVIW_detailsedit, DVIW_details,
  DVIW_constants;




procedure TISFSmpRegEdit.IWAppFormRender(Sender: TObject);
begin
  iwbSaveChanges.Visible := UserSession.CanModify and (dmDV.cdsSmpReg.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmDV.cdsSmpReg.State in [dsEdit,dsInsert]);
  iwbEdit.Visible := UserSession.CanModify and (dmDV.cdsSmpReg.State in [dsBrowse]);
  iwbAdd.Visible := UserSession.CanModify and (dmDV.cdsSmpReg.State in [dsBrowse]);
  iwbDeleteSample.Visible := UserSession.CanDelete and (dmDV.cdsSmpReg.State in [dsBrowse]);
  iwDBlcbFrac.KeyValue := dmDV.cdsFracsForSampleFRAC.AsString;
end;

procedure TISFSmpRegEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  {
  dmDV.qSmpReg.Close;
  dmDV.qSmpReg.ParamByName('RECORDID').AsString := UserSession.RecordChosen;
  dmDV.cdsSmpReg.Close;
  dmDV.cdsSmpReg.Open;
  }
  dmDV.cdsSmpReg.Locate('SAMPLENO',UserSession.ParameterChosen,[]);
  dmDV.qFracsForSample.Close;
  dmDV.qFracsForSample.ParamByName('SampleNo').AsString := UserSession.ParameterChosen;
  dmDV.qFracsForSample.Open;
  dmDV.cdsFracsForSample.Close;
  dmDV.cdsFracsForSample.Open;
  dmDV.cdsFracsForSample.First;
  dmDV.cdsContinents.Open;
  dmDV.cdsCountries.Open;
  dmDV.cdsYesNo.Open;
  iwDBlcbSample.Editable := UserSession.CanModify;
  iwDBlcbIncluded.Editable := UserSession.CanModify;
  iwDBlcbIsoSystem.Editable := UserSession.CanModify;
  iwDBlcbFrac.Editable := UserSession.CanModify;
  iwDBeOriginalNo.Editable := false;
  iwDBeLatitude.Editable := false;
  iwDBeLongitude.Editable := false;
  iwDBeElevation.Editable := false;
  iwDBeLatitudePrecision.Editable := false;
  iwDBeLongitudePrecision.Editable := false;
  iwDBeElevationPrecision.Editable := false;
end;

procedure TISFSmpRegEdit.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsYesNo.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  if (UserSession.UnitSender=usDetailsEdit) then
    TISFDetailsEdit.Create(WebApplication).Show;
  if (UserSession.UnitSender=usDetails) then
    TISFDetails.Create(WebApplication).Show;
end;

procedure TISFSmpRegEdit.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsSmpReg.Post;
  except
  end;
  try
    dmDV.cdsSmpReg.ApplyUpdates(0);
    dmDV.cdsSmpReg.Close;
    dmDV.cdsSmpReg.Open;
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFSmpRegEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmDV.cdsSmpReg.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFSmpRegEdit.iwbDeleteSampleClick(Sender: TObject);
begin
  try
    dmDV.cdsSmpReg.Delete;
    dmDV.cdsSmpReg.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete Sample.',smAlert);
  end;
end;

procedure TISFSmpRegEdit.iwbAddClick(Sender: TObject);
var
  tmpSampleNo, tmpIsoSystem : string;
  tmp1, tmp2 : string;
begin
  tmpSampleNo := 'NEW';
  tmpIsoSystem := dmDV.cdsResultsISOTOPESYSTEM.AsString;
  try
    dmDV.cdsSmpReg.Append;
    dmDV.cdsSmpRegRECORDID.AsString := Trim(UserSession.RecordChosen);
    dmDV.cdsSmpRegSAMPLENO.AsString := tmpSampleNo;
    dmDV.cdsSmpRegISOSYSTEM.AsString := tmpIsoSystem;
    tmp1 := '1';
    dmDV.cdsSmpRegFRAC.AsString := tmp1;
    tmp2 := 'Y';
    dmDV.cdsSmpRegINCLUDED.AsString := tmp2;
    dmDV.cdsSmpReg.Post;
  except
    WebApplication.ShowMessage('Not able to insert new linked Sample record',smAlert);
  end;
end;

procedure TISFSmpRegEdit.iwbEditClick(Sender: TObject);
begin
  dmDV.cdsSmpReg.Edit;
end;

procedure TISFSmpRegEdit.iwDBlcbSampleChange(Sender: TObject);
begin
  dmDV.qFracsForSample.Close;
  dmDV.qFracsForSample.ParamByName('SampleNo').AsString := iwDBlcbSample.KeyValue;
  dmDV.qFracsForSample.Open;
  dmDV.cdsFracsForSample.Close;
  dmDV.cdsFracsForSample.Open;
  dmDV.cdsFracsForSample.First;
end;

end.


