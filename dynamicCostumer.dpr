program dynamicCostumer;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmMaster in 'frmMaster.pas' {Master},
  frmCostumer in 'frmCostumer.pas' {UICostumer},
  srcCostumer in 'srcCostumer.pas',
  fieldClasses in 'fieldClasses.pas',
  types in 'types.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMaster, Master);
  Application.Run;
end.
