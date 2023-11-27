object ISFSmpRegEdit: TISFSmpRegEdit
  Left = 0
  Top = 0
  Width = 831
  Height = 401
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
    Left = 239
    Top = 72
    Width = 108
    Height = 29
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmDV.dsSmpReg
    FriendlyName = 'IWDBNavigator1'
    ImageHeight = 21
    ImageWidth = 21
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Orientation = orHorizontal
  end
  object iwDBlcbIncluded: TIWDBLookupComboBox
    Left = 117
    Top = 168
    Width = 279
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Required = True
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 2
    AutoEditable = True
    DataField = 'INCLUDED'
    DataSource = dmDV.dsSmpReg
    FriendlyName = 'iwDBlcbIncluded'
    KeyField = 'YESNOID'
    ListField = 'YESNO'
    ListSource = dmDV.dsYesNo
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwbReturn: TIWButton
    Left = 5
    Top = 74
    Width = 108
    Height = 25
    Caption = 'Return'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    TabOrder = 7
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
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Sample no.'
  end
  object IWLabel2: TIWLabel
    Left = 32
    Top = 170
    Width = 51
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Included'
  end
  object IWLabel3: TIWLabel
    Left = 32
    Top = 198
    Width = 70
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Iso. System'
  end
  object IWLabel4: TIWLabel
    Left = 32
    Top = 226
    Width = 48
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Latitude'
  end
  object IWLabel5: TIWLabel
    Left = 32
    Top = 254
    Width = 60
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Longitude'
  end
  object IWLabel6: TIWLabel
    Left = 32
    Top = 280
    Width = 79
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Elevation (m)'
  end
  object IWLabel7: TIWLabel
    Left = 225
    Top = 230
    Width = 57
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Precision'
  end
  object IWLabel8: TIWLabel
    Left = 223
    Top = 256
    Width = 57
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Precision'
  end
  object IWLabel9: TIWLabel
    Left = 225
    Top = 280
    Width = 57
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Precision'
  end
  object iwDBeLatitude: TIWDBEdit
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
    FriendlyName = 'IWDBEdit1'
    ReadOnly = True
    SubmitOnAsyncEvent = True
    TabOrder = 4
    AutoEditable = False
    DataField = 'LATITUDE'
    DataSource = dmDV.dsSmpReg
    PasswordPrompt = False
  end
  object iwDBeLongitude: TIWDBEdit
    Left = 117
    Top = 254
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
    FriendlyName = 'IWDBEdit1'
    ReadOnly = True
    SubmitOnAsyncEvent = True
    TabOrder = 5
    AutoEditable = False
    DataField = 'LONGITUDE'
    DataSource = dmDV.dsSmpReg
    PasswordPrompt = False
  end
  object iwDBeElevation: TIWDBEdit
    Left = 117
    Top = 280
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
    FriendlyName = 'IWDBEdit1'
    ReadOnly = True
    SubmitOnAsyncEvent = True
    TabOrder = 6
    AutoEditable = False
    DataField = 'ELEVATION'
    DataSource = dmDV.dsSmpReg
    PasswordPrompt = False
  end
  object iwDBeLatitudePrecision: TIWDBEdit
    Left = 297
    Top = 228
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
    FriendlyName = 'IWDBEdit1'
    ReadOnly = True
    SubmitOnAsyncEvent = True
    TabOrder = 8
    AutoEditable = False
    DataField = 'LATITUDEPRECISION'
    DataSource = dmDV.dsSmpReg
    PasswordPrompt = False
  end
  object iwDBeLongitudePrecision: TIWDBEdit
    Left = 297
    Top = 254
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
    FriendlyName = 'IWDBEdit1'
    ReadOnly = True
    SubmitOnAsyncEvent = True
    TabOrder = 9
    AutoEditable = False
    DataField = 'LONGITUDEPRECISION'
    DataSource = dmDV.dsSmpReg
    PasswordPrompt = False
  end
  object iwDBeElevationPrecision: TIWDBEdit
    Left = 297
    Top = 280
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
    FriendlyName = 'IWDBEdit1'
    ReadOnly = True
    SubmitOnAsyncEvent = True
    TabOrder = 10
    AutoEditable = False
    DataField = 'ELEVATIONPRECISION'
    DataSource = dmDV.dsSmpReg
    PasswordPrompt = False
  end
  object iwDBlcbIsoSystem: TIWDBLookupComboBox
    Left = 117
    Top = 196
    Width = 279
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Required = True
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 3
    AutoEditable = True
    DataField = 'ISOSYSTEM'
    DataSource = dmDV.dsSmpReg
    FriendlyName = 'IWDBLookupComboBox1'
    KeyField = 'ISOSYSTEM'
    ListField = 'ISOSYSTEMNAME'
    ListSource = dmDV.dsIsoSystems
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwbSaveChanges: TIWButton
    Left = 356
    Top = 74
    Width = 108
    Height = 25
    Caption = 'Save changes'
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 13
    OnClick = iwbSaveChangesClick
  end
  object iwbCancelChanges: TIWButton
    Left = 473
    Top = 74
    Width = 108
    Height = 25
    Caption = 'Cancel changes'
    Color = clWebLIGHTSTEELBLUE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancelChanges'
    TabOrder = 14
    OnClick = iwbCancelChangesClick
  end
  object iwbDeleteSample: TIWButton
    Left = 708
    Top = 73
    Width = 108
    Height = 25
    Caption = 'Delete link'
    Confirmation = 'Are you sure you want to delete this sample?'
    Color = clWebLIGHTCORAL
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDeleteSample'
    TabOrder = 11
    OnClick = iwbDeleteSampleClick
  end
  object iwDBlcbSample: TIWDBLookupComboBox
    Left = 117
    Top = 110
    Width = 279
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Required = True
    OnChange = iwDBlcbSampleChange
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 1
    AutoEditable = True
    DataField = 'SAMPLENO'
    DataSource = dmDV.dsSmpReg
    FriendlyName = 'iwDBlcbSample'
    KeyField = 'SAMPLENO'
    ListField = 'SAMPLENO'
    ListSource = dmDV.dsSamples
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel10: TIWLabel
    Left = 32
    Top = 140
    Width = 48
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Fraction'
  end
  object IWText1: TIWText
    Left = 422
    Top = 180
    Width = 339
    Height = 127
    BGColor = clNone
    ConvertSpaces = True
    Font.Color = clWebDARKSLATEGRAY
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWText1'
    Lines.Strings = (
      ' 1 second = 0.00028 decimal degrees'
      ' 5 seconds = 0.00139 decimal degrees'
      '30 seconds = 0.00833 decimal degrees'
      ' 1 minute = 0.01667 decimal degrees'
      ' 5 minutes = 0.08333 decimal degrees'
      ' 1 degree = 1.00000 decimal degree'
      ''
      'Elevation is in metres above mean sea level')
    RawText = False
    UseFrame = False
    WantReturns = True
  end
  object iwbAdd: TIWButton
    Left = 590
    Top = 73
    Width = 108
    Height = 25
    Caption = 'Link another smp'
    Color = clWebLIGHTSKYBLUE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbAdd'
    TabOrder = 12
    OnClick = iwbAddClick
  end
  object iwbEdit: TIWButton
    Left = 122
    Top = 74
    Width = 108
    Height = 25
    Caption = 'Edit'
    Color = clWebLEMONCHIFFON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbEdit'
    TabOrder = 15
    OnClick = iwbEditClick
  end
  object IWLabel11: TIWLabel
    Left = 432
    Top = 110
    Width = 118
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Original sample no.'
  end
  object iwDBeOriginalNo: TIWDBEdit
    Left = 553
    Top = 110
    Width = 140
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'iwDBeOriginalNo'
    SubmitOnAsyncEvent = True
    TabOrder = 16
    AutoEditable = False
    DataField = 'ORIGINALNO'
    DataSource = dmDV.dsSmpReg
    PasswordPrompt = False
  end
  object iwDBlcbFrac: TIWDBLookupComboBox
    Left = 117
    Top = 138
    Width = 279
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Required = True
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 17
    AutoEditable = True
    DataField = 'FRAC'
    DataSource = dmDV.dsSmpReg
    FriendlyName = 'iwDBlcbSample'
    KeyField = 'FRAC'
    ListField = 'FRAC'
    ListSource = dmDV.dsFracsForSample
    DisableWhenEmpty = True
    NoSelectionText = '--No Selection--'
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 831
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
    ExplicitWidth = 831
    inherited IWFrameRegion: TIWRegion
      Width = 831
      TabOrder = 18
      ExplicitWidth = 831
      inherited iwrHeader: TIWRegion
        Width = 831
        ExplicitWidth = 831
        inherited iwrWelcome: TIWRegion
          Width = 831
          ExplicitWidth = 831
          inherited iwrDisplayUserName: TIWRegion
            Width = 690
            ExplicitWidth = 690
            inherited lblWelcome: TIWLabel
              Left = 369
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 831
          ExplicitWidth = 831
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
