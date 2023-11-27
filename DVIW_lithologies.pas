unit DVIW_lithologies;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, DVIW_frProductTree,
  Controls, Forms, DVIW_frTopBar, IWBaseControl, IWControl, IWCompRectangle,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFLithologies = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    TopBar: TISFTopBar;
    FDMemTable1: TFDMemTable;
    FDMemTable1Lithology: TStringField;
    FDMemTable1LithGroup: TStringField;
    FDMemTable1LithGroupID: TIntegerField;
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




procedure TISFLithologies.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmDV.cdsLithol.Open;
end;

procedure TISFLithologies.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmDV.cdsLithol.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmDV.cdsLithol.RecordCount > iwDBg.RowLimit);
end;

procedure TISFLithologies.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmDV.cdsLithol.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFLithologies.iwlPrevPageClick(Sender: TObject);
begin
  dmDV.cdsLithol.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFLithologies.iwlNextPageClick(Sender: TObject);
begin
  dmDV.cdsLithol.MoveBy(iwDBg.RowLimit);
end;

procedure TISFLithologies.iwbCloseClick(Sender: TObject);
begin
  dmDV.cdsLithol.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFLithologies.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  FDMemTable1.EmptyDataset;
  dmDV.cdsLithol.First;
  repeat
    FDMemTable1.AppendRecord([dmDV.cdsLitholLITHOLOGY.AsVariant,dmDV.cdsLitholLITHGROUPID.AsVariant,dmDV.cdsLitholLITHGROUP.AsVariant]);
    dmDV.cdsLithol.Next;
  until dmDV.cdsLithol.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxLithol.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxLithol.xlsx';
  frFileNameStr := 'Lithologies.xlsx';
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
