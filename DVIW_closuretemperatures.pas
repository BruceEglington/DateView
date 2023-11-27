unit DVIW_closuretemperatures;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWCompEdit, IWDBStdCtrls, IWHTMLControls,
  IWCompButton, IWCompListbox, IWVCLBaseControl, IWBaseHTMLControl,
  IWCompLabel;

type
  TISFClosureTemperatures = class(TIWAppForm)
    TopBar: TISFTopBar;
    iwDBg: TIWDBGrid;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    iwbAddNewRecord: TIWButton;
    rectLeft: TIWRectangle;
    iwlSortedBy: TIWLabel;
    iwbEdit: TIWButton;
    IWDBNavigator1: TIWDBNavigator;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwDBgRenderCell(ACell: TIWGridCell; const ARow,
      AColumn: Integer);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbAddNewRecordClick(Sender: TObject);
    procedure iwDBgColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwDBgColumns0TitleClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, IWColor, Graphics,
  DVIW_dm, DVIW_uMain, DVIW_constants, DVIW_closuredetailedit;




procedure TISFClosureTemperatures.IWAppFormRender(Sender: TObject);
begin
  iwbAddNewRecord.Visible := UserSession.CanModify;
  iwbEdit.Visible := UserSession.CanModify;
end;

procedure TISFClosureTemperatures.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsClosureTemperatures.Close;
  dmDV.cdsClosureTemperatures.Open;
end;

procedure TISFClosureTemperatures.iwDBgRenderCell(ACell: TIWGridCell; const ARow,
  AColumn: Integer);
begin
  (*
  if ARow = -1 then //Footer
  begin
  end else
  begin
    if iwDBg.RowIsCurrent then //current row ??
    begin
      {
      if AColumn = 0 then ACell.Text := ''; // SampleNo
      if AColumn = 1 then ACell.Text := ''; // ContinentID
      if AColumn = 2 then ACell.Text := ''; // CountryAbr
      if AColumn = 3 then ACell.Text := ''; // Latitude
      if AColumn = 4 then ACell.Text := ''; // LatitudePrecision
      if AColumn = 5 then ACell.Text := ''; // Longitude
      if AColumn = 6 then ACell.Text := ''; // LongitudePrecision
      if AColumn = 7 then ACell.Text := ''; // Elevation
      if AColumn = 8 then ACell.Text := ''; // ElevationPrecision
      }
    end;
  end;
  *)
end;

procedure TISFClosureTemperatures.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsClosureTemperatures.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFClosureTemperatures.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsClosureTemperatures.MoveBy(iwDBg.RowLimit);
end;

procedure TISFClosureTemperatures.iwbCloseClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFClosureTemperatures.iwbAddNewRecordClick(Sender: TObject);
begin
  {
  try
    dmDV.cdsSmpLoc.Open;
    dmDV.cdsSmpLoc.Append;
    dmDV.cdsSmpLocSAMPLENO.AsString := 'NEW';
    dmDV.cdsSmpLocCONTINENTID.AsString := ValueForUndefinedContinentID;
    dmDV.cdsSmpLocCOUNTRYABR.AsString := ValueForUndefinedCountryAbr;
    dmDV.cdsSmpLocLATITUDE.AsFloat := 90.00;
    dmDV.cdsSmpLocLONGITUDE.AsFloat := 0.00;
    dmDV.cdsSmpLocELEVATION.AsFloat := 0.00;
    dmDV.cdsSmpLoc.Post;
    UserSession.ParameterChosen := 'NEW';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFSampleEdit.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to add new Sample.',smAlert);
  end;
  }
end;

procedure TISFClosureTemperatures.iwDBgColumns0Click(ASender: TObject;
  const AValue: String);
begin
  if UserSession.CanModify then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFClosureDetailEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Sorry, edit rights are required to do this');
  end;
end;

procedure TISFClosureTemperatures.iwDBgColumns0TitleClick(Sender: TObject);
begin
  dmDV.cdsClosureTemperatures.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFClosureTemperatures.iwbEditClick(Sender: TObject);
begin
  if UserSession.CanModify then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFClosureDetailEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Sorry, edit rights are required to do this');
  end;
end;

end.
