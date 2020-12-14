program Project7;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainUnit in 'MainUnit.pas' {fmMain},
  NotificationUnit in 'NotificationUnit.pas' {fmNotification};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmNotification, fmNotification);
  Application.Run;
end.
