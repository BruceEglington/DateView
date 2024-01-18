object ISFSelectCalculations: TISFSelectCalculations
  Left = 0
  Top = 0
  Width = 701
  Height = 235
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
  object iwrgCalculationType: TIWRadioGroup
    Left = 112
    Top = 100
    Width = 283
    Height = 69
    SubmitOnAsyncEvent = True
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwrgCalculationType'
    ItemIndex = 0
    Items.Strings = (
      'Weighted Average'
      'Palaeo-reconstruction')
    Layout = glVertical
    TabOrder = -1
  end
  object IWLabel1: TIWLabel
    Left = 92
    Top = 76
    Width = 198
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Choose the calculation required'
  end
  object iwbSubmitCalculationSelection: TIWButton
    Left = 222
    Top = 178
    Width = 75
    Height = 25
    Caption = 'Submit'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitCalculationSelection'
    TabOrder = 0
    OnClick = iwbSubmitCalculationSelectionClick
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 180
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
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 701
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
    ExplicitLeft = -271
    ExplicitWidth = 972
    inherited IWFrameRegion: TIWRegion
      Width = 701
      TabOrder = 1
      ExplicitWidth = 972
      inherited iwrHeader: TIWRegion
        Width = 701
        ExplicitWidth = 972
        inherited iwrWelcome: TIWRegion
          Width = 701
          ExplicitWidth = 972
          inherited iwrDisplayUserName: TIWRegion
            Width = 560
            ExplicitWidth = 831
            inherited lblWelcome: TIWLabel
              Left = 239
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 701
          ExplicitWidth = 972
        end
      end
    end
  end
end
