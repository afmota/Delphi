program SWHOrcamentos;

uses
  Vcl.Forms,
  Login in 'Login.pas' {form_login};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tform_login, form_login);
  Application.Run;
end.
