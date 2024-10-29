object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Soundhaven'
  ClientHeight = 561
  ClientWidth = 864
  Color = clBtnFace
  Constraints.MinHeight = 567
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  WindowState = wsMaximized
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 542
    Width = 864
    Height = 19
    Panels = <>
  end
  object MainMenu: TMainMenu
    Tag = 2
    Left = 808
    Top = 8
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      OnClick = MenuClick
      object Estilos1: TMenuItem
        Tag = 1
        Caption = 'Estilos'
        OnClick = MenuClick
      end
      object Artistas1: TMenuItem
        Tag = 2
        Caption = 'Artistas'
        OnClick = MenuClick
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
