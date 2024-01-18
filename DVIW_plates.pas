unit DVIW_plates;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, DVIW_frProductTree,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton, UCustomFlexCelReport, UFlexCelReport,
  UExcelAdapter, UFlxMemTable, XLSXAdapter;

type
  TISFPlates = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    Report1: TFlexCelReport;
    FlxMemTable1: TFlxMemTable;
    TopBar: TISFTopBar;
    XLSXAdapter1: TXLSXAdapter;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwDBgColumns1Click(ASender: TObject; const AValue: String);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, DVIW_dm, DVIW_uMain, DVIW_plateedit,
  DVIW_constants;




procedure TISFPlates.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsPlates.Open;
end;

procedure TISFPlates.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmDV.cdsPlates.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsPlates.RecordCount > iwDBg.RowLimit);
end;

procedure TISFPlates.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmDV.cdsPlates.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFPlates.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsPlates.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFPlates.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsPlates.MoveBy(iwDBg.RowLimit);
end;

procedure TISFPlates.iwbCloseClick(Sender: TObject);
begin
  dmDV.cdsPlates.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFPlates.iwbDownloadClick(Sender: TObject);
var
  {
  tmpPath : string;
  tmpFileName : string;
  }
  MemStream: TMemoryStream;
begin
  {
  tmpPath := WebApplication.UserCacheDir; // by putting the file in the cache folder, it will
                                         // automatically be deleted when the session terminates
  tmpFileName := 'TectonicPlates.xml';
  try
    dmDV.cdsPlates.SaveToFile(tmpPath+tmpFileName,dfXML);
    WebApplication.SendFile(tmpPath+tmpFileName,true, '', tmpFileName);
  except
  end;
  }
  dmDV.cdsPlates.First;
  FlxMemTable1.Open;
  FlxMemTable1.Clear;
  repeat
    FlxMemTable1.AddRecord([dmDV.cdsPlatesPLATEID.AsVariant,dmDV.cdsPlatesPLATENAME.AsVariant]);
    dmDV.cdsPlates.Next;
  until dmDV.cdsPlates.Eof;
  FlxMemTable1.First;
  Report1.Template := DefaultFlexCellFolder+'FlxPlates.xls';
  MemStream:=TMemoryStream.Create;
  try
    Report1.SavetoStream(MemStream);
    WebApplication.SendStream(MemStream,true,'','Plates.xls'); //save as an attachment
    MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
  finally
    FreeAndNil(MemStream);
  end; //finally
end;

procedure TISFPlates.iwDBgColumns1Click(ASender: TObject;
  const AValue: String);
begin
  if UserSession.CanModifyPlus then
  begin
    UserSession.ParameterChosen := AValue;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFPlateEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Extended edit rights are required to change these values');
  end;
end;

end.
