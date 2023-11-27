object ISFValidCheck: TISFValidCheck
  Left = 0
  Top = 0
  Width = 800
  Height = 545
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
  object IWDBEdit1: TIWDBEdit
    Left = 242
    Top = 108
    Width = 73
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    SubmitOnAsyncEvent = True
    AutoEditable = False
    DataField = 'RECORDID'
    DataSource = dmDV.dsIsoValid2
    PasswordPrompt = False
  end
  object IWDBEdit2: TIWDBEdit
    Left = 242
    Top = 134
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit2'
    SubmitOnAsyncEvent = True
    TabOrder = 1
    AutoEditable = False
    DataField = 'VALIDSTATUSID'
    DataSource = dmDV.dsIsoValid2
    PasswordPrompt = False
  end
  object IWDBEdit4: TIWDBEdit
    Left = 242
    Top = 160
    Width = 153
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit4'
    SubmitOnAsyncEvent = True
    TabOrder = 2
    AutoEditable = False
    DataField = 'DONEBY'
    DataSource = dmDV.dsIsoValid2
    PasswordPrompt = False
  end
  object IWDBEdit5: TIWDBEdit
    Left = 242
    Top = 186
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit4'
    SubmitOnAsyncEvent = True
    TabOrder = 3
    AutoEditable = False
    DataField = 'DATEDONE'
    DataSource = dmDV.dsIsoValid2
    PasswordPrompt = False
  end
  object IWDBMemo1: TIWDBMemo
    Left = 104
    Top = 246
    Width = 565
    Height = 278
    StyleRenderOptions.RenderBorder = False
    BGColor = clWebWHITE
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 9
    Font.Style = []
    InvisibleBorder = False
    HorizScrollBar = False
    VertScrollBar = True
    Required = False
    TabOrder = 4
    SubmitOnAsyncEvent = True
    AutoEditable = False
    DataField = 'COMMENTS'
    DataSource = dmDV.dsIsoValid2
    FriendlyName = 'IWDBMemo1'
  end
  object iwbSaveReturn: TIWButton
    Left = 378
    Top = 76
    Width = 231
    Height = 25
    Caption = 'Save and return to Details Form'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSaveReturn'
    TabOrder = 5
    OnClick = iwbReturnClick
  end
  object IWLabel1: TIWLabel
    Left = 104
    Top = 110
    Width = 60
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Record ID'
  end
  object IWLabel2: TIWLabel
    Left = 104
    Top = 136
    Width = 101
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'Validation Status'
  end
  object IWLabel3: TIWLabel
    Left = 104
    Top = 162
    Width = 101
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'First objection by'
  end
  object IWLabel4: TIWLabel
    Left = 104
    Top = 188
    Width = 130
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel4'
    Caption = 'Date for this objection'
  end
  object IWLabel5: TIWLabel
    Left = 104
    Top = 224
    Width = 68
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel5'
    Caption = 'Comments'
  end
  object iwbCancelReturn: TIWButton
    Left = 98
    Top = 76
    Width = 223
    Height = 25
    Caption = 'Cancel and return to Details Form'
    Color = clWebLIGHTSTEELBLUE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancelReturn'
    TabOrder = 6
    OnClick = iwbReturnClick
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 490
    Align = alLeft
    ZIndex = 1
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
  end
  object iwbClearObjection: TIWButton
    Left = 662
    Top = 76
    Width = 119
    Height = 25
    Caption = 'Clear objection'
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbClearObjection'
    TabOrder = 7
    OnClick = iwbClearObjectionClick
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 800
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
    ExplicitWidth = 800
    inherited IWFrameRegion: TIWRegion
      Width = 800
      TabOrder = 8
      ExplicitWidth = 800
      inherited iwrHeader: TIWRegion
        Width = 800
        ExplicitWidth = 800
        inherited iwrWelcome: TIWRegion
          Width = 800
          ExplicitWidth = 800
          inherited iwrDisplayUserName: TIWRegion
            Width = 659
            ExplicitWidth = 659
            inherited lblWelcome: TIWLabel
              Left = 338
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 800
          ExplicitWidth = 800
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
