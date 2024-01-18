unit DVIW_poles;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, DVIW_frProductTree,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton;

type
  TISFPoles = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    TopBar: TISFTopBar;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwDBgColumns1Click(ASender: TObject; const AValue: String);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DVIW_uMain, DVIW_poleedit;




procedure TISFPoles.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsPoles.Open;
end;

procedure TISFPoles.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmDV.cdsPoles.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsPoles.RecordCount > iwDBg.RowLimit);
end;

procedure TISFPoles.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmDV.cdsPoles.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFPoles.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsPoles.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFPoles.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsPoles.MoveBy(iwDBg.RowLimit);
end;

procedure TISFPoles.iwbCloseClick(Sender: TObject);
begin
  dmDV.cdsPoles.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFPoles.iwDBgColumns1Click(ASender: TObject;
  const AValue: String);
begin
  if UserSession.CanModifyPlus then
  begin
    UserSession.ParameterChosen := AValue;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFPoleEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Extended edit rights are required to change these values');
  end;
end;

end.
