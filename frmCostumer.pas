unit frmCostumer;

interface
uses
 { System Units }
System.SysUtils, System.Types, System.UITypes, System.Classes,
System.Variants,
 { FMX Units }
FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
FMX.Layouts, FMX.StdCtrls, FMX.Edit,
 { App Units }
fieldClasses, srcCostumer, FMX.Controls.Presentation;

type

TUICostumer = class(TForm)
 vstack: TFlowLayout;
 save: TButton;

 {State}
 private
 var
 costumer: srcCostumer.TCostumer;
 procedure populate_vstack;
 {Setters}
 {Getters}
 {Event Handlers}
 procedure handleInputError(Sender: TObject);

 {Interface}
 public
 constructor CreateNew(AOwner: TComponent; Dummy: NativeInt = 0); override;
 destructor Destroy; override;
 {Properties}

end;

var
  UICostumer: TUICostumer;

implementation
{$R *.fmx}

constructor TUICostumer.CreateNew(AOwner: TComponent; Dummy: NativeInt);
begin
inherited Create(AOwner);
self.Caption := 'Costumer';
self.costumer := TCostumer.Create; // instantiate TCostumer
self.costumer.onInputError := self.handleInputError;
self.save.onClick := self.costumer.handleSave;
populate_vstack;
end; {end TUICostumer.CreateNew}

destructor TUICostumer.Destroy;
begin
try
costumer.free;
except
on E: Exception do
showMessage(E.Message);
end;
end; {end TUICostumer.Destroy}

procedure TUICostumer.handleInputError(Sender: TObject);
begin
showMessage('there was a fucking error');
end; {end TUICostumer.handleInputError}

procedure TUICostumer.populate_vstack;
var
anedit: FMX.Edit.TEdit;
fields: fieldClasses.TFieldsList;
begin

anedit := Tedit.Create(self);
anedit.Text := 'hello';
vstack.AddObject(anedit);

fields := costumer.getFields(['name', 'age', 'country', 'height']);
for var field in fields do
begin
  anedit := TEdit.Create(self);
  anedit.Name := field.name;
  anedit.Text := field.value;
  anedit.OnChangeTracking := costumer.handleChange;
  vstack.AddObject(anEdit);
end;
setLength(fields, 0);
fields := nil;
end; {end TUICostumer.populate_vstack}

end.
