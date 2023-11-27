object ISFSampleGeoEdit: TISFSampleGeoEdit
  Left = 0
  Top = 0
  Width = 716
  Height = 350
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
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object IWDBEdit1: TIWDBEdit
    Left = 117
    Top = 110
    Width = 121
    Height = 21
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 0
    AutoEditable = True
    DataField = 'SAMPLENO'
    PasswordPrompt = False
    DataSource = dmDV.dsSmpLoc
  end
  object iwdblcbContinent: TIWDBLookupComboBox
    Left = 117
    Top = 140
    Width = 279
    Height = 21
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Required = True
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 1
    AutoEditable = True
    DataField = 'CONTINENTID'
    DataSource = dmDV.dsSmpLoc
    FriendlyName = 'iwdblcbContinent'
    KeyField = 'CONTINENTID'
    ListField = 'CONTINENT'
    ListSource = dmDV.dsContinents
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwbReturn: TIWButton
    Left = 5
    Top = 74
    Width = 92
    Height = 25
    Caption = 'Return'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    TabOrder = 9
    OnClick = iwbReturnClick
  end
  object IWLabel1: TIWLabel
    Left = 32
    Top = 112
    Width = 69
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Sample no.'
  end
  object IWLabel2: TIWLabel
    Left = 32
    Top = 142
    Width = 58
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Continent'
  end
  object IWLabel3: TIWLabel
    Left = 32
    Top = 170
    Width = 27
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Area'
  end
  object IWLabel4: TIWLabel
    Left = 32
    Top = 202
    Width = 48
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Latitude'
  end
  object IWLabel5: TIWLabel
    Left = 32
    Top = 228
    Width = 60
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Longitude'
  end
  object IWLabel6: TIWLabel
    Left = 32
    Top = 254
    Width = 79
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Elevation (m)'
  end
  object IWLabel7: TIWLabel
    Left = 225
    Top = 202
    Width = 57
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Precision'
  end
  object IWLabel8: TIWLabel
    Left = 225
    Top = 230
    Width = 57
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Precision'
  end
  object IWLabel9: TIWLabel
    Left = 225
    Top = 256
    Width = 57
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Precision'
  end
  object IWDBEdit2: TIWDBEdit
    Left = 117
    Top = 198
    Width = 78
    Height = 21
    Alignment = taRightJustify
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    ReadOnly = True
    SubmitOnAsyncEvent = True
    TabOrder = 3
    AutoEditable = True
    DataField = 'LATITUDE'
    PasswordPrompt = False
    DataSource = dmDV.dsSmpLoc
  end
  object IWDBEdit3: TIWDBEdit
    Left = 117
    Top = 226
    Width = 78
    Height = 21
    Alignment = taRightJustify
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    ReadOnly = True
    SubmitOnAsyncEvent = True
    TabOrder = 4
    AutoEditable = True
    DataField = 'LONGITUDE'
    PasswordPrompt = False
    DataSource = dmDV.dsSmpLoc
  end
  object IWDBEdit4: TIWDBEdit
    Left = 117
    Top = 252
    Width = 78
    Height = 21
    Alignment = taRightJustify
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    ReadOnly = True
    SubmitOnAsyncEvent = True
    TabOrder = 5
    AutoEditable = True
    DataField = 'ELEVATION'
    PasswordPrompt = False
    DataSource = dmDV.dsSmpLoc
  end
  object IWDBEdit5: TIWDBEdit
    Left = 297
    Top = 200
    Width = 78
    Height = 21
    Alignment = taRightJustify
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    ReadOnly = True
    SubmitOnAsyncEvent = True
    TabOrder = 6
    AutoEditable = True
    DataField = 'LATITUDEPRECISION'
    PasswordPrompt = False
    DataSource = dmDV.dsSmpLoc
  end
  object IWDBEdit6: TIWDBEdit
    Left = 297
    Top = 226
    Width = 78
    Height = 21
    Alignment = taRightJustify
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    ReadOnly = True
    SubmitOnAsyncEvent = True
    TabOrder = 7
    AutoEditable = True
    DataField = 'LONGITUDEPRECISION'
    PasswordPrompt = False
    DataSource = dmDV.dsSmpLoc
  end
  object IWDBEdit7: TIWDBEdit
    Left = 297
    Top = 252
    Width = 78
    Height = 21
    Alignment = taRightJustify
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    ReadOnly = True
    SubmitOnAsyncEvent = True
    TabOrder = 8
    AutoEditable = True
    DataField = 'ELEVATIONPRECISION'
    PasswordPrompt = False
    DataSource = dmDV.dsSmpLoc
  end
  object iwdblcbCountry: TIWDBLookupComboBox
    Left = 117
    Top = 168
    Width = 279
    Height = 21
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Required = True
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 2
    AutoEditable = True
    DataField = 'COUNTRYABR'
    DataSource = dmDV.dsSmpLoc
    FriendlyName = 'iwdblcbCountry'
    KeyField = 'COUNTRYABR'
    ListField = 'COUNTRY'
    ListSource = dmDV.dsCountries
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwbSaveChanges: TIWButton
    Left = 290
    Top = 74
    Width = 92
    Height = 25
    Caption = 'Save changes'
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 10
    OnClick = iwbSaveChangesClick
  end
  object iwbCancelChanges: TIWButton
    Left = 433
    Top = 74
    Width = 92
    Height = 25
    Caption = 'Cancel changes'
    Color = clWebLIGHTSTEELBLUE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 11
    OnClick = iwbCancelChangesClick
  end
  object iwbDeleteSample: TIWButton
    Left = 576
    Top = 73
    Width = 92
    Height = 25
    Caption = 'Delete sample'
    Confirmation = 'Are you sure you want to delete this sample?'
    Color = clWebLIGHTCORAL
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDeleteSample'
    TabOrder = 12
    OnClick = iwbDeleteSampleClick
  end
  object iwbEdit: TIWButton
    Left = 147
    Top = 74
    Width = 92
    Height = 25
    Caption = 'Edit'
    Color = clWebLEMONCHIFFON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbEdit'
    TabOrder = 13
    OnClick = iwbEditClick
  end
  object iwbCopySampleNo: TIWButton
    Left = 252
    Top = 108
    Width = 85
    Height = 25
    Caption = 'Copy to >>>'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCopySampleNo'
    TabOrder = 14
    OnClick = iwbCopySampleNoClick
  end
  object IWLabel15: TIWLabel
    Left = 352
    Top = 112
    Width = 69
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Original no.'
  end
  object IWDBEdit8: TIWDBEdit
    Left = 421
    Top = 110
    Width = 121
    Height = 21
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 15
    AutoEditable = True
    DataField = 'ORIGINALNO'
    PasswordPrompt = False
    DataSource = dmDV.dsSmpLoc
  end
  object IWText1: TIWText
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
  object IWLabel21: TIWLabel
    Left = 32
    Top = 281
    Width = 53
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Lithology'
  end
  object iwdblcbLithology: TIWDBLookupComboBox
    Left = 117
    Top = 279
    Width = 279
    Height = 21
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Required = True
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 17
    AutoEditable = True
    DataField = 'LITHOLOGY'
    DataSource = dmDV.dsSmpLoc
    FriendlyName = 'iwdblcbLithology'
    KeyField = 'LITHOLOGY'
    ListField = 'LITHOLOGY'
    ListSource = dmDV.dsLithol
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 716
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
    ExplicitWidth = 716
    inherited IWFrameRegion: TIWRegion
      Width = 716
      TabOrder = 16
      ExplicitWidth = 716
      inherited iwrHeader: TIWRegion
        Width = 716
        ExplicitWidth = 716
        inherited iwrWelcome: TIWRegion
          Width = 716
          ExplicitWidth = 716
          inherited iwrDisplayUserName: TIWRegion
            Width = 575
            ExplicitWidth = 575
            inherited lblWelcome: TIWLabel
              Left = 254
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 716
          ExplicitWidth = 716
        end
      end
    end
  end
end
