object frmModel: TfrmModel
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Model'
  ClientHeight = 418
  ClientWidth = 659
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object pnlBotoes: TPanel
    Left = 0
    Top = 0
    Width = 659
    Height = 49
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnNovo: TButton
      Left = 88
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnPesquisar: TButton
      Left = 169
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
    object btnAtualizar: TButton
      Left = 250
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 2
      OnClick = btnAtualizarClick
    end
    object btnCancelar: TButton
      Left = 331
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object btnSalvar: TButton
      Left = 412
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 4
      OnClick = btnSalvarClick
    end
    object btnSair: TButton
      Left = 493
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 5
      OnClick = btnSairClick
    end
  end
  object pnlCampos: TPanel
    Left = 0
    Top = 49
    Width = 659
    Height = 369
    Align = alClient
    Color = clWhite
    Enabled = False
    ParentBackground = False
    TabOrder = 1
  end
end
