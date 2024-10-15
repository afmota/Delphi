inherited frmAlbuns: TfrmAlbuns
  Caption = 'Cadastro de '#193'lbuns'
  ClientHeight = 442
  ClientWidth = 771
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 787
  ExplicitHeight = 481
  TextHeight = 15
  inherited pnlBotoes: TPanel
    Width = 771
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited pnlCampos: TPanel
    Width = 771
    Height = 393
    StyleElements = [seFont, seClient, seBorder]
    object Label1: TLabel
      Left = 176
      Top = 48
      Width = 17
      Height = 21
      Caption = 'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 148
      Top = 77
      Width = 45
      Height = 21
      Caption = 'T'#237'tulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 143
      Top = 106
      Width = 50
      Height = 21
      Caption = 'Artista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 36
      Top = 141
      Width = 157
      Height = 21
      Caption = 'Data de Lan'#231'amento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 55
      Top = 176
      Width = 138
      Height = 21
      Caption = 'Data de Aquisi'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 125
      Top = 211
      Width = 68
      Height = 21
      Caption = 'Produtor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 114
      Top = 238
      Width = 79
      Height = 21
      Caption = 'Gravadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 65
      Top = 275
      Width = 128
      Height = 21
      Caption = 'N'#250'mero de S'#233'rie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtID: TEdit
      Tag = 1
      Left = 199
      Top = 48
      Width = 44
      Height = 23
      BorderStyle = bsNone
      Color = 14869218
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
    end
    object edtTitulo: TEdit
      Tag = 2
      Left = 199
      Top = 77
      Width = 421
      Height = 23
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 14869218
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object cbxArtista: TComboBox
      Left = 199
      Top = 106
      Width = 421
      Height = 29
      CharCase = ecUpperCase
      Color = 14869218
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'COMBOBOX1'
    end
    object dtpLancamento: TDateTimePicker
      Left = 199
      Top = 141
      Width = 111
      Height = 29
      Date = 45579.000000000000000000
      Time = 0.588420648149622100
      Color = 14869218
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object dtpAquisicao: TDateTimePicker
      Left = 199
      Top = 176
      Width = 111
      Height = 29
      Date = 45579.000000000000000000
      Time = 0.588420648149622100
      Color = 14869218
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edtProdutor: TEdit
      Tag = 2
      Left = 199
      Top = 211
      Width = 421
      Height = 23
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 14869218
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object cbxGravadora: TComboBox
      Left = 199
      Top = 240
      Width = 218
      Height = 29
      CharCase = ecUpperCase
      Color = 14869218
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Text = 'COMBOBOX1'
    end
    object edtNumeroSerie: TEdit
      Tag = 2
      Left = 199
      Top = 275
      Width = 314
      Height = 23
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 14869218
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object chkStatus: TCheckBox
      Tag = 3
      Left = 199
      Top = 304
      Width = 97
      Height = 17
      Caption = 'Ativo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
  end
end
