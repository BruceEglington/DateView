object ISFDataLookups: TISFDataLookups
  Left = 0
  Top = 0
  Width = 708
  Height = 495
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'Define query'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object rectLeft: TIWRectangle
    AlignWithMargins = False
    Left = 0
    Top = 55
    Width = 83
    Height = 440
    Align = alLeft
    ZIndex = 1
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    Font.PxSize = 13
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
  end
  object IWLabel3: TIWLabel
    AlignWithMargins = False
    Left = 100
    Top = 80
    Width = 385
    Height = 19
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 12
    Font.Style = [fsBold]
    Font.PxSize = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'Lookup tables used with raw data in DateView'
  end
  object iwlModels: TIWLink
    AlignWithMargins = False
    Left = 100
    Top = 116
    Width = 91
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    Font.PxSize = 12
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'iwlModels'
    OnClick = iwlModelsClick
    TabOrder = 1
    RawText = False
    Caption = 'Models'
  end
  object IWLabel16: TIWLabel
    AlignWithMargins = False
    Left = 252
    Top = 116
    Width = 262
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Isotope models and calculation parameters'
  end
  object iwlStandards: TIWLink
    AlignWithMargins = False
    Left = 100
    Top = 140
    Width = 91
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    Font.PxSize = 12
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'iwlStandards'
    OnClick = iwlStandardsClick
    RawText = False
    Caption = 'Standards'
  end
  object IWLabel1: TIWLabel
    AlignWithMargins = False
    Left = 252
    Top = 140
    Width = 240
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'List of standards used for normalisation'
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 708
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
    ExplicitLeft = -264
    ExplicitWidth = 972
    inherited IWFrameRegion: TIWRegion
      Width = 708
      TabOrder = 2
      ExplicitWidth = 972
      inherited iwrHeader: TIWRegion
        Width = 708
        ExplicitWidth = 972
        inherited iwrWelcome: TIWRegion
          Width = 708
          ExplicitWidth = 972
          inherited iwrDisplayUserName: TIWRegion
            Width = 567
            ExplicitWidth = 831
            inherited lblWelcome: TIWLabel
              Left = 246
              ExplicitLeft = 510
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 708
          ExplicitWidth = 972
        end
      end
    end
  end
end
