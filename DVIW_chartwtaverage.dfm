object IWChartWtAverage: TIWChartWtAverage
  Left = 0
  Top = 0
  Width = 987
  Height = 548
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'DateView'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = False
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWChart1: TIWChart
    Left = 6
    Top = 80
    Width = 713
    Height = 459
    BorderOptions.Width = 0
    TabOrder = -1
    UseSize = True
    Chart = Chart1
  end
  object iwcbShowLegend: TIWCheckBox
    Left = 598
    Top = 6
    Width = 103
    Height = 21
    Cursor = crAuto
    Caption = 'Show Legend'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 9
    OnClick = iwcbShowLegendClick
    Checked = True
    FriendlyName = 'iwcbShowLegend'
  end
  object iwcbShowBackground: TIWCheckBox
    Left = 598
    Top = 26
    Width = 125
    Height = 21
    Cursor = crAuto
    Caption = 'Show background'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 10
    OnClick = iwcbShowBackgroundClick
    Checked = True
    FriendlyName = 'iwcbShowBackground'
  end
  object iwbClose: TIWButton
    Left = 8
    Top = 6
    Width = 75
    Height = 21
    Caption = 'Close'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbClose'
    TabOrder = 12
    OnClick = iwbCloseClick
  end
  object iwbExportGraphValues: TIWButton
    Left = 8
    Top = 28
    Width = 75
    Height = 21
    Caption = 'Export'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbExportGraphValues'
    TabOrder = 11
    OnClick = iwbExportGraphValuesClick
  end
  object IWLabel3: TIWLabel
    Left = 104
    Top = 8
    Width = 64
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'Y axis min.'
  end
  object IWLabel4: TIWLabel
    Left = 104
    Top = 32
    Width = 64
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel4'
    Caption = 'X axis min.'
  end
  object iweYMinimum: TIWEdit
    Left = 170
    Top = 4
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweYMinimum'
    SubmitOnAsyncEvent = True
    TabOrder = 0
  end
  object iweXMinimum: TIWEdit
    Left = 170
    Top = 28
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweXMinimum'
    SubmitOnAsyncEvent = True
    TabOrder = 2
  end
  object iweXMaximum: TIWEdit
    Left = 284
    Top = 28
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWEdit2'
    SubmitOnAsyncEvent = True
    TabOrder = 3
  end
  object iweYMaximum: TIWEdit
    Left = 284
    Top = 4
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 1
  end
  object IWLabel5: TIWLabel
    Left = 250
    Top = 8
    Width = 28
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'max.'
  end
  object IWLabel6: TIWLabel
    Left = 250
    Top = 32
    Width = 28
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel4'
    Caption = 'max.'
  end
  object iwbChangeAxisScales: TIWButton
    Left = 370
    Top = 6
    Width = 75
    Height = 21
    Caption = 'Change'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbChangeAxisScales'
    TabOrder = 6
    OnClick = iwbChangeAxisScalesClick
  end
  object iwcbAutomaticScaling: TIWCheckBox
    Left = 370
    Top = 28
    Width = 145
    Height = 21
    Cursor = crAuto
    Caption = 'Automatic scale'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 7
    OnClick = iwcbAutomaticScalingClick
    Checked = True
    FriendlyName = 'iwcbAutomaticScaling'
  end
  object iwcbShowErrorBars: TIWCheckBox
    Left = 490
    Top = 6
    Width = 83
    Height = 21
    Cursor = crAuto
    Caption = 'Error bars'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 8
    OnClick = iwcbShowErrorBarsClick
    Checked = True
    FriendlyName = 'iwcbShowErrorBars'
  end
  object iwLblWeightedAverage: TIWLabel
    Left = 736
    Top = 110
    Width = 30
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'iwLblWeightedAverage'
    Caption = '2001'
  end
  object IWLabel1: TIWLabel
    Left = 736
    Top = 90
    Width = 113
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'iwlblWeightedAverage'
    Caption = 'Weighted average'
  end
  object iwLblMSWD: TIWLabel
    Left = 736
    Top = 152
    Width = 90
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'iwLblMSWD'
    Caption = 'MSWD = 5.401'
  end
  object iwLblProbofFit: TIWLabel
    Left = 736
    Top = 174
    Width = 112
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'iwLblProbofFit'
    Caption = 'Prob. of fit = 0.005'
  end
  object iwLblComment: TIWLabel
    Left = 736
    Top = 230
    Width = 112
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'iwLblComment'
    Caption = 'Prob. of fit = 0.005'
  end
  object IWLabel2: TIWLabel
    Left = 104
    Top = 56
    Width = 66
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel4'
    Caption = 'P axis min.'
  end
  object iwePMinimum: TIWEdit
    Left = 170
    Top = 52
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwePMinimum'
    SubmitOnAsyncEvent = True
    TabOrder = 4
  end
  object IWLabel7: TIWLabel
    Left = 250
    Top = 56
    Width = 28
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel4'
    Caption = 'max.'
  end
  object iwePMaximum: TIWEdit
    Left = 284
    Top = 52
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwePMaximum'
    SubmitOnAsyncEvent = True
    TabOrder = 5
  end
  object iwLblN: TIWLabel
    Left = 736
    Top = 196
    Width = 18
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'iwLblN'
    Caption = 'n ='
  end
  object Chart1: TChart
    Left = 7
    Top = 80
    Width = 712
    Height = 459
    Foot.Alignment = taLeftJustify
    Foot.Font.Color = clGray
    Foot.Font.Style = [fsBold]
    Foot.Text.Strings = (
      '(c) Dr Bruce Eglington (2004)'
      'DateView Geochronology Database'
      '')
    Gradient.EndColor = 12615680
    Gradient.MidColor = clWhite
    Gradient.StartColor = clSilver
    Gradient.Visible = True
    Legend.Brush.Gradient.Visible = True
    Legend.CheckBoxesStyle = cbsRadio
    Legend.Font.Height = -15
    Legend.Font.Style = [fsBold]
    Legend.Font.Shadow.Color = clWhite
    Legend.Font.Shadow.HorizSize = 1
    Legend.Font.Shadow.VertSize = 1
    Legend.LegendStyle = lsSeries
    Title.Brush.Gradient.Direction = gdLeftRight
    Title.Brush.Gradient.EndColor = clGray
    Title.Brush.Gradient.Visible = True
    Title.Font.Color = clBlack
    Title.Font.Height = -21
    Title.Text.Strings = (
      'TChart')
    BottomAxis.LabelsSeparation = 30
    BottomAxis.MaximumOffset = 4
    BottomAxis.MinimumOffset = 4
    BottomAxis.Title.Font.Style = [fsBold]
    DepthAxis.Automatic = False
    DepthAxis.AutomaticMaximum = False
    DepthAxis.AutomaticMinimum = False
    DepthAxis.Maximum = 0.800000000000000300
    DepthAxis.Minimum = -0.199999999999999900
    DepthTopAxis.Automatic = False
    DepthTopAxis.AutomaticMaximum = False
    DepthTopAxis.AutomaticMinimum = False
    DepthTopAxis.Maximum = 0.800000000000000300
    DepthTopAxis.Minimum = -0.199999999999999900
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Maximum = 764.299999999999700000
    LeftAxis.Minimum = 263.300000000000100000
    LeftAxis.Title.Caption = 'Date'
    LeftAxis.Title.Font.Style = [fsBold]
    RightAxis.Automatic = False
    RightAxis.AutomaticMaximum = False
    RightAxis.AutomaticMinimum = False
    TopAxis.Automatic = False
    TopAxis.AutomaticMaximum = False
    TopAxis.AutomaticMinimum = False
    TopAxis.ExactDateTime = False
    TopAxis.Increment = 10.000000000000000000
    TopAxis.Inverted = True
    TopAxis.Labels = False
    TopAxis.LabelsFormat.Visible = False
    TopAxis.Maximum = 100.000000000000000000
    TopAxis.Title.Visible = False
    View3D = False
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      27
      15
      27)
    ColorPaletteIndex = 0
    object Series1: TLineSeries
      HoverElement = [heCurrent]
      Legend.Visible = False
      Depth = 0
      SeriesColor = clBlue
      ShowInLegend = False
      Brush.BackColor = clDefault
      LinePen.Color = 8404992
      LinePen.Width = 2
      LinePen.Visible = False
      Pointer.Brush.Gradient.EndColor = clBlue
      Pointer.Gradient.EndColor = clBlue
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        0105000000000000000000F03F00000000003071400000000000000040000000
        000080744000000000000008400000000000B07D400000000000001040000000
        000080814000000000000014400000000000D07540}
    end
    object Series5: TLineSeries
      HoverElement = [heCurrent]
      ColorEachLine = False
      Depth = 0
      HorizAxis = aTopAxis
      SeriesColor = clFuchsia
      Title = 'Probability'
      Brush.BackColor = clDefault
      Dark3D = False
      LinePen.Color = clFuchsia
      LinePen.Width = 3
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
      XValues.Name = 'X'
      XValues.Order = loNone
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        010C000000000000000000000000000000000069400000000000000000000000
        0000406F4000000000000000000000000000C072400000000000000000000000
        0000E07540000000000000144000000000008076400000000000002440000000
        00002077400000000000002E400000000000C077400000000000003440000000
        0000607840000000000000344000000000000079400000000000002E40000000
        0000A0794000000000000024400000000000407A400000000000000000000000
        0000E07A40}
    end
    object Series2: TLineSeries
      HoverElement = [heCurrent]
      Depth = 0
      Title = 'Mean'
      Brush.BackColor = clDefault
      LinePen.Color = clRed
      LinePen.Width = 3
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        010500000000000000000000000000000000A079400000000000001840000000
        0000B07E4000000000000028400000000000C080400000000000003240000000
        000050824000000000000038400000000000488040}
    end
    object Series3: TLineSeries
      HoverElement = [heCurrent]
      Depth = 0
      SeriesColor = clRed
      Title = '+95%'
      Brush.BackColor = clDefault
      LinePen.Color = clRed
      LinePen.Style = psDash
      LinePen.Width = 2
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        010500000000000000000000000000000000307C400000000000001840000000
        0000C88040000000000000284000000000007880400000000000003240000000
        0000E8814000000000000038400000000000308340}
    end
    object Series4: TLineSeries
      HoverElement = [heCurrent]
      Depth = 0
      SeriesColor = clRed
      Title = '-95%'
      Brush.BackColor = clDefault
      LinePen.Color = clRed
      LinePen.Style = psDash
      LinePen.Width = 2
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        0105000000000000000000000000000000002065400000000000001840000000
        0000405C40000000000000284000000000008068400000000000003240000000
        0000A0654000000000000038400000000000006B40}
    end
    object Series6: TErrorSeries
      HoverElement = []
      Legend.Visible = False
      Marks.Visible = False
      SeriesColor = clBlue
      ShowInLegend = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      ErrorPen.Color = clBlue
      ErrorPen.EndStyle = esSquare
      ErrorValues.Name = 'StdError'
      ErrorValues.Order = loNone
    end
  end
  object FDTitles: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 776
    Top = 16
    object FDTitlesApproachID: TStringField
      FieldName = 'ApproachID'
      Size = 5
    end
    object FDTitlesApproachDescription: TStringField
      FieldName = 'ApproachDescription'
      Size = 50
    end
  end
  object FDTempDataDI: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 888
    Top = 32
    object StringField1: TStringField
      FieldName = 'ApproachID'
      Size = 5
    end
    object StringField2: TStringField
      FieldName = 'ApproachDescription'
      Size = 50
    end
  end
end
