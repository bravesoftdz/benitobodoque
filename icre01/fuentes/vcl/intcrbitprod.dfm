object WCrbitprod: TWCrbitprod
  Left = 284
  Top = 291
  Width = 671
  Height = 137
  Caption = 'Bit�cora de Cambios en Config Producto Cr�dito'
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
  object lblCredito: TLabel
    Left = 2
    Top = 29
    Width = 43
    Height = 13
    Caption = 'Producto'
  end
  object lblFechaAlta: TLabel
    Left = 2
    Top = 54
    Width = 72
    Height = 13
    Caption = 'Fecha Registro'
  end
  object Label3: TLabel
    Left = 103
    Top = 55
    Width = 12
    Height = 13
    Caption = 'de'
  end
  object Label4: TLabel
    Left = 243
    Top = 55
    Width = 6
    Height = 13
    Caption = 'a'
  end
  object lbAplica: TLabel
    Left = 571
    Top = 2
    Width = 81
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Aplica B�squeda'
    WordWrap = True
  end
  object edCVE_PRODUCTO_CRE: TEdit
    Tag = 512
    Left = 127
    Top = 26
    Width = 81
    Height = 21
    HelpContext = 3000
    TabOrder = 0
  end
  object edDESC_C_PRODUCTO: TEdit
    Left = 236
    Top = 26
    Width = 349
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object chbxProducto: TCheckBox
    Left = 603
    Top = 28
    Width = 14
    Height = 17
    TabStop = False
    TabOrder = 2
  end
  object edFIniAlta: TEdit
    Tag = 17
    Left = 127
    Top = 49
    Width = 81
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 3
  end
  object stpInicioAlta: TInterDateTimePicker
    Tag = 17
    Left = 210
    Top = 49
    Width = 21
    Height = 21
    HelpContext = 3101
    CalAlignment = dtaLeft
    Date = 38196.3921868981
    Time = 38196.3921868981
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 4
    TabStop = False
    Edit = edFIniAlta
    Formato = dfDate
  end
  object edFFinAlta: TEdit
    Tag = 17
    Left = 261
    Top = 49
    Width = 81
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 5
  end
  object stpFinAlta: TInterDateTimePicker
    Tag = 17
    Left = 345
    Top = 49
    Width = 21
    Height = 21
    HelpContext = 3101
    CalAlignment = dtaLeft
    Date = 38196.3921868981
    Time = 38196.3921868981
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
    TabStop = False
    Edit = edFFinAlta
    Formato = dfDate
  end
  object chkFechaAlta: TCheckBox
    Tag = 512
    Left = 603
    Top = 51
    Width = 18
    Height = 17
    TabOrder = 7
  end
  object PnDatos: TPanel
    Left = -2
    Top = 74
    Width = 655
    Height = 21
    TabOrder = 8
    object lbEmpresa: TLabel
      Left = 5
      Top = 3
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
      Left = 5
      Top = 10
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
      Left = 344
      Top = 3
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
      Left = 344
      Top = 10
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
      Left = 69
      Top = 10
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
      Left = 408
      Top = 10
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
      Left = 408
      Top = 3
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
      Left = 69
      Top = 3
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
  object btnProducto: TBitBtn
    Tag = 17
    Left = 212
    Top = 27
    Width = 21
    Height = 21
    HelpContext = 3100
    TabOrder = 9
    OnClick = btnProductoClick
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
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
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
    OnBtnPreviewClick = InterForma1BtnPreviewClick
    ShowBtnPreview = False
    OnBtnImprimirClick = InterForma1BtnImprimirClick
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 398
    Top = 49
  end
  object ilPRODUCTO: TInterLinkit
    Control = edCVE_PRODUCTO_CRE
    OnEjecuta = ilPRODUCTOEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilPRODUCTOCapture
    Left = 294
    Top = 23
  end
end