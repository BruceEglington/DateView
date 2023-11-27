unit DVIW_standardvalues;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWCompEdit, IWDBStdCtrls, IWHTMLControls,
  IWCompButton, IWCompListbox, IWVCLBaseControl, IWBaseHTMLControl,
  IWCompLabel, IWCompMemo;

type
  TISFStandardValues = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNewStandardValue: TIWButton;
    iwlSortedBy: TIWLabel;
    rectLeft: TIWRectangle;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwDBgColumns1Click(ASender: TObject;
      const AValue: String);
    procedure iwbAddNewStandardValueClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwDBgColumns0TitleClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, DVIW_uMain, DVIW_constants, DVIW_dmdata;




procedure TISFStandardValues.IWAppFormRender(Sender: TObject);
begin
  iwbApplyUpdates.Visible := UserSession.CanModify and (dmdDV.cdsStandardValues.State in [dsEdit,dsInsert]);
  iwbCancelUpdates.Visible := UserSession.CanModify and (dmdDV.cdsStandardValues.State in [dsEdit,dsInsert]);
  iwbAddNewStandardValue.Visible := UserSession.CanModify and (dmdDV.cdsStandardValues.State in [dsBrowse]);
end;

procedure TISFStandardValues.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  {Standard Values}
  dmdDV.qStandardValues.Close;
  dmdDV.qStandardValues.ParamByName('STANDARDID').AsString := UserSession.ParameterChosen;
  dmdDV.cdsStandardValues.Close;
  dmdDV.cdsStandardValues.Open;
  iwlPrevPage.Visible := (dmdDV.cdsStandardValues.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmdDV.cdsStandardValues.RecordCount > iwDBg.RowLimit);
end;

procedure TISFStandardValues.iwbCloseClick(Sender: TObject);
begin
  dmdDV.cdsStandardValues.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFStandardValues.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmdDV.cdsStandardValues.Post;
  except
  end;
  try
    dmdDV.cdsStandardValues.ApplyUpdates(0);
  except
  end;
end;

procedure TISFStandardValues.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmdDV.cdsStandardValues.CancelUpdates;
  except
  end;
end;

procedure TISFStandardValues.iwDBgColumns1Click(ASender: TObject;
  const AValue: String);
begin
  {
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFRefDetails.Create(WebApplication).Show;
  }
end;

procedure TISFStandardValues.iwbAddNewStandardValueClick(Sender: TObject);
begin
  {
  try
    dmDV.cdsRefFull.Open;
    dmDV.cdsRefFull.Append;
    dmDV.cdsRefFullSOURCESHORT.AsString := 'NEW'+UserSession.UserID;
    dmDV.cdsRefFullCONTINENTID.AsString := ValueForUndefinedContinentID;
    dmDV.cdsRefFull.Post;
    dmDV.cdsRefFull.ApplyUpdates(0);
    dmDV.cdsRefFull.Close;

    dmDV.qReferences.Close;
    dmDV.qReferences.ParamByName('FIRSTREFERENCE').AsString := 'NEW'+UserSession.UserID;
    dmDV.qReferences.ParamByName('LASTREFERENCE').AsString := 'NEW'+UserSession.UserID;
    dmDV.cdsReferences.Close;
    dmDV.cdsReferences.Open;
    dmDV.cdsContinents.Open;
    dmDV.cdsCountries.Open;
  except
    WebApplication.ShowMessage('Not able to add new Standard and Variable.',smAlert);
  end;
  }
end;

procedure TISFStandardValues.iwlPrevPageClick(Sender: TObject);
begin
  dmdDV.cdsStandardValues.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFStandardValues.iwlNextPageClick(Sender: TObject);
begin
  dmdDV.cdsStandardValues.MoveBy(iwDBg.RowLimit);
end;

procedure TISFStandardValues.iwDBgColumns0TitleClick(
  Sender: TObject);
begin
  dmdDV.cdsStandardValues.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

end.
