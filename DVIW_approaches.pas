unit DVIW_approaches;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, DVIW_frProductTree,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TISFApproaches = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    TopBar: TISFTopBar;
    FDMemTable1: TFDMemTable;
    FDMemTable1ApproachID: TStringField;
    FDMemTable1ApproachDescription: TStringField;
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

procedure TISFApproaches.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsApproach.Open;
end;

procedure TISFApproaches.IWAppFormRender(Sender: TObject);
begin
  iwlPrevPage.Visible := (dmDV.cdsApproach.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsApproach.RecordCount > iwDBg.RowLimit);
end;

procedure TISFApproaches.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmDV.cdsApproach.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFApproaches.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsApproach.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFApproaches.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsApproach.MoveBy(iwDBg.RowLimit);
end;

procedure TISFApproaches.iwbCloseClick(Sender: TObject);
begin
  dmDV.cdsApproach.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFApproaches.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmDV.cdsApproach.First;
  repeat
    FDMemTable1.AppendRecord([dmDV.cdsApproachAPPROACHABR.AsVariant,dmDV.cdsApproachAPPROACHDESCRIPTION.AsVariant]);
    dmDV.cdsApproach.Next;
  until dmDV.cdsApproach.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxApproach.xlsx';
  dmDV.cdsApproach.First;
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxApproach.xlsx';
  frFileNameStr := 'Approaches.xlsx';
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
