unit srcCostumer;

interface
uses
 { System Units }
 { Local Units }
fieldClasses;

type
 {Event Emitter}
 TOnInputError = procedure(Sender: TObject) of object;
 TOnEdited = procedure of object;

 TCostumer = class(TObject)

 {State}
 private
 const
 nFields = 4;
 var
 FFields: TFields;
 FName: TField;
 FAge: TField;
 FCountry: TField;
 FHeight: TField;
 FEdited: Boolean;
 FNew: Boolean;

 {Setters}
 procedure setFields(const name, value: string);
 {Getters}

 {Interface}
 public
 constructor Create(const cid: string = '');
 destructor Destroy; override;
 function getFields(const names: array of string): TFieldsList;
 {Properties}
 {Event Handlers}
 procedure handleChange(Sender: TObject);
 procedure handleSave(Sender: TObject);
 var {Event Emitters}
 onInputError: TOnInputError;
 onEdited: TOnEdited;

end;


implementation
uses
{ System Units }
System.SysUtils,
{ FMX Units }
FMX.Dialogs, FMX.Controls, FMX.Edit;

{ Constructor }
constructor TCostumer.Create(const cid: string = '');
begin
// Instantiating TField and populating TFields
try
FFields := TFields.Create(nFields);
FName := TField.Create('name', 'pavlos');
FFields.Add(FName.name, FName);
FAge := TField.Create('age', '28');
FFields.Add(FAge.name, FAge);
FCountry := TField.Create('country', 'Greece');
FFields.Add(FCountry.name, FCountry);
FHeight := TField.Create('height', '1.82');
FFields.Add(FHeight.name, FHeight);
except
on E: Exception do
showMessage(E.Message);
end;
end;

{ Destructor }
destructor TCostumer.Destroy;
begin
try
for var field in FFields.values do
 Field.Free; // Releasing TFields
freeAndNil(FFields);
except
on E: Exception do
showMessage(E.Message);
end;
end;

{ TCostumer.getFields }
function TCostumer.getFields(const names: array of string): TFieldsList;
var requestedFields: TFieldsList;
begin
setLength(requestedFields, Length(Names));
for var i := Low(names) to High(names) do
requestedFields[i] := FFields[names[i]];
Result := requestedFields;
end;

{ TCostumer.setFields }
procedure TCostumer.setFields(const name, value: string);
begin

try
self.FFields[name].value := value;
except
on E: Exception do
showMessage(E.Message);
end;
self.onInputError(self.FFields[name]);
end;


{TCostumer.handleChange}
procedure TCostumer.handleChange(Sender: TObject);
begin

if Sender is TEdit then
self.setFields(TEdit(Sender).Name, TEdit(Sender).Text);

end;

{TCostumer.handleSave}
procedure TCostumer.handleSave;
begin
showMessage('iam about to be saved');
end;

end.
