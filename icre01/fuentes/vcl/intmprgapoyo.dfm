object wMPrgApoyo: TwMPrgApoyo
  Left = 380
  Top = 149
  Width = 545
  Height = 500
  Caption = 'Cat�logo de Programas de Apoyo'
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
  object lbCVE_FND_PROGRAMA: TLabel
    Left = 8
    Top = 35
    Width = 95
    Height = 26
    Caption = 'Clave del Programa de Apoyo'
    WordWrap = True
  end
  object lbDESC_PROGRAMA: TLabel
    Left = 8
    Top = 63
    Width = 56
    Height = 13
    Caption = 'Descripci�n'
  end
  object lbCVE_FND_ENT_DES: TLabel
    Left = 8
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Instituci�n'
  end
  object PnDatos: TPanel
    Left = 4
    Top = 436
    Width = 530
    Height = 21
    TabOrder = 10
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
      Left = 248
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
      Left = 248
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
      Left = 312
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
      Left = 312
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
  object edCVE_FND_PROGRAMA: TEdit
    Tag = 50
    Left = 120
    Top = 31
    Width = 90
    Height = 21
    HelpContext = 2000
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 3
    OnExit = edCVE_FND_PROGRAMAExit
    OnKeyPress = edCVE_FND_PROGRAMAKeyPress
  end
  object edDESC_PROGRAMA: TEdit
    Tag = 18
    Left = 120
    Top = 59
    Width = 395
    Height = 21
    HelpContext = 3000
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 4
    OnExit = edDESC_PROGRAMAExit
    OnKeyPress = edDESC_PROGRAMAKeyPress
  end
  object btCVE_FND_ENT_DES: TBitBtn
    Tag = 50
    Left = 211
    Top = 4
    Width = 21
    Height = 21
    HelpContext = 1001
    TabOrder = 1
    OnClick = btCVE_FND_ENT_DESClick
    OnExit = edCVE_FND_ENT_DESExit
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000010000000000008080
      8000000080000080800000800000808000008000000080008000408080004040
      0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
      FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
      80008000FF004080FF0000001F00000000000000000000000000000000000000
      A000BA7F0000000008005B00C4005B00B800B87FFF00FFFFA8005B002600B77F
      F4005D00C00000000A000000010000000000000090005B00FE0000006300F7BF
      C00000000A00000001000000000000005700D8843F000000BC005B002300F7BF
      0000000047000200E500F9BF7900F7BFF8000000E0005B002E00F7BF5700D884
      00000000D80047330000000046000000360002002E0000001F0000003F002701
      000047333F0027013C00FA3B3F000400000000000000F91AB700000000000100
      00000A000000FA3B10000000000000002800D379FF0047333C00413C3F00FFFF
      47000000000047333F0008E8780000000300F91AB700E7820700000000000000
      01000A00C0003F010000080000001F175900B77F00005B0080005B000700B87F
      FF00FFFF8C005B00E200B77F00005B0098005B00C200B87FFF00FFFFA4005B00
      B000B77F00005B00B0005B003500B87FFF00FFFFBC005B006100410000005B00
      C8005B006E006D307700CE4835001A3D0000528700000000E0000700DC004100
      0000FFFFEC005B0018004100500020001000200001000000FF00E0FFFF000000
      5E00E0010000FF10040000040000CE4800000000000000008200150000000000
      00000000000007400100000000000100200010000000E74850000B0195000C01
      01000000B700F4FEFF0000005E00F0A60100B710040000040000964800000000
      000000009B001500D400FFFF030000003C005E0004000000A000010020000000
      0000AF4808000700000000001B00240054005E0000000000F200B87F00000000
      00000000C800BB7F00000000000000004200736361000000E7000000AF00683D
      A7004840D700F7BF37000000C4005B003F002000CC00000074000000F4005D00
      20000000F8005B005D00B77F0100000000000000000000002000000034001704
      00000002F4005D00A8005B004700B77F20000000000000200000000205000000
      000000004400071852002A009000301200002011000034875000E01000003012
      0000408750001701A8001405000000000200920400000000A200000000003012
      0000828700006A87000000000000010000000000C80000007600507F1700537F
      E00027112F00B0876E00170164002F0100000000C8000000B0000000A0000000
      200000002700000001000000E000000000002F01E0005E0020000000BA00507F
      1700537F200029798600A233A200A705FC00AC1157001AEC5E00030303030303
      03030E11110E110E111103030303030303030E01010E010E0101030303030303
      0311110E110E0E110E0E0303030303030301010E010E0E010E0E030303030303
      0311110E110E11110E110303030303030301010E010E01010E01030303030303
      03031111110E0E0E110E03030303030303030101010E0E0E0F0E030303030303
      030606060E1111111111030303030303030F0F0F0E0101010F0F030303030303
      03060111060E110E110E030303030303030F0101000E010E010E030303030303
      0606010E110611110E110303030303030F0F010E010F01010E01030303030306
      0601060F0F060E11110E03030303030F0F01000F0F010E01010E030303030606
      010E0F06060603111103030303030F0F010E0F0F0F0F03010103030303060606
      060F06060303030303030303030F0F0F0F0F0F0F030303030303030306060106
      0606060303030303030303030F0F010F0F0F0F03030303030303030606010E0F
      06060303030303030303030F0F010E0F0F0F03030303030303030306010E0F06
      06030303030303030303030F010E0F0F0F0303030303030303030306060F0606
      03030303030303030303030F0F0F0F0F03030303030303030303030306060603
      0303030303030303030303030F0F0F0303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303}
    NumGlyphs = 2
  end
  object edDESC_FND_ENT_DES: TEdit
    Left = 233
    Top = 4
    Width = 282
    Height = 21
    HelpContext = 1002
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edCVE_FND_ENT_DES: TEdit
    Tag = 562
    Left = 120
    Top = 4
    Width = 90
    Height = 21
    HelpContext = 1000
    MaxLength = 10
    TabOrder = 0
    OnExit = edCVE_FND_ENT_DESExit
  end
  object rgCVE_MOD_FND: TRadioGroup
    Tag = 18
    Left = 7
    Top = 86
    Width = 194
    Height = 43
    HelpContext = 4000
    Caption = 'Modalidad de Fondeo'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Descuento'
      'Prestamo')
    TabOrder = 5
    OnExit = rgCVE_MOD_FNDExit
  end
  object ch_B_PROV_GARANTIA: TCheckBox
    Tag = 18
    Left = 216
    Top = 91
    Width = 189
    Height = 17
    HelpContext = 5000
    Caption = 'Genera Provisi�n de Garant�a'
    TabOrder = 6
    OnExit = ch_B_PROV_GARANTIAExit
  end
  object GB_Conf_TasaComb: TGroupBox
    Left = 8
    Top = 190
    Width = 513
    Height = 235
    Caption = 'Configuraci�n D�as Tasa x Periodo'
    TabOrder = 9
    TabStop = True
    object Shape6: TShape
      Left = 13
      Top = 88
      Width = 68
      Height = 25
      Brush.Color = 12320767
    end
    object Shape1: TShape
      Left = 80
      Top = 88
      Width = 68
      Height = 25
      Brush.Color = 12320767
    end
    object Shape2: TShape
      Left = 147
      Top = 88
      Width = 82
      Height = 25
      Brush.Color = 12320767
    end
    object Label2: TLabel
      Left = 20
      Top = 94
      Width = 49
      Height = 13
      Caption = 'Per. Inicial'
      Transparent = True
    end
    object Label3: TLabel
      Left = 92
      Top = 94
      Width = 44
      Height = 13
      Caption = 'Per. Final'
      Transparent = True
    end
    object Label4: TLabel
      Left = 177
      Top = 94
      Width = 23
      Height = 13
      Caption = 'D�as'
      Transparent = True
    end
    object Label5: TLabel
      Left = 40
      Top = 28
      Width = 66
      Height = 13
      Caption = 'Periodo Inicial'
    end
    object Label6: TLabel
      Left = 192
      Top = 28
      Width = 61
      Height = 13
      Caption = 'Periodo Final'
    end
    object Label8: TLabel
      Left = 80
      Top = 60
      Width = 23
      Height = 13
      Caption = 'D�as'
    end
    object strgrdTasas: TStringGrid
      Left = 13
      Top = 112
      Width = 228
      Height = 113
      TabStop = False
      BiDiMode = bdRightToLeft
      ColCount = 1
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ParentBiDiMode = False
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 6
      OnDrawCell = strgrdTasasDrawCell
    end
    object btAGREGAR: TBitBtn
      Tag = 530
      Left = 326
      Top = 112
      Width = 83
      Height = 22
      Caption = 'Agregar'
      TabOrder = 3
      OnClick = btAGREGARClick
      NumGlyphs = 2
    end
    object btMODIFICAR: TBitBtn
      Tag = 18
      Left = 326
      Top = 152
      Width = 83
      Height = 22
      Caption = 'Modificar'
      TabOrder = 4
      OnClick = btMODIFICARClick
      NumGlyphs = 2
    end
    object btELIMINAR: TBitBtn
      Tag = 530
      Left = 326
      Top = 192
      Width = 83
      Height = 22
      Caption = 'Eliminar'
      TabOrder = 5
      OnClick = btELIMINARClick
      NumGlyphs = 2
    end
    object edPERIODO_INI: TInterEdit
      Tag = 530
      Left = 113
      Top = 20
      Width = 70
      Height = 21
      HelpContext = -1
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      MaxLength = 4
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 0
      Enabled = False
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edPERIODO_FIN: TInterEdit
      Tag = 530
      Left = 265
      Top = 20
      Width = 70
      Height = 21
      HelpContext = -1
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      MaxLength = 4
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 1
      Enabled = False
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edDias: TInterEdit
      Tag = 530
      Left = 113
      Top = 52
      Width = 70
      Height = 21
      HelpContext = -1
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      MaxLength = 4
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 2
      Enabled = False
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object ch_B_CFG_DIAS_TASA: TCheckBox
    Tag = 18
    Left = 216
    Top = 112
    Width = 310
    Height = 17
    HelpContext = 6000
    Caption = 'Configuraci�n de c�lculo de inter�s especial (d�as anteriores)'
    TabOrder = 7
    OnClick = ch_B_CFG_DIAS_TASAClick
    OnExit = ch_B_CFG_DIAS_TASAExit
  end
  object rgCVE_IMP_CALC_INT: TRadioGroup
    Tag = 18
    Left = 8
    Top = 134
    Width = 417
    Height = 43
    HelpContext = 7000
    Caption = 'C�lculo Importe Inter�s'
    Columns = 3
    ItemIndex = 1
    Items.Strings = (
      'Imp. Capital'
      'Saldo Insoluto'
      'Imp. Cr�dito')
    TabOrder = 8
    OnExit = rgCVE_IMP_CALC_INTExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnBuscar = InterForma1Buscar
    msgSinRegistros = 'No existe un Registro para realizar la operaci�n.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '�Desea Eliminar el Registro Actual?'
    FormaEstilo = feHorizontal
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 410
    Top = 6
  end
  object ilCVE_FND_ENT_DES: TInterLinkit
    Control = edCVE_FND_ENT_DES
    OnEjecuta = ilCVE_FND_ENT_DESEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilCVE_FND_ENT_DESCapture
    Left = 260
    Top = 1
  end
end
