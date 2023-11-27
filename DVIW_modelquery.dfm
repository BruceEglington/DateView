object ISFModelQuery: TISFModelQuery
  Left = 0
  Top = 0
  Width = 727
  Height = 212
  RenderInvisibleControls = True
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
  object iwbSubmit: TIWButton
    Left = 210
    Top = 170
    Width = 75
    Height = 25
    Caption = 'Submit'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmit'
    OnClick = iwbSubmitClick
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 157
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
  object iwcbIsoSystem: TIWComboBox
    Left = 92
    Top = 113
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 1
    ItemIndex = -1
    FriendlyName = 'iwcbIsoSystem'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel4: TIWLabel
    Left = 94
    Top = 87
    Width = 96
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Isotope System'
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 727
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
    ExplicitWidth = 727
    inherited IWFrameRegion: TIWRegion
      Width = 727
      TabOrder = 2
      ExplicitWidth = 727
      inherited iwrHeader: TIWRegion
        Width = 727
        ExplicitWidth = 727
        inherited iwrWelcome: TIWRegion
          Width = 727
          ExplicitWidth = 727
          inherited iwrDisplayUserName: TIWRegion
            Width = 586
            ExplicitWidth = 586
            inherited lblWelcome: TIWLabel
              Left = 265
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 727
          ExplicitWidth = 727
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
