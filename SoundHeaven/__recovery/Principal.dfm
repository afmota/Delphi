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
  Menu = MainMenu1
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 808
    Top = 8
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Artistas1: TMenuItem
        Tag = 1
        Caption = 'Artistas'
        OnClick = MenuClick
      end
      object lbuns1: TMenuItem
        Tag = 2
        Caption = 'Gravadoras'
        OnClick = MenuClick
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
