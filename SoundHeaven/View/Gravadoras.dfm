inherited frmGravadoras: TfrmGravadoras
  Caption = 'Gravadoras'
  ClientHeight = 276
  ExplicitHeight = 315
  TextHeight = 15
  inherited pnlCampos: TPanel
    Height = 227
    ExplicitHeight = 227
    inherited edtID: TEdit
      OnKeyPress = edtIDKeyPress
    end
    inherited edtNome: TEdit
      OnChange = edtNomeChange
    end
  end
end
