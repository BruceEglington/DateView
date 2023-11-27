object ISFTopBar: TISFTopBar
  Left = 0
  Top = 0
  Width = 984
  Height = 55
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
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
  object IWFrameRegion: TIWRegion
    Left = 0
    Top = 0
    Width = 984
    Height = 55
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    RenderInvisibleControls = False
    TabOrder = 0
    Align = alClient
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsNone
    BorderOptions.Color = clNone
    Color = clWebALICEBLUE
    ZIndex = -1
    object iwrHeader: TIWRegion
      Left = 0
      Top = 0
      Width = 984
      Height = 55
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alClient
      BorderOptions.NumericWidth = 0
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsSolid
      BorderOptions.Color = clMoneyGreen
      Color = clMoneyGreen
      object iwrWelcome: TIWRegion
        Left = 0
        Top = 35
        Width = 984
        Height = 20
        HorzScrollBar.Visible = False
        RenderInvisibleControls = False
        TabOrder = 2
        Align = alClient
        BorderOptions.NumericWidth = 0
        BorderOptions.BorderWidth = cbwNumeric
        BorderOptions.Style = cbsNone
        BorderOptions.Color = clNone
        object iwrLeftBlock: TIWRegion
          Left = 0
          Top = 0
          Width = 141
          Height = 20
          HorzScrollBar.Visible = False
          RenderInvisibleControls = False
          Align = alLeft
          BorderOptions.NumericWidth = 0
          BorderOptions.BorderWidth = cbwNumeric
          BorderOptions.Style = cbsSolid
          BorderOptions.Color = clNone
          Color = clWebLIGHTSLATEGRAY
        end
        object iwrDisplayUserName: TIWRegion
          Left = 141
          Top = 0
          Width = 843
          Height = 20
          HorzScrollBar.Visible = False
          RenderInvisibleControls = False
          Align = alClient
          BorderOptions.NumericWidth = 0
          BorderOptions.BorderWidth = cbwNumeric
          BorderOptions.Style = cbsSolid
          BorderOptions.Color = clNone
          Color = clWebLIGHTSTEELBLUE
          DesignSize = (
            843
            20)
          object lblWelcome: TIWLabel
            Left = 522
            Top = 3
            Width = 70
            Height = 16
            Anchors = [akTop, akRight]
            Font.Color = clWebDARKSLATEGRAY
            Font.FontName = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            HasTabOrder = False
            FriendlyName = 'lblWelcome'
            Caption = ' Welcome'
          end
        end
      end
      object iwrSignInOut: TIWRegion
        Left = 0
        Top = 0
        Width = 984
        Height = 35
        HorzScrollBar.Visible = False
        RenderInvisibleControls = False
        TabOrder = 3
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.BorderWidth = cbwNumeric
        BorderOptions.Style = cbsSolid
        BorderOptions.Color = clNone
        Color = clWebLIGHTBLUE
        object iwlSignOut: TIWLink
          Left = 723
          Top = 12
          Width = 53
          Height = 17
          RenderSize = False
          StyleRenderOptions.RenderSize = False
          Alignment = taLeftJustify
          Color = clNone
          Font.Color = clWebBLUE
          Font.FontName = 'Verdana'
          Font.Size = 9
          Font.Style = []
          HasTabOrder = True
          DoSubmitValidation = False
          FriendlyName = 'iwlSignOut'
          OnClick = iwlSignOutClick
          TabOrder = 0
          RawText = False
          Caption = 'Log Out'
        end
        object lnkSignIn: TIWLink
          Left = 607
          Top = 12
          Width = 53
          Height = 17
          RenderSize = False
          StyleRenderOptions.RenderSize = False
          Alignment = taLeftJustify
          Color = clNone
          Font.Color = clWebBLUE
          Font.FontName = 'Verdana'
          Font.Size = 9
          Font.Style = []
          HasTabOrder = True
          DoSubmitValidation = False
          FriendlyName = 'lnkSignIn'
          OnClick = SignIn
          TabOrder = 1
          RawText = False
          Caption = 'Log In'
        end
        object lblProgTitle: TIWLabel
          Left = 16
          Top = 8
          Width = 532
          Height = 24
          Font.Color = clWebSTEELBLUE
          Font.FontName = 'Arial'
          Font.Size = 16
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblProgTitle'
          Caption = 'DateView International Geochronology Database'
        end
      end
    end
  end
end
