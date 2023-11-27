object ISFDefineSQL: TISFDefineSQL
  Left = 0
  Top = 0
  Width = 930
  Height = 700
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'Define SQL query'
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
    Left = 102
    Top = 70
    Width = 105
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
    Height = 645
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
    ExplicitHeight = 294
  end
  object iwlblError: TIWLabel
    Left = 424
    Top = 70
    Width = 235
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'iwlblError'
    Caption = 'No items selected or box not checked'
  end
  object iwbCancel: TIWButton
    Left = 256
    Top = 70
    Width = 105
    Height = 25
    Caption = 'Cancel'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancel'
    TabOrder = 1
    OnClick = iwbCancelClick
  end
  object IWMemo1: TIWMemo
    Left = 102
    Top = 156
    Width = 700
    Height = 441
    StyleRenderOptions.RenderBorder = False
    BGColor = clNone
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 9
    Font.Style = []
    InvisibleBorder = False
    HorizScrollBar = True
    VertScrollBar = True
    Required = False
    TabOrder = 2
    SubmitOnAsyncEvent = True
    FriendlyName = 'IWMemo1'
  end
  object iwcbGoDirectToGraphs: TIWCheckBox
    Left = 102
    Top = 120
    Width = 353
    Height = 21
    Cursor = crAuto
    Caption = 'Do not show data records.  Go direct to graph selection'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 3
    Checked = False
    FriendlyName = 'iwcbGoDirectToGraphs'
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 930
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
    ExplicitWidth = 930
    inherited IWFrameRegion: TIWRegion
      Width = 930
      TabOrder = 4
      ExplicitWidth = 930
      inherited iwrHeader: TIWRegion
        Width = 930
        ExplicitWidth = 930
        inherited iwrWelcome: TIWRegion
          Width = 930
          ExplicitWidth = 930
          inherited iwrDisplayUserName: TIWRegion
            Width = 789
            ExplicitWidth = 789
            inherited lblWelcome: TIWLabel
              Left = 468
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 930
          ExplicitWidth = 930
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
