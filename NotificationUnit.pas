unit NotificationUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Notification, System.Actions, FMX.ActnList, FMX.StdCtrls, FMX.Edit,
  FMX.EditBox, FMX.SpinBox, FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation;

type
  TfmNotification = class(TForm)
    tbTop: TToolBar;
    lbNotification: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    sbInterval: TSpinBox;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    NotificationCenter1: TNotificationCenter;
    aBackToMainForm: TAction;
    aNotify: TAction;
    procedure aBackToMainFormExecute(Sender: TObject);
    procedure aNotifyExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  var fmNotification: TfmNotification;
implementation

{$R *.fmx}

procedure TfmNotification.aBackToMainFormExecute(Sender: TObject);
begin
Close;
end;

procedure TfmNotification.aNotifyExecute(Sender: TObject);
var
myNotification: TNotification;
begin
MyNotification:= NotificationCenter1.CreateNotification;
MyNotification.AlertBody:='повторить стих';
MyNotification.FireDate:=Now+EncodeTime(0,Round(sbInterval.Value),10,0);
NotificationCenter1.ScheduleNotification(MyNotification);
MyNotification.Free;
end;

end.
