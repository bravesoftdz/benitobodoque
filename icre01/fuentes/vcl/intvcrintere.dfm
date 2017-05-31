object WVcrInteres: TWVcrInteres
  Left = 359
  Top = 113
  Width = 540
  Height = 571
  Caption = 'Consulta de Periodos de Int�res'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = -34
    Top = 495
    Width = 515
    Height = 22
  end
  object lblPeriodos: TLabel
    Left = 2
    Top = 479
    Width = 359
    Height = 15
    AutoSize = False
    Caption = 'Total de Periodos = 0      Total de Periodos Impagados = 0'
    Color = 12320767
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lblTituloTotales: TLabel
    Left = 2
    Top = 498
    Width = 199
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Totales'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lblTotImpVencido: TLabel
    Left = 391
    Top = 498
    Width = 73
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Color = clWhite
    ParentColor = False
  end
  object lblTotImpPagado: TLabel
    Left = 316
    Top = 498
    Width = 73
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Color = clWhite
    ParentColor = False
  end
  object lblTotImpProgramado: TLabel
    Left = 241
    Top = 498
    Width = 73
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Color = clWhite
    ParentColor = False
  end
  object lbID_CREDITO: TLabel
    Left = 451
    Top = 13
    Width = 53
    Height = 13
    Caption = 'No. Cr�dito'
  end
  object Shape1: TShape
    Left = 0
    Top = 63
    Width = 26
    Height = 33
    Brush.Color = 12320767
  end
  object Label1: TLabel
    Left = 0
    Top = 73
    Width = 27
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Pdo.'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object strGrdData: TStringGrid
    Left = 0
    Top = 95
    Width = 531
    Height = 336
    ColCount = 1
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 0
    OnDblClick = strGrdDataDblClick
    OnDrawCell = strGrdDataDrawCell
    OnKeyDown = strGrdDataKeyDown
  end
  object Panel1: TPanel
    Left = 53
    Top = 431
    Width = 388
    Height = 22
    TabOrder = 1
  end
  object btnRefrescar: TBitBtn
    Left = 431
    Top = 431
    Width = 75
    Height = 21
    Caption = 'Refrescar'
    TabOrder = 2
    OnClick = btnRefrescarClick
  end
  object tbstSituacion: TTabSet
    Left = 5
    Top = 452
    Width = 500
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Tabs.Strings = (
      'Todos'
      'Vigentes'
      'Liquidados'
      'Impagados'
      'Por Activar'
      'Cancelados')
    TabIndex = 0
    OnChange = tbstSituacionChange
  end
  object btnExcellAll: TBitBtn
    Left = 0
    Top = 431
    Width = 23
    Height = 23
    Hint = 'Copiar Todo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnExcellAllClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FF0000FF0000
      0084008484840084008484840084008484840084008484840084008484840084
      00848484FF0000FF0000FF000000840084848400840084848400840084848400
      8400848484008400848484008400848484008400FF0000FF0000008400848484
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF008400848484848484008400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF848484008400848484008400848484848484008400008400848484
      FFFFFF008400848484008400848484008400848484008400FFFFFF0084008484
      84008400008400848484848484008400FFFFFF84848400840084848400840084
      8484008400FFFFFF008400848484008400FFFFFF848484008400008400848484
      FFFFFF008400848484008400848484008400FFFFFF0084008484840084008484
      84FFFFFF008400848484848484008400FFFFFFFFFFFF008400848484008400FF
      FFFF008400848484008400848484008400FFFFFF848484008400008400848484
      FFFFFFFFFFFFFFFFFF008400FFFFFF008400848484008400848484FFFFFFFFFF
      FFFFFFFF008400848484848484008400FFFFFFFFFFFF008400FFFFFF00840084
      8484008400848484008400848484FFFFFFFFFFFF848484008400008400848484
      FFFFFF008400FFFFFF0084008484840084008484840084008484840084008484
      84FFFFFF008400848484848484008400FFFFFF84848400840084848400840084
      8484FFFFFF848484008400848484008400FFFFFF848484008400008400848484
      FFFFFF008400848484008400848484FFFFFFFFFFFFFFFFFF8484840084008484
      84FFFFFF008400848484848484008400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484008400FF0000FF0000
      0084008484840084008484840084008484840084008484840084008484840084
      00848484FF0000FF0000FF0000FF000084848400840084848400840084848400
      8400848484008400848484008400848484008400FF0000FF0000}
  end
  object btnExcellSelected: TBitBtn
    Left = 22
    Top = 431
    Width = 23
    Height = 23
    Hint = 'Copiar Seleccionado'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnExcellSelectedClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FFFFFFFF0000FF
      0000FF0000FF0000FFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF848484008400848484008400848484FF0000FFFFFFFFFFFFFF0000
      FFFFFF008400848484008400848484008400848484008400FFFFFF0084008484
      84008400FF0000FFFFFFFFFFFFFF0000FFFFFF84848400840084848400840084
      8484008400FFFFFF008400848484008400FFFFFFFF0000FFFFFFFFFFFFFF0000
      FFFFFF008400848484008400848484008400FFFFFF0084008484840084008484
      84FFFFFFFF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFF008400848484008400FF
      FFFF008400848484008400848484008400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF008400FFFFFF008400848484008400848484FFFFFFFFFF
      FFFFFFFFFF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFF008400FFFFFF00840084
      8484008400848484008400848484FFFFFFFFFFFFFF0000FFFFFFFFFFFFFF0000
      FFFFFF008400FFFFFF0084008484840084008484840084008484840084008484
      84FFFFFFFF0000FFFFFFFFFFFFFF0000FFFFFF84848400840084848400840084
      8484FFFFFF848484008400848484008400FFFFFFFF0000FFFFFFFFFFFFFF0000
      FFFFFF008400848484008400848484FFFFFFFFFFFFFFFFFF8484840084008484
      84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFF0000
      FF0000FF0000FF0000FFFFFFFF0000FF0000FF0000FF0000FFFFFFFF0000FF00
      00FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object PnDatos: TPanel
    Left = 0
    Top = 522
    Width = 530
    Height = 22
    TabOrder = 6
    object lbEmpresa: TLabel
      Left = 11
      Top = 2
      Width = 42
      Height = 8
      Caption = 'EMPRESA :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbUsuario: TLabel
      Left = 11
      Top = 9
      Width = 44
      Height = 8
      Caption = 'USUARIO : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbFecha: TLabel
      Left = 264
      Top = 2
      Width = 50
      Height = 8
      Caption = 'FECHA HOY :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPerfil: TLabel
      Left = 264
      Top = 9
      Width = 33
      Height = 8
      Caption = 'PERFIL :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDUsuario: TLabel
      Left = 75
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDPerfil: TLabel
      Left = 328
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDFecha: TLabel
      Left = 328
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDEmpresa: TLabel
      Left = 75
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object icpCONTRATO: TInterCtoPanel
    Left = 0
    Top = 10
    Width = 449
    Height = 45
    Hint = 'Informaci�n del Contrato'
    Lenguaje = 0
    ShowLenguaje = False
    ShowEnviarEMail = False
  end
  object edID_CREDITO: TEdit
    Left = 450
    Top = 30
    Width = 54
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object PnlTitulos: TPanel
    Left = 25
    Top = 63
    Width = 488
    Height = 33
    BevelOuter = bvNone
    TabOrder = 9
    object shp5: TShape
      Left = 0
      Top = 16
      Width = 67
      Height = 17
      Brush.Color = 12320767
    end
    object shp4: TShape
      Left = 0
      Top = 0
      Width = 197
      Height = 17
      Brush.Color = 12320767
    end
    object shp6: TShape
      Left = 66
      Top = 16
      Width = 66
      Height = 17
      Brush.Color = 12320767
    end
    object shp7: TShape
      Left = 131
      Top = 16
      Width = 66
      Height = 17
      Brush.Color = 12320767
    end
    object shp9: TShape
      Left = 239
      Top = 0
      Width = 226
      Height = 17
      Brush.Color = 12320767
    end
    object shp10: TShape
      Left = 239
      Top = 16
      Width = 76
      Height = 17
      Brush.Color = 12320767
    end
    object Shape8: TShape
      Left = 314
      Top = 16
      Width = 76
      Height = 17
      Brush.Color = 12320767
    end
    object shp11: TShape
      Left = 389
      Top = 16
      Width = 76
      Height = 17
      Brush.Color = 12320767
    end
    object shp8: TShape
      Left = 196
      Top = 0
      Width = 45
      Height = 33
      Brush.Color = 12320767
    end
    object shp17: TShape
      Left = 464
      Top = 0
      Width = 19
      Height = 33
      Brush.Color = 12320767
    end
    object lblFecha: TLabel
      Left = 2
      Top = 2
      Width = 193
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Fechas'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblVencimiento: TLabel
      Left = 2
      Top = 18
      Width = 62
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Vencimiento'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblProgramado: TLabel
      Left = 69
      Top = 18
      Width = 62
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Programado'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblPago: TLabel
      Left = 133
      Top = 18
      Width = 62
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Pago'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblImpProgramado: TLabel
      Left = 245
      Top = 18
      Width = 68
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Programado'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblImpPagado: TLabel
      Left = 318
      Top = 18
      Width = 68
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Pagado'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblImpVencido: TLabel
      Left = 393
      Top = 18
      Width = 68
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Vencido'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblImpInteres: TLabel
      Left = 242
      Top = 2
      Width = 221
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Importe Inter�s'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblSituacion: TLabel
      Left = 466
      Top = 10
      Width = 16
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Sit.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
  end
  object InterForma1: TInterForma
    IsMain = True
    msgSinRegistros = 'No existe un Registro para realizar la operaci�n.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '�Desea Eliminar el Registro Actual?'
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 474
    Top = 478
  end
end
