unit DVIW_standards;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWCompEdit, IWDBStdCtrls, IWHTMLControls,
  IWCompButton, IWCompListbox, IWVCLBaseControl, IWBaseHTMLControl,
  IWCompLabel, IWCompMemo;

type
  TISFStandards = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNewStandard: TIWButton;
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
    procedure iwbAddNewStandardClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwDBgColumns0TitleClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, DVIW_uMain, DVIW_constants, DVIW_dmdata,
  DVIW_standardvalues;




procedure TISFStandards.IWAppFormRender(Sender: TObject);
begin
  iwbApplyUpdates.Visible := UserSession.CanModify and (dmdDV.cdsStandards.State in [dsEdit,dsInsert]);
  iwbCancelUpdates.Visible := UserSession.CanModify and (dmdDV.cdsStandards.State in [dsEdit,dsInsert]);
  iwbAddNewStandard.Visible := UserSession.CanModify and (dmdDV.cdsStandards.State in [dsBrowse]);
end;

procedure TISFStandards.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmdDV.cdsStandards.Close;
  dmdDV.cdsStandards.Open;
  iwlPrevPage.Visible := (dmdDV.cdsStandards.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmdDV.cdsStandards.RecordCount > iwDBg.RowLimit);
end;

procedure TISFStandards.iwbCloseClick(Sender: TObject);
begin
  dmdDV.cdsStandards.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFStandards.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmdDV.cdsStandards.Post;
  except
  end;
  try
    dmdDV.cdsStandards.ApplyUpdates(0);
  except
  end;
end;

procedure TISFStandards.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmdDV.cdsStandards.CancelUpdates;
  except
  end;
end;

procedure TISFStandards.iwDBgColumns1Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFStandardValues.Create(WebApplication).Show;
end;

procedure TISFStandards.iwbAddNewStandardClick(Sender: TObject);
begin
  try
    dmdDV.cdsStandards.Append;
    dmdDV.cdsStandardsSTANDARDID.AsString := 'NEW';
    dmdDV.cdsStandardsSTANDARDNAME.AsString := 'Newestandard';
    dmdDV.cdsStandards.Post;
    dmdDV.cdsStandards.Locate('STANDARDID','NEW',[])
  except
    WebApplication.ShowMessage('Not able to add new Standard.',smAlert);
  end;
end;

procedure TISFStandards.iwlPrevPageClick(Sender: TObject);
begin
  dmdDV.cdsStandards.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFStandards.iwlNextPageClick(Sender: TObject);
begin
  dmdDV.cdsStandards.MoveBy(iwDBg.RowLimit);
end;

procedure TISFStandards.iwDBgColumns0TitleClick(
  Sender: TObject);
begin
  dmdDV.cdsStandards.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

end.
