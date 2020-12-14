unit MainUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl,
  System.Actions, FMX.ActnList;

type
  TfmMain = class(TForm)
    tbTop: TToolBar;
    lbTop: TLabel;
    tcMain: TTabControl;
    tiFull: TTabItem;
    tiEveryOtherLine: TTabItem;
    tiFirstWords: TTabItem;
    meFull: TMemo;
    meEveryOtherLine: TMemo;
    meFirstWords: TMemo;
    sbShowNotificationForm: TSpeedButton;
    ActionList1: TActionList;
    aShowNotificationForm: TAction;
    procedure tcMainChange(Sender: TObject);
    procedure aShowNotificationFormExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.fmx}

uses NotificationUnit;

procedure TfmMain.aShowNotificationFormExecute(Sender: TObject);
begin
fmNotification.Show;
end;

procedure TfmMain.tcMainChange(Sender: TObject);
var
Str: string;
i: integer;
j: integer;
GotFirst: boolean;
begin
if tcMain.ActiveTab = tiFirstWords then
begin
meFirstWords.Lines.Clear;
for i:= 0 to meFull.Lines.Count-1 do
begin
Str:= meFull.Lines[i];
GotFirst:= false;
for j:= Low(Str) to High(Str) do
begin
if GotFirst and (Str[j] <> ' ') then
Str[j]:= 'x';
if not GotFirst and (Str[j] = ' ') then
GotFirst:= true;
end;
meFirstWords.Lines.Add(Str);
end;
end;
begin
if tcMain.ActiveTab = tiFirstWords then
begin
end;
if tcMain.ActiveTab = tiEveryOtherLine then
begin
meEveryOtherLine.Lines.Clear;
for i:= 0 to meFull.Lines.Count-1 do
begin
Str:= meFull.Lines[i];
if (i mod 2) = 1 then
begin
for j:= Low(Str) to High(Str) do
begin
if Str[j] <> ' ' then
Str[j]:= 'x';
end;
end;
meEveryOtherLine.Lines.Add(Str);
end;
end;
end;
end;
end.
