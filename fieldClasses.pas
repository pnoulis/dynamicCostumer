unit fieldClasses;

interface
uses
{ System Units }
System.Generics.Collections;

type
TField = class;
TFields = System.Generics.Collections.TDictionary<string, TField>;
TFieldsList = array of TField;


TField = class(TObject)

 { State }
 private var
 FName: string;
 FValue: string;

 { Interface }
 public { Methods }
 constructor Create(const name, value: string);

 public { Properties }
 property name: string read FName write FName;
 property value: string read FValue write FValue;

end;

implementation

{ TField }

constructor TField.Create(const name, value: string);
begin
self.name := name;
self.value := value;
end;

end.
