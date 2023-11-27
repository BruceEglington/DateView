unit DVIW_boundaries;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, DVIW_frProductTree,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFBoundaries = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    TopBar: TISFTopBar;
    FDMemTable1: TFDMemTable;
    FDMemTable1BoundaryID: TIntegerField;
    FDMemTable1BoundaryName: TStringField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, DVIW_dm, DVIW_uMain, DVIW_constants;




procedure TISFBoundaries.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsBoundaries.Open;
end;

procedure TISFBoundaries.IWAppFormRender(Sender: TObject);
begin
  iwlPrevPage.Visible := (dmDV.cdsBoundaries.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsBoundaries.RecordCount > iwDBg.RowLimit);
end;

procedure TISFBoundaries.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmDV.cdsBoundaries.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFBoundaries.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsBoundaries.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFBoundaries.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsBoundaries.MoveBy(iwDBg.RowLimit);
end;

procedure TISFBoundaries.iwbCloseClick(Sender: TObject);
begin
  dmDV.cdsBoundaries.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFBoundaries.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmDV.cdsBoundaries.First;
  repeat
    FDMemTable1.AppendRecord([dmDV.cdsBoundariesBOUNDARYID.AsVariant,dmDV.cdsBoundariesBOUNDARYNAME.AsVariant]);
    dmDV.cdsBoundaries.Next;
  until dmDV.cdsBoundaries.Eof;
  //dmUser.SetDeveloperData('after filling FDMemTable1 in ClanTypes');
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxBoundaries.xlsx';
  dmDV.cdsBoundaries.First;
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxBoundaries.xlsx';
  frFileNameStr := 'Boundaries.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('FDMemTable1',FDMemTable1);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end;
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

end.
