unit frmMaster;

interface

uses
  { System Units }
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  { FMX Units }
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  { App Units }
  frmCostumer, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TMaster = class(TForm)
  private
  public
  constructor Create(AOwner: TComponent); override;
  end;

var
  Master: TMaster;

implementation

{$R *.fmx}

{ TMaster }

constructor TMaster.Create(AOwner: TComponent);
var editableCostumer: frmCostumer.TUICostumer;
begin
  inherited Create(AOwner);
  self.Caption := 'App';

  try
    editableCostumer := frmCostumer.TUICostumer.CreateNew(self);
    editableCostumer.ShowModal;
  except
   on E: Exception do
   showMessage(E.Message);
  end;

end;

end.
