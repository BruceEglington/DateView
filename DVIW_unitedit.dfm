object ISFUnitEdit: TISFUnitEdit
  Left = 0
  Top = 0
  Width = 716
  Height = 412
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'Edit Unit Details'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
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
      TabOrder = 13
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
  object iwrUnitArea: TIWRegion
    Left = 0
    Top = 318
    Width = 716
    Height = 75
    RenderInvisibleControls = False
    Align = alTop
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object IWLabel3: TIWLabel
      Left = 32
      Top = 25
      Width = 27
      Height = 15
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      NoWrap = True
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'Area'
    end
    object iwDBlcbArea: TIWDBLookupComboBox
      Left = 117
      Top = 19
      Width = 372
      Height = 21
      StyleRenderOptions.RenderBorder = False
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = [fsBold]
      RequireSelection = False
      NonEditableAsLabel = True
      AutoEditable = False
      FriendlyName = 'iwDBlcbArea'
      KeyField = 'COUNTRYABR'
      ListField = 'COUNTRY'
      ListSource = dmDV.dsCountries
      DisableWhenEmpty = True
      NoSelectionText = '-- No Selection --'
    end
  end
  object iwrUnitDetails: TIWRegion
    Left = 0
    Top = 112
    Width = 716
    Height = 206
    RenderInvisibleControls = False
    Align = alTop
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object IWLabel1: TIWLabel
      Left = 32
      Top = 16
      Width = 58
      Height = 15
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      NoWrap = True
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'Strat. Unit'
    end
    object iwDBeUnitName: TIWDBEdit
      Left = 117
      Top = 14
      Width = 370
      Height = 21
      StyleRenderOptions.RenderBorder = False
      Editable = False
      NonEditableAsLabel = True
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = [fsBold]
      FriendlyName = 'iwDBeUnitName'
      SubmitOnAsyncEvent = True
      TabOrder = 1
      AutoEditable = True
      DataField = 'UNITNAME'
      DataSource = dmDV.dsThisUnit
      PasswordPrompt = False
    end
    object IWLabel2: TIWLabel
      Left = 32
      Top = 42
      Width = 31
      Height = 15
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      NoWrap = True
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'Rank'
    end
    object iwDBlcbUnitRank: TIWDBLookupComboBox
      Left = 117
      Top = 40
      Width = 372
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
      DataField = 'UNITRANK'
      DataSource = dmDV.dsThisUnit
      FriendlyName = 'iwDBlcbUnitRank'
      KeyField = 'UNITRANKID'
      ListField = 'UNITRANK'
      ListSource = dmDV.dsUnitRanks
      DisableWhenEmpty = True
      NoSelectionText = '-- No Selection --'
    end
    object IWLabel4: TIWLabel
      Left = 32
      Top = 70
      Width = 46
      Height = 15
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      NoWrap = True
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'Offset 1'
    end
    object IWLabel5: TIWLabel
      Left = 32
      Top = 96
      Width = 46
      Height = 15
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      NoWrap = True
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'Offset 2'
    end
    object IWLabel6: TIWLabel
      Left = 32
      Top = 122
      Width = 46
      Height = 15
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      NoWrap = True
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'Offset 3'
    end
    object IWLabel7: TIWLabel
      Left = 33
      Top = 150
      Width = 62
      Height = 15
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      NoWrap = True
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'StratDB ID'
    end
    object iwdbeStratDBID: TIWDBEdit
      Left = 117
      Top = 148
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
      FriendlyName = 'iwdbeStratDBID'
      SubmitOnAsyncEvent = True
      TabOrder = 3
      AutoEditable = True
      DataField = 'GISID'
      DataSource = dmDV.dsThisUnit
      PasswordPrompt = False
    end
    object iwdbeOffset3: TIWDBEdit
      Left = 117
      Top = 122
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
      FriendlyName = 'iwdbeOffset3'
      SubmitOnAsyncEvent = True
      TabOrder = 4
      AutoEditable = True
      DataField = 'FORMATIONOFFSET3'
      DataSource = dmDV.dsThisUnit
      PasswordPrompt = False
    end
    object iwdbeOffset2: TIWDBEdit
      Left = 117
      Top = 96
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
      FriendlyName = 'iwdbeOffset2'
      SubmitOnAsyncEvent = True
      TabOrder = 5
      AutoEditable = True
      DataField = 'FORMATIONOFFSET2'
      DataSource = dmDV.dsThisUnit
      PasswordPrompt = False
    end
    object iwdbeOffset1: TIWDBEdit
      Left = 117
      Top = 68
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
      FriendlyName = 'iwdbeOffset1'
      SubmitOnAsyncEvent = True
      TabOrder = 6
      AutoEditable = True
      DataField = 'FORMATIONOFFSET'
      DataSource = dmDV.dsThisUnit
      PasswordPrompt = False
    end
    object IWLabel8: TIWLabel
      Left = 553
      Top = 20
      Width = 40
      Height = 15
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      NoWrap = True
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'Unit ID'
    end
    object iwdbeUnitID: TIWDBEdit
      Left = 607
      Top = 16
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
      FriendlyName = 'iwdbeUnitID'
      SubmitOnAsyncEvent = True
      TabOrder = 7
      AutoEditable = False
      DataField = 'UNITID'
      DataSource = dmDV.dsThisUnit
      PasswordPrompt = False
    end
    object IWDBEdit1: TIWDBEdit
      Left = 607
      Top = 43
      Width = 78
      Height = 21
      StyleRenderOptions.RenderBorder = False
      Editable = False
      NonEditableAsLabel = True
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = [fsBold]
      FriendlyName = 'iwdbeUnitID'
      SubmitOnAsyncEvent = True
      TabOrder = 8
      AutoEditable = False
      DataField = 'UNITRANK'
      DataSource = dmDV.dsThisUnit
      PasswordPrompt = False
    end
  end
  object iwrButtonsTop: TIWRegion
    Left = 0
    Top = 55
    Width = 716
    Height = 57
    RenderInvisibleControls = False
    Align = alTop
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwbReturn: TIWButton
      Left = 5
      Top = 7
      Width = 96
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
    object iwbEdit: TIWButton
      Left = 121
      Top = 7
      Width = 96
      Height = 25
      Caption = 'Edit'
      Color = clWebLEMONCHIFFON
      Font.Color = clNone
      Font.Size = 9
      Font.Style = []
      FriendlyName = 'iwbEdit'
      TabOrder = 10
      OnClick = iwbEditClick
    end
    object IWDBNavigator1: TIWDBNavigator
      Left = 232
      Top = 3
      Width = 108
      Height = 29
      Confirmations.Delete = 'Are you sure you want to delete this record?'
      Confirmations.Post = 'Are you sure you want to update this record?'
      Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
      DataSource = dmDV.dsUnits
      FriendlyName = 'IWDBNavigator1'
      ImageHeight = 21
      ImageWidth = 21
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Orientation = orHorizontal
    end
    object iwbSaveChanges: TIWButton
      Left = 354
      Top = 7
      Width = 96
      Height = 25
      Caption = 'Save changes'
      Color = clWebPEACHPUFF
      Font.Color = clNone
      Font.Size = 9
      Font.Style = []
      FriendlyName = 'iwbSaveChanges'
      TabOrder = 11
      OnClick = iwbSaveChangesClick
    end
    object iwbCancelChanges: TIWButton
      Left = 471
      Top = 7
      Width = 96
      Height = 25
      Caption = 'Cancel changes'
      Color = clWebLIGHTSTEELBLUE
      Font.Color = clNone
      Font.Size = 9
      Font.Style = []
      FriendlyName = 'iwbSaveChanges'
      TabOrder = 12
      OnClick = iwbCancelChangesClick
    end
    object iwbDelete: TIWButton
      Left = 588
      Top = 7
      Width = 96
      Height = 25
      Caption = 'Delete'
      Confirmation = 'Are you sure you want to delete this unit?'
      Color = clWebLIGHTCORAL
      Font.Color = clNone
      Font.Size = 9
      Font.Style = []
      FriendlyName = 'iwbDelete'
      TabOrder = 14
      OnClick = iwbDeleteClick
    end
  end
end
