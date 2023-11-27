unit DVIW_models;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWCompEdit, IWDBStdCtrls, IWHTMLControls,
  IWCompButton, IWCompListbox, IWVCLBaseControl, IWBaseHTMLControl,
  IWCompLabel, IWCompMemo;

type
  TISFModels = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNewModel: TIWButton;
    iwlSortedBy: TIWLabel;
    rectLeft: TIWRectangle;
    IWMemo1: TIWMemo;
    TopBar: TISFTopBar;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwDBgColumns1Click(ASender: TObject;
      const AValue: String);
    procedure iwbAddNewModelClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwDBgColumns0TitleClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, DVIW_uMain, DVIW_constants, DVIW_dmdata, DVIW_dm;




procedure TISFModels.IWAppFormRender(Sender: TObject);
begin
  iwbAddNewModel.Enabled := UserSession.CanModify and (dmdDV.cdsIsoModels.State in [dsBrowse]);
  iwbApplyUpdates.Enabled := UserSession.CanModify and (dmdDV.cdsIsoModels.State in [dsEdit,dsInsert]);
  iwbCancelUpdates.Enabled := UserSession.CanModify and (dmdDV.cdsIsoModels.State in [dsEdit,dsInsert]);
  //iwbDelete.Enabled := UserSession.CanDelete and (dmdDV.cdsIsoModels.State in [dsBrowse]);
end;

procedure TISFModels.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  {Models}
  dmdDV.qIsoModels.Close;
  dmdDV.qIsoModels.ParamByName('ISOSYSTEM').AsString := UserSession.Parameter2Chosen;
  dmdDV.cdsIsoModels.Close;
  dmdDV.cdsIsoModels.Open;
  iwlPrevPage.Visible := (dmdDV.cdsIsoModels.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmdDV.cdsIsoModels.RecordCount > iwDBg.RowLimit);
end;

procedure TISFModels.iwbCloseClick(Sender: TObject);
begin
  dmdDV.cdsIsoModels.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFModels.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmdDV.cdsIsoModels.Post;
  except
  end;
  try
    dmdDV.cdsIsoModels.ApplyUpdates(0);
  except
  end;
end;

procedure TISFModels.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmdDV.cdsIsoModels.CancelUpdates;
  except
  end;
end;

procedure TISFModels.iwDBgColumns1Click(ASender: TObject;
  const AValue: String);
begin
  {
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFRefDetails.Create(WebApplication).Show;
  }
end;

procedure TISFModels.iwbAddNewModelClick(Sender: TObject);
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
    WebApplication.ShowMessage('Not able to add new Model.',smAlert);
  end;
  }
end;

procedure TISFModels.iwlPrevPageClick(Sender: TObject);
begin
  dmdDV.cdsIsoModels.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFModels.iwlNextPageClick(Sender: TObject);
begin
  dmdDV.cdsIsoModels.MoveBy(iwDBg.RowLimit);
end;

procedure TISFModels.iwDBgColumns0TitleClick(
  Sender: TObject);
begin
  dmdDV.cdsIsoModels.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

end.
