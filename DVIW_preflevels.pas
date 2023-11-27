unit DVIW_preflevels;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, DVIW_frProductTree,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls;

type
  TISFPrefLevels = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    IWDBNavigator1: TIWDBNavigator;
    IWDBMemo1: TIWDBMemo;
    IWLabel1: TIWLabel;
    TopBar: TISFTopBar;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DVIW_dm, DVIW_uMain;




procedure TISFPrefLevels.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsPrefLevels.Open;
end;

procedure TISFPrefLevels.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmDV.cdsPrefLevels.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsPrefLevels.RecordCount > iwDBg.RowLimit);
end;

procedure TISFPrefLevels.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmDV.cdsPrefLevels.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFPrefLevels.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsPrefLevels.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFPrefLevels.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsPrefLevels.MoveBy(iwDBg.RowLimit);
end;

procedure TISFPrefLevels.iwbCloseClick(Sender: TObject);
begin
  dmDV.cdsPrefLevels.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

end.
