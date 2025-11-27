object ISFSampleEdit: TISFSampleEdit
  Left = 0
  Top = 0
  Width = 907
  Height = 647
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWDBNavigator1: TIWDBNavigator
    AlignWithMargins = False
    Left = 297
    Top = 70
    Width = 108
    Height = 29
    ZIndex = 1
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmDV.dsSmpLoc
    FriendlyName = 'IWDBNavigator1'
    ImageHeight = 21
    ImageWidth = 21
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Orientation = orHorizontal
  end
  object iwDBeSampleNo: TIWDBEdit
    AlignWithMargins = False
    Left = 117
    Top = 110
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'iwDBeSampleNo'
    SubmitOnAsyncEvent = True
    TabOrder = 1
    AutoEditable = True
    DataField = 'SAMPLENO'
    DataSource = dmDV.dsSmpLoc
    PasswordPrompt = False
  end
  object iwdblcbContinent: TIWDBLookupComboBox
    AlignWithMargins = False
    Left = 117
    Top = 140
    Width = 279
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    Required = True
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 5
    AutoEditable = True
    DataField = 'CONTINENTID'
    DataSource = dmDV.dsSmpLoc
    FriendlyName = 'iwdblcbContinent'
    KeyField = 'CONTINENTID'
    ListField = 'CONTINENT'
    ListSource = dmDV.dsContinents
    DisableWhenEmpty = True
  end
  object iwbReturn: TIWButton
    AlignWithMargins = False
    Left = 5
    Top = 74
    Width = 130
    Height = 25
    Caption = 'Return'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbReturn'
    TabOrder = 32
    OnClick = iwbReturnClick
  end
  object IWLabel1: TIWLabel
    AlignWithMargins = False
    Left = 32
    Top = 112
    Width = 69
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Sample no.'
  end
  object IWLabel2: TIWLabel
    AlignWithMargins = False
    Left = 32
    Top = 142
    Width = 58
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Continent'
  end
  object IWLabel3: TIWLabel
    AlignWithMargins = False
    Left = 32
    Top = 170
    Width = 27
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Area'
  end
  object IWLabel4: TIWLabel
    AlignWithMargins = False
    Left = 32
    Top = 202
    Width = 48
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Latitude'
  end
  object IWLabel5: TIWLabel
    AlignWithMargins = False
    Left = 32
    Top = 228
    Width = 60
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Longitude'
  end
  object IWLabel6: TIWLabel
    AlignWithMargins = False
    Left = 32
    Top = 254
    Width = 79
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Elevation (m)'
  end
  object IWLabel7: TIWLabel
    AlignWithMargins = False
    Left = 225
    Top = 202
    Width = 57
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Precision'
  end
  object IWLabel8: TIWLabel
    AlignWithMargins = False
    Left = 225
    Top = 230
    Width = 57
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Precision'
  end
  object IWLabel9: TIWLabel
    AlignWithMargins = False
    Left = 225
    Top = 256
    Width = 57
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Precision'
  end
  object iwDBeLatitude: TIWDBEdit
    AlignWithMargins = False
    Left = 117
    Top = 198
    Width = 78
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'iwDBeLatitude'
    SubmitOnAsyncEvent = True
    TabOrder = 7
    AutoEditable = True
    DataField = 'LATITUDE'
    DataSource = dmDV.dsSmpLoc
    PasswordPrompt = False
  end
  object iwDBeLongitude: TIWDBEdit
    AlignWithMargins = False
    Left = 117
    Top = 226
    Width = 78
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'iwDBeLongitude'
    SubmitOnAsyncEvent = True
    TabOrder = 8
    AutoEditable = True
    DataField = 'LONGITUDE'
    DataSource = dmDV.dsSmpLoc
    PasswordPrompt = False
  end
  object IWDBEdit4: TIWDBEdit
    AlignWithMargins = False
    Left = 117
    Top = 252
    Width = 78
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'IWDBEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 9
    AutoEditable = True
    DataField = 'ELEVATION'
    DataSource = dmDV.dsSmpLoc
    PasswordPrompt = False
  end
  object iwDBeLatitudePrecision: TIWDBEdit
    AlignWithMargins = False
    Left = 297
    Top = 200
    Width = 78
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'iwDBeLatitudePrecision'
    SubmitOnAsyncEvent = True
    TabOrder = 10
    AutoEditable = True
    DataField = 'LATITUDEPRECISION'
    DataSource = dmDV.dsSmpLoc
    PasswordPrompt = False
  end
  object iwDBeLongitudePrecision: TIWDBEdit
    AlignWithMargins = False
    Left = 297
    Top = 226
    Width = 78
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'iwDBeLongitudePrecision'
    SubmitOnAsyncEvent = True
    TabOrder = 11
    AutoEditable = True
    DataField = 'LONGITUDEPRECISION'
    DataSource = dmDV.dsSmpLoc
    PasswordPrompt = False
  end
  object IWDBEdit7: TIWDBEdit
    AlignWithMargins = False
    Left = 297
    Top = 252
    Width = 78
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'IWDBEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 12
    AutoEditable = True
    DataField = 'ELEVATIONPRECISION'
    DataSource = dmDV.dsSmpLoc
    PasswordPrompt = False
  end
  object iwdblcbCountry: TIWDBLookupComboBox
    AlignWithMargins = False
    Left = 117
    Top = 168
    Width = 279
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    Required = True
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 6
    AutoEditable = True
    DataField = 'COUNTRYABR'
    DataSource = dmDV.dsSmpLoc
    FriendlyName = 'iwdblcbCountry'
    KeyField = 'COUNTRYABR'
    ListField = 'COUNTRY'
    ListSource = dmDV.dsCountries
    DisableWhenEmpty = True
  end
  object iwbSaveChanges: TIWButton
    AlignWithMargins = False
    Left = 435
    Top = 74
    Width = 130
    Height = 25
    Caption = 'Save changes'
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 29
    OnClick = iwbSaveChangesClick
  end
  object iwbCancelChanges: TIWButton
    AlignWithMargins = False
    Left = 579
    Top = 74
    Width = 130
    Height = 25
    Caption = 'Cancel changes'
    Color = clWebLIGHTSTEELBLUE
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 30
    OnClick = iwbCancelChangesClick
  end
  object iwbDeleteSample: TIWButton
    AlignWithMargins = False
    Left = 723
    Top = 74
    Width = 130
    Height = 25
    Caption = 'Delete sample'
    Confirmation = 'Are you sure you want to delete this sample?'
    Color = clWebLIGHTCORAL
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbDeleteSample'
    TabOrder = 31
    OnClick = iwbDeleteSampleClick
  end
  object IWText1: TIWText
    AlignWithMargins = False
    Left = 421
    Top = 137
    Width = 275
    Height = 165
    BGColor = clNone
    ConvertSpaces = True
    Font.Color = clWebDARKSLATEGRAY
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'IWText1'
    Lines.Strings = (
      
        'All geographic coordinates should be relative to the WGS84 datum' +
        ' and spheroid.'
      ''
      ' 1 second = 0.00028 decimal degrees'
      ' 5 seconds = 0.00139 decimal degrees'
      '30 seconds = 0.00833 decimal degrees'
      ' 1 minute = 0.01667 decimal degrees'
      ' 5 minutes = 0.08333 decimal degrees'
      ' 1 degree = 1.00000 decimal degree'
      ''
      'Elevation is in metres amsl')
    RawText = False
    UseFrame = False
    WantReturns = True
  end
  object IWLabel10: TIWLabel
    AlignWithMargins = False
    Left = 36
    Top = 376
    Width = 48
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Latitude'
  end
  object IWLabel11: TIWLabel
    AlignWithMargins = False
    Left = 36
    Top = 402
    Width = 60
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Longitude'
  end
  object IWHRule1: TIWHRule
    AlignWithMargins = False
    Left = 3
    Top = 316
    Width = 683
    Height = 2
    FriendlyName = 'IWHRule1'
    BorderColor = clWebBLACK
  end
  object iwbConvert: TIWButton
    AlignWithMargins = False
    Left = 187
    Top = 324
    Width = 267
    Height = 25
    Caption = 'Convert to decimal degrees and insert'
    Color = clBtnFace
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbConvert'
    TabOrder = 22
    OnClick = iwbConvertClick
  end
  object eLatDeg: TIWEdit
    AlignWithMargins = False
    Left = 108
    Top = 370
    Width = 63
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'eLatDeg'
    SubmitOnAsyncEvent = True
    TabOrder = 13
  end
  object IWLabel12: TIWLabel
    AlignWithMargins = False
    Left = 106
    Top = 352
    Width = 49
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsItalic]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'degrees'
  end
  object eLonDeg: TIWEdit
    AlignWithMargins = False
    Left = 108
    Top = 396
    Width = 63
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 17
  end
  object IWLabel13: TIWLabel
    AlignWithMargins = False
    Left = 196
    Top = 352
    Width = 48
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsItalic]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'minutes'
  end
  object eLatMin: TIWEdit
    AlignWithMargins = False
    Left = 198
    Top = 370
    Width = 63
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 14
  end
  object eLonMin: TIWEdit
    AlignWithMargins = False
    Left = 198
    Top = 396
    Width = 63
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 18
  end
  object IWLabel14: TIWLabel
    AlignWithMargins = False
    Left = 286
    Top = 352
    Width = 50
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsItalic]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'seconds'
  end
  object eLatSec: TIWEdit
    AlignWithMargins = False
    Left = 288
    Top = 370
    Width = 63
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 15
  end
  object eLonSec: TIWEdit
    AlignWithMargins = False
    Left = 288
    Top = 396
    Width = 63
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 19
  end
  object iwcbLat: TIWComboBox
    AlignWithMargins = False
    Left = 374
    Top = 370
    Width = 53
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NonEditableAsLabel = True
    TabOrder = 16
    ItemIndex = -1
    Items.Strings = (
      'N'
      'S')
    FriendlyName = 'iwcbLat'
  end
  object iwcbLon: TIWComboBox
    AlignWithMargins = False
    Left = 374
    Top = 394
    Width = 53
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NonEditableAsLabel = True
    TabOrder = 20
    ItemIndex = -1
    Items.Strings = (
      'E'
      'W')
    FriendlyName = 'IWComboBox1'
  end
  object iwbEdit: TIWButton
    AlignWithMargins = False
    Left = 148
    Top = 74
    Width = 130
    Height = 25
    Caption = 'Edit'
    Color = clWebLEMONCHIFFON
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbEdit'
    TabOrder = 33
    OnClick = iwbEditClick
  end
  object IWLabel15: TIWLabel
    AlignWithMargins = False
    Left = 352
    Top = 112
    Width = 69
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Original no.'
  end
  object iwDBeOriginal: TIWDBEdit
    AlignWithMargins = False
    Left = 421
    Top = 110
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'iwDBeOriginal'
    SubmitOnAsyncEvent = True
    TabOrder = 4
    AutoEditable = True
    DataField = 'ORIGINALNO'
    DataSource = dmDV.dsSmpLoc
    PasswordPrompt = False
  end
  object iwbCopySampleNo: TIWButton
    AlignWithMargins = False
    Left = 256
    Top = 108
    Width = 75
    Height = 25
    Caption = 'Copy to >>>'
    Color = clBtnFace
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbCopySampleNo'
    TabOrder = 2
    OnClick = iwbCopySampleNoClick
  end
  object iwcbPrecision: TIWComboBox
    AlignWithMargins = False
    Left = 480
    Top = 382
    Width = 193
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NonEditableAsLabel = True
    TabOrder = 21
    ItemIndex = -1
    Items.Strings = (
      '1 m'
      '5 m'
      '10 m'
      '50 m'
      '100 m'
      '500 m'
      '1000 m'
      '5000 m'
      '25000 m')
    FriendlyName = 'iwcbPrecision'
  end
  object IWLabel16: TIWLabel
    AlignWithMargins = False
    Left = 500
    Top = 360
    Width = 167
    Height = 17
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel16'
    Caption = 'Locality Precision Estimate'
  end
  object IWLabel17: TIWLabel
    AlignWithMargins = False
    Left = 108
    Top = 432
    Width = 328
    Height = 15
    Alignment = taCenter
    Font.Color = clWebFIREBRICK
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel17'
    Caption = 'Geographic coordinates must be relative to WGS84 datum'
  end
  object IWHRule2: TIWHRule
    AlignWithMargins = False
    Left = 3
    Top = 468
    Width = 683
    Height = 2
    FriendlyName = 'IWHRule1'
    BorderColor = clWebBLACK
  end
  object iwbUTM2DD: TIWButton
    AlignWithMargins = False
    Left = 187
    Top = 476
    Width = 267
    Height = 25
    Caption = 'Convert to decimal degrees and insert'
    Color = clBtnFace
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbConvert'
    TabOrder = 28
    OnClick = iwbUTM2DDClick
  end
  object IWLabel18: TIWLabel
    AlignWithMargins = False
    Left = 36
    Top = 528
    Width = 27
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'UTM'
  end
  object IWLabel19: TIWLabel
    AlignWithMargins = False
    Left = 106
    Top = 504
    Width = 30
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsItalic]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Zone'
  end
  object eUTMZone: TIWEdit
    AlignWithMargins = False
    Left = 108
    Top = 522
    Width = 47
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'eLatDeg'
    SubmitOnAsyncEvent = True
    TabOrder = 23
  end
  object IWLabel20: TIWLabel
    AlignWithMargins = False
    Left = 272
    Top = 504
    Width = 51
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsItalic]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Northing'
  end
  object eUTMnorthing: TIWEdit
    AlignWithMargins = False
    Left = 272
    Top = 522
    Width = 76
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 25
  end
  object iwcbUTMHemisphere: TIWComboBox
    AlignWithMargins = False
    Left = 177
    Top = 522
    Width = 53
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NonEditableAsLabel = True
    TabOrder = 24
    ItemIndex = -1
    Items.Strings = (
      'N'
      'S')
    FriendlyName = 'iwcbLat'
  end
  object iwcbUTMPrecision: TIWComboBox
    AlignWithMargins = False
    Left = 480
    Top = 522
    Width = 193
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NonEditableAsLabel = True
    TabOrder = 27
    ItemIndex = -1
    Items.Strings = (
      '1 m'
      '5 m'
      '10 m'
      '50 m'
      '100 m'
      '500 m'
      '1000 m'
      '5000 m'
      '25000 m')
    FriendlyName = 'iwcbPrecision'
  end
  object eUTMeasting: TIWEdit
    AlignWithMargins = False
    Left = 354
    Top = 522
    Width = 82
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 26
  end
  object IWLabel22: TIWLabel
    AlignWithMargins = False
    Left = 354
    Top = 504
    Width = 45
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsItalic]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Easting'
  end
  object IWLabel23: TIWLabel
    AlignWithMargins = False
    Left = 495
    Top = 503
    Width = 167
    Height = 17
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel16'
    Caption = 'Locality Precision Estimate'
  end
  object IWLabel21: TIWLabel
    AlignWithMargins = False
    Left = 32
    Top = 281
    Width = 53
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Lithology'
  end
  object iwdblcbLithology: TIWDBLookupComboBox
    AlignWithMargins = False
    Left = 117
    Top = 279
    Width = 279
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    Required = True
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 35
    AutoEditable = True
    DataField = 'LITHOLOGY'
    DataSource = dmDV.dsSmpLoc
    FriendlyName = 'iwdblcbLithology'
    KeyField = 'LITHOLOGY'
    ListField = 'LITHOLOGY'
    ListSource = dmDV.dsLithol
    DisableWhenEmpty = True
  end
  object IWLabel24: TIWLabel
    AlignWithMargins = False
    Left = 586
    Top = 112
    Width = 31
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'IGSN'
  end
  object IWDBEdit1: TIWDBEdit
    AlignWithMargins = False
    Left = 637
    Top = 110
    Width = 216
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'iwDBeOriginal'
    MaxLength = 50
    SubmitOnAsyncEvent = True
    TabOrder = 3
    AutoEditable = True
    DataField = 'IGSN'
    DataSource = dmDV.dsSmpLoc
    PasswordPrompt = False
  end
  object iwbSwopLatitudeLongitude: TIWButton
    AlignWithMargins = False
    Left = 723
    Top = 187
    Width = 174
    Height = 30
    Caption = 'Swop Latitude-Longitude'
    Color = clBtnFace
    FriendlyName = 'iwbSwopLatitudeLongitude'
    OnClick = iwbSwopLatitudeLongitudeClick
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 907
    Height = 55
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alTop
    Constraints.MaxHeight = 55
    Constraints.MinHeight = 55
    Constraints.MinWidth = 600
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    TabStop = True
    ExplicitWidth = 907
    inherited IWFrameRegion: TIWRegion
      Width = 907
      TabOrder = 34
      ExplicitWidth = 907
      inherited iwrHeader: TIWRegion
        Width = 907
        ExplicitWidth = 907
        inherited iwrWelcome: TIWRegion
          Width = 907
          ExplicitWidth = 907
          inherited iwrDisplayUserName: TIWRegion
            Width = 766
            ExplicitWidth = 766
            inherited lblWelcome: TIWLabel
              Left = 445
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 907
          ExplicitWidth = 907
        end
      end
    end
  end
end
