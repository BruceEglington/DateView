object ISFClosureDetailEdit: TISFClosureDetailEdit
  Left = 0
  Top = 0
  Width = 716
  Height = 317
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
    Left = 229
    Top = 70
    Width = 108
    Height = 29
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmDV.dsClosureTemperatures
    FriendlyName = 'IWDBNavigator1'
    ImageHeight = 21
    ImageWidth = 21
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Orientation = orHorizontal
  end
  object iwDBlcbIsoSystem: TIWDBLookupComboBox
    AlignWithMargins = False
    Left = 117
    Top = 138
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
    DataField = 'ISOSYSTEM'
    DataSource = dmDV.dsClosureTemperatures
    FriendlyName = 'iwDBlcbIsoSystem'
    KeyField = 'ISOSYSTEM'
    ListField = 'ISOSYSTEMNAME'
    ListSource = dmDV.dsIsoSystems
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwbReturn: TIWButton
    AlignWithMargins = False
    Left = 5
    Top = 74
    Width = 98
    Height = 25
    Caption = 'Return'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbReturn'
    TabOrder = 7
    OnClick = iwbReturnClick
  end
  object IWLabel1: TIWLabel
    AlignWithMargins = False
    Left = 32
    Top = 112
    Width = 47
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Material'
  end
  object IWLabel2: TIWLabel
    AlignWithMargins = False
    Left = 34
    Top = 140
    Width = 70
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Iso. System'
  end
  object IWLabel3: TIWLabel
    AlignWithMargins = False
    Left = 32
    Top = 168
    Width = 57
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Approach'
  end
  object IWLabel4: TIWLabel
    AlignWithMargins = False
    Left = 32
    Top = 196
    Width = 151
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Closure Temperature (C)'
  end
  object IWLabel5: TIWLabel
    AlignWithMargins = False
    Left = 32
    Top = 224
    Width = 168
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Temperature uncertainty (C)'
  end
  object iwDBeBlockingT: TIWDBEdit
    AlignWithMargins = False
    Left = 209
    Top = 196
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
    TabOrder = 1
    AutoEditable = True
    DataField = 'BLOCKINGT'
    DataSource = dmDV.dsClosureTemperatures
    PasswordPrompt = False
  end
  object iwDBeBlockingTUncertainty: TIWDBEdit
    AlignWithMargins = False
    Left = 209
    Top = 224
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
    TabOrder = 2
    AutoEditable = True
    DataField = 'BLOCKINGTUNCERTAINTY'
    DataSource = dmDV.dsClosureTemperatures
    PasswordPrompt = False
  end
  object iwDBlcbApproach: TIWDBLookupComboBox
    AlignWithMargins = False
    Left = 117
    Top = 166
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
    TabOrder = 4
    AutoEditable = True
    DataField = 'APPROACHABR'
    DataSource = dmDV.dsClosureTemperatures
    FriendlyName = 'iwDBlcbApproach'
    KeyField = 'APPROACHABR'
    ListField = 'APPROACHDESCRIPTION'
    ListSource = dmDV.dsApproach
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwbSaveChanges: TIWButton
    AlignWithMargins = False
    Left = 347
    Top = 74
    Width = 98
    Height = 25
    Caption = 'Save changes'
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 9
    OnClick = iwbSaveChangesClick
  end
  object iwbCancelChanges: TIWButton
    AlignWithMargins = False
    Left = 461
    Top = 74
    Width = 98
    Height = 25
    Caption = 'Cancel changes'
    Color = clWebLIGHTSTEELBLUE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 10
    OnClick = iwbCancelChangesClick
  end
  object iwbDelete: TIWButton
    AlignWithMargins = False
    Left = 576
    Top = 73
    Width = 98
    Height = 25
    Caption = 'Delete link'
    Confirmation = 'Are you sure you want to delete this sample?'
    Color = clWebLIGHTCORAL
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbDelete'
    TabOrder = 8
    OnClick = iwbDeleteClick
  end
  object iwDBlcbMaterial: TIWDBLookupComboBox
    AlignWithMargins = False
    Left = 117
    Top = 110
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
    DataField = 'MATERIALABR'
    DataSource = dmDV.dsClosureTemperatures
    FriendlyName = 'iwDBlcbMaterial'
    KeyField = 'MATERIALABR'
    ListField = 'MATERIALDESCRIPTION'
    ListSource = dmDV.dsMaterial
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwbEdit: TIWButton
    AlignWithMargins = False
    Left = 119
    Top = 74
    Width = 98
    Height = 25
    Caption = 'Edit'
    Color = clWebLEMONCHIFFON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    FriendlyName = 'iwbEdit'
    TabOrder = 11
    OnClick = iwbEditClick
  end
  object IWLabel6: TIWLabel
    AlignWithMargins = False
    Left = 34
    Top = 253
    Width = 70
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Association'
  end
  object iwDBlcbAssociation: TIWDBLookupComboBox
    AlignWithMargins = False
    Left = 119
    Top = 251
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
    TabOrder = 3
    AutoEditable = True
    DataField = 'CLOSTMPASSOCID'
    DataSource = dmDV.dsClosureTemperatures
    FriendlyName = 'iwDBlcbAssociation'
    KeyField = 'CLOSTMPASSOCID'
    ListField = 'CLOSTMPASSOCID'
    ListSource = dmDV.dsClosTmpAssoc
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
      TabOrder = 12
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
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
