inherited frmAlbuns: TfrmAlbuns
  Cursor = crHandPoint
  Caption = #193'lbuns'
  OnKeyDown = FormKeyDown
  TextHeight = 15
  inherited pnlCampos: TPanel
    Left = 112
    Top = 71
    Width = 769
    Height = 674
    ExplicitLeft = 112
    ExplicitTop = 71
    ExplicitWidth = 769
    ExplicitHeight = 674
    inherited Label1: TLabel
      Left = 115
      ExplicitLeft = 115
    end
    inherited Label2: TLabel
      Left = 87
      Top = 53
      Width = 45
      Caption = 'T'#237'tulo'
      ExplicitLeft = 87
      ExplicitTop = 53
      ExplicitWidth = 45
    end
    object Label3: TLabel [2]
      Left = 82
      Top = 96
      Width = 50
      Height = 21
      Caption = 'Artista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [3]
      Left = 90
      Top = 139
      Width = 42
      Height = 21
      Caption = 'Estilo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel [4]
      Left = 64
      Top = 182
      Width = 68
      Height = 21
      Caption = 'Produtor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel [5]
      Left = 53
      Top = 225
      Width = 79
      Height = 21
      Caption = 'Gravadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel [6]
      Left = 88
      Top = 268
      Width = 44
      Height = 21
      Caption = 'M'#237'dia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel [7]
      Left = 38
      Top = 312
      Width = 94
      Height = 21
      Caption = 'Lan'#231'amento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel [8]
      Left = 282
      Top = 312
      Width = 75
      Height = 21
      Caption = 'Aquisi'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel [9]
      Left = 63
      Top = 366
      Width = 69
      Height = 21
      Caption = 'Cat'#225'logo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel [10]
      Left = 294
      Top = 366
      Width = 84
      Height = 21
      Caption = 'N'#250'm. S'#233'rie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel [11]
      Left = 94
      Top = 409
      Width = 38
      Height = 21
      Cursor = crHandPoint
      Caption = 'Capa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape [12]
      Left = 138
      Top = 409
      Width = 252
      Height = 252
      Pen.Color = clBlue
    end
    object imgCapa: TImage [13]
      Tag = 12
      Left = 139
      Top = 410
      Width = 250
      Height = 250
      Center = True
      Stretch = True
    end
    inherited edtID: TEdit
      Left = 138
      OnKeyDown = FormKeyDown
      OnKeyPress = edtIDKeyPress
      ExplicitLeft = 138
    end
    inherited edtNome: TEdit
      Left = 138
      Top = 50
      Width = 543
      Height = 27
      OnKeyDown = FormKeyDown
      OnKeyPress = edtIDKeyPress
      ExplicitLeft = 138
      ExplicitTop = 50
      ExplicitWidth = 543
      ExplicitHeight = 27
    end
    object cbArtista: TComboBox
      Tag = 3
      Left = 138
      Top = 93
      Width = 543
      Height = 29
      Cursor = crHandPoint
      Style = csDropDownList
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Sorted = True
      TabOrder = 2
      StyleName = 'Windows'
      OnKeyDown = FormKeyDown
    end
    object cbEstilo: TComboBox
      Tag = 4
      Left = 138
      Top = 136
      Width = 543
      Height = 29
      Cursor = crHandPoint
      Style = csDropDownList
      Color = 16772332
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Sorted = True
      TabOrder = 3
      StyleName = 'Windows'
      OnKeyDown = FormKeyDown
    end
    object cbProdutor: TComboBox
      Tag = 5
      Left = 138
      Top = 179
      Width = 543
      Height = 29
      Cursor = crHandPoint
      Style = csDropDownList
      Color = 16772332
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Sorted = True
      TabOrder = 4
      StyleName = 'Windows'
      OnKeyDown = FormKeyDown
    end
    object cbGravadora: TComboBox
      Tag = 6
      Left = 138
      Top = 222
      Width = 543
      Height = 29
      Cursor = crHandPoint
      Style = csDropDownList
      Color = 16772332
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Sorted = True
      TabOrder = 5
      StyleName = 'Windows'
      OnKeyDown = FormKeyDown
    end
    object cbMidia: TComboBox
      Tag = 7
      Left = 138
      Top = 265
      Width = 87
      Height = 29
      Cursor = crHandPoint
      Style = csDropDownList
      Color = 16772332
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      StyleName = 'Windows'
      OnKeyDown = FormKeyDown
      Items.Strings = (
        'LP'
        'CD'
        'CD-R')
    end
    object dtLancamento: TDateTimePicker
      Tag = 8
      Left = 138
      Top = 312
      Width = 127
      Height = 29
      Cursor = crHandPoint
      Date = 45603.000000000000000000
      Time = 0.786466030091105500
      Color = 16772332
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnKeyDown = FormKeyDown
    end
    object dtAquisicao: TDateTimePicker
      Tag = 9
      Left = 363
      Top = 312
      Width = 127
      Height = 29
      Cursor = crHandPoint
      Date = 45603.000000000000000000
      Time = 0.786466030091105500
      Color = 16772332
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnKeyDown = FormKeyDown
    end
    object edtCatalogo: TEdit
      Tag = 10
      Left = 138
      Top = 363
      Width = 127
      Height = 29
      Cursor = crHandPoint
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      StyleName = 'Windows'
      OnKeyDown = FormKeyDown
    end
    object edtNumSerie: TEdit
      Tag = 11
      Left = 384
      Top = 363
      Width = 297
      Height = 29
      Cursor = crHandPoint
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      StyleName = 'Windows'
      OnKeyDown = FormKeyDown
    end
    object btnUpArtista: TBitBtn
      Tag = -1
      Left = 687
      Top = 93
      Width = 29
      Height = 29
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF4F3FFEAB4B0FFDB7E
        78FFD15D55FFCE5048FFCE5249FFD4655DFFDF8C86FFEFC7C4FFFEFDFDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFFE7ABA6FFCF534BFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFD4655DFFF0CC
        CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCF4F3FFD97871FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC48
        3FFFE5A29DFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF8F8FFD7716AFFCC473FFFCC473FFFCC473FFFCC473FFFCC47
        3FFFD25E56FFD8736CFFD66F68FFCE5148FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFE4A09CFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFE4A19DFFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFF6DF
        DDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFEDC1BEFFD26058FFCC473FFFCC47
        3FFFCC473FFFCC483FFFF0CAC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF7F7FFE39B96FFCC4A42FFCC4940FFE9B3AFFFFEFEFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F5FFD8766FFFCC47
        3FFFCC473FFFCC473FFFD36159FFFEFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4DBD9FFE9B1ADFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF4F3FFD25D
        55FFCC473FFFCC473FFFCC473FFFEEC3C0FFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEFFFEFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFFFCF6F5FFE9B2
        AEFFCC473FFFCC473FFFCC473FFFDD8680FFFCF6F5FFFCF7F6FFFFFFFFFFFFFF
        FFFFFEFEFEFFE19691FFDA7D77FFFDFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF6F5FFD7716AFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFE29893FFFFFFFFFFFEFE
        FEFFE39C97FFCC473FFFCC473FFFDC827CFFFDFBFAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F4FFD66D
        66FFCC473FFFCC473FFFCC473FFFCC473FFFE0928DFFFEFEFEFFFEFEFEFFE39A
        95FFCC473FFFCC473FFFCC473FFFCC473FFFDB807AFFFEFCFCFFFFFFFFFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF3
        F3FFD66F68FFCC473FFFCC473FFFE1948FFFFEFEFEFFFEFEFEFFE4A09BFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFFEFBFBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFBF3F3FFD56B63FFDF8F89FFFEFEFEFFFFFFFFFFFEFEFEFFF7E4E3FFF7E4
        E2FFCF554CFFCC473FFFCC473FFFCD4E45FFF5DBD9FFF7E4E3FFFDFBFAFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCF5F5FFFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDF8E88FFCC473FFFCC473FFFCC473FFFE29994FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAFAFFFEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF6DEDDFFCC4940FFCC473FFFCC473FFFCC483FFFE9B3AFFFFEFEFEFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F5FFD8766FFFDB7F
        79FFF9EAE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFE19590FFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFF6DF
        DDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFEDC1BEFFD26058FFCC473FFFCC47
        3FFFCE5249FFE9B3AFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF9F9FFD7726BFFCC473FFFCC473FFFCC473FFFCC473FFFCC47
        3FFFD25D55FFD8736CFFD66E67FFCE5148FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFE4A19CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCF4F3FFD97972FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC49
        40FFE5A29EFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFFE7ABA7FFCF534BFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFD4655DFFF1CD
        CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF4F3FFEAB4B0FFDB7F
        78FFD25D55FFCE5048FFCE524AFFD4655EFFDF8C87FFEFC7C5FFFEFDFDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 11
      OnClick = btnUpArtistaClick
    end
    object btnUpEstilo: TBitBtn
      Tag = -2
      Left = 687
      Top = 136
      Width = 29
      Height = 29
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF4F3FFEAB4B0FFDB7E
        78FFD15D55FFCE5048FFCE5249FFD4655DFFDF8C86FFEFC7C4FFFEFDFDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFFE7ABA6FFCF534BFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFD4655DFFF0CC
        CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCF4F3FFD97871FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC48
        3FFFE5A29DFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF8F8FFD7716AFFCC473FFFCC473FFFCC473FFFCC473FFFCC47
        3FFFD25E56FFD8736CFFD66F68FFCE5148FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFE4A09CFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFE4A19DFFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFF6DF
        DDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFEDC1BEFFD26058FFCC473FFFCC47
        3FFFCC473FFFCC483FFFF0CAC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF7F7FFE39B96FFCC4A42FFCC4940FFE9B3AFFFFEFEFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F5FFD8766FFFCC47
        3FFFCC473FFFCC473FFFD36159FFFEFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4DBD9FFE9B1ADFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF4F3FFD25D
        55FFCC473FFFCC473FFFCC473FFFEEC3C0FFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEFFFEFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFFFCF6F5FFE9B2
        AEFFCC473FFFCC473FFFCC473FFFDD8680FFFCF6F5FFFCF7F6FFFFFFFFFFFFFF
        FFFFFEFEFEFFE19691FFDA7D77FFFDFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF6F5FFD7716AFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFE29893FFFFFFFFFFFEFE
        FEFFE39C97FFCC473FFFCC473FFFDC827CFFFDFBFAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F4FFD66D
        66FFCC473FFFCC473FFFCC473FFFCC473FFFE0928DFFFEFEFEFFFEFEFEFFE39A
        95FFCC473FFFCC473FFFCC473FFFCC473FFFDB807AFFFEFCFCFFFFFFFFFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF3
        F3FFD66F68FFCC473FFFCC473FFFE1948FFFFEFEFEFFFEFEFEFFE4A09BFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFFEFBFBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFBF3F3FFD56B63FFDF8F89FFFEFEFEFFFFFFFFFFFEFEFEFFF7E4E3FFF7E4
        E2FFCF554CFFCC473FFFCC473FFFCD4E45FFF5DBD9FFF7E4E3FFFDFBFAFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCF5F5FFFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDF8E88FFCC473FFFCC473FFFCC473FFFE29994FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAFAFFFEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF6DEDDFFCC4940FFCC473FFFCC473FFFCC483FFFE9B3AFFFFEFEFEFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F5FFD8766FFFDB7F
        79FFF9EAE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFE19590FFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFF6DF
        DDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFEDC1BEFFD26058FFCC473FFFCC47
        3FFFCE5249FFE9B3AFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF9F9FFD7726BFFCC473FFFCC473FFFCC473FFFCC473FFFCC47
        3FFFD25D55FFD8736CFFD66E67FFCE5148FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFE4A19CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCF4F3FFD97972FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC49
        40FFE5A29EFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFFE7ABA7FFCF534BFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFD4655DFFF1CD
        CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF4F3FFEAB4B0FFDB7F
        78FFD25D55FFCE5048FFCE524AFFD4655EFFDF8C87FFEFC7C5FFFEFDFDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 12
      OnClick = btnUpArtistaClick
    end
    object btnUpProdutor: TBitBtn
      Tag = -3
      Left = 687
      Top = 179
      Width = 29
      Height = 29
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF4F3FFEAB4B0FFDB7E
        78FFD15D55FFCE5048FFCE5249FFD4655DFFDF8C86FFEFC7C4FFFEFDFDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFFE7ABA6FFCF534BFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFD4655DFFF0CC
        CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCF4F3FFD97871FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC48
        3FFFE5A29DFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF8F8FFD7716AFFCC473FFFCC473FFFCC473FFFCC473FFFCC47
        3FFFD25E56FFD8736CFFD66F68FFCE5148FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFE4A09CFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFE4A19DFFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFF6DF
        DDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFEDC1BEFFD26058FFCC473FFFCC47
        3FFFCC473FFFCC483FFFF0CAC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF7F7FFE39B96FFCC4A42FFCC4940FFE9B3AFFFFEFEFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F5FFD8766FFFCC47
        3FFFCC473FFFCC473FFFD36159FFFEFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4DBD9FFE9B1ADFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF4F3FFD25D
        55FFCC473FFFCC473FFFCC473FFFEEC3C0FFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEFFFEFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFFFCF6F5FFE9B2
        AEFFCC473FFFCC473FFFCC473FFFDD8680FFFCF6F5FFFCF7F6FFFFFFFFFFFFFF
        FFFFFEFEFEFFE19691FFDA7D77FFFDFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF6F5FFD7716AFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFE29893FFFFFFFFFFFEFE
        FEFFE39C97FFCC473FFFCC473FFFDC827CFFFDFBFAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F4FFD66D
        66FFCC473FFFCC473FFFCC473FFFCC473FFFE0928DFFFEFEFEFFFEFEFEFFE39A
        95FFCC473FFFCC473FFFCC473FFFCC473FFFDB807AFFFEFCFCFFFFFFFFFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF3
        F3FFD66F68FFCC473FFFCC473FFFE1948FFFFEFEFEFFFEFEFEFFE4A09BFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFFEFBFBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFBF3F3FFD56B63FFDF8F89FFFEFEFEFFFFFFFFFFFEFEFEFFF7E4E3FFF7E4
        E2FFCF554CFFCC473FFFCC473FFFCD4E45FFF5DBD9FFF7E4E3FFFDFBFAFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCF5F5FFFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDF8E88FFCC473FFFCC473FFFCC473FFFE29994FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAFAFFFEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF6DEDDFFCC4940FFCC473FFFCC473FFFCC483FFFE9B3AFFFFEFEFEFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F5FFD8766FFFDB7F
        79FFF9EAE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFE19590FFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFF6DF
        DDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFEDC1BEFFD26058FFCC473FFFCC47
        3FFFCE5249FFE9B3AFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF9F9FFD7726BFFCC473FFFCC473FFFCC473FFFCC473FFFCC47
        3FFFD25D55FFD8736CFFD66E67FFCE5148FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFE4A19CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCF4F3FFD97972FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC49
        40FFE5A29EFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFFE7ABA7FFCF534BFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFD4655DFFF1CD
        CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF4F3FFEAB4B0FFDB7F
        78FFD25D55FFCE5048FFCE524AFFD4655EFFDF8C87FFEFC7C5FFFEFDFDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 13
      OnClick = btnUpArtistaClick
    end
    object btnUpGravadora: TBitBtn
      Tag = -4
      Left = 687
      Top = 222
      Width = 29
      Height = 29
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF4F3FFEAB4B0FFDB7E
        78FFD15D55FFCE5048FFCE5249FFD4655DFFDF8C86FFEFC7C4FFFEFDFDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFFE7ABA6FFCF534BFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFD4655DFFF0CC
        CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCF4F3FFD97871FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC48
        3FFFE5A29DFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF8F8FFD7716AFFCC473FFFCC473FFFCC473FFFCC473FFFCC47
        3FFFD25E56FFD8736CFFD66F68FFCE5148FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFE4A09CFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFE4A19DFFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFF6DF
        DDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFEDC1BEFFD26058FFCC473FFFCC47
        3FFFCC473FFFCC483FFFF0CAC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF7F7FFE39B96FFCC4A42FFCC4940FFE9B3AFFFFEFEFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F5FFD8766FFFCC47
        3FFFCC473FFFCC473FFFD36159FFFEFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4DBD9FFE9B1ADFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF4F3FFD25D
        55FFCC473FFFCC473FFFCC473FFFEEC3C0FFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEFFFEFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFFFCF6F5FFE9B2
        AEFFCC473FFFCC473FFFCC473FFFDD8680FFFCF6F5FFFCF7F6FFFFFFFFFFFFFF
        FFFFFEFEFEFFE19691FFDA7D77FFFDFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF6F5FFD7716AFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFE29893FFFFFFFFFFFEFE
        FEFFE39C97FFCC473FFFCC473FFFDC827CFFFDFBFAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F4FFD66D
        66FFCC473FFFCC473FFFCC473FFFCC473FFFE0928DFFFEFEFEFFFEFEFEFFE39A
        95FFCC473FFFCC473FFFCC473FFFCC473FFFDB807AFFFEFCFCFFFFFFFFFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF3
        F3FFD66F68FFCC473FFFCC473FFFE1948FFFFEFEFEFFFEFEFEFFE4A09BFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFFEFBFBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFBF3F3FFD56B63FFDF8F89FFFEFEFEFFFFFFFFFFFEFEFEFFF7E4E3FFF7E4
        E2FFCF554CFFCC473FFFCC473FFFCD4E45FFF5DBD9FFF7E4E3FFFDFBFAFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCF5F5FFFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDF8E88FFCC473FFFCC473FFFCC473FFFE29994FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAFAFFFEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF6DEDDFFCC4940FFCC473FFFCC473FFFCC483FFFE9B3AFFFFEFEFEFFFFFF
        FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5F5FFD8766FFFDB7F
        79FFF9EAE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFE19590FFCC473FFFCC473FFFCC473FFFCC473FFFDD857FFFF6DF
        DDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFEDC1BEFFD26058FFCC473FFFCC47
        3FFFCE5249FFE9B3AFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF9F9FFD7726BFFCC473FFFCC473FFFCC473FFFCC473FFFCC47
        3FFFD25D55FFD8736CFFD66E67FFCE5148FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFE4A19CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCF4F3FFD97972FFCC473FFFCC473FFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC49
        40FFE5A29EFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFFE7ABA7FFCF534BFFCC473FFFCC47
        3FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFCC473FFFD4655DFFF1CD
        CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF4F3FFEAB4B0FFDB7F
        78FFD25D55FFCE5048FFCE524AFFD4655EFFDF8C87FFEFC7C5FFFEFDFDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 14
      OnClick = btnUpArtistaClick
    end
  end
end
