codeunit 50240 "BSCL BSB Animal Hai" implements "BSB Animal Interface"
{
    procedure GibtLaut()
    begin
        message(LautTxt);
    end;

    procedure Streichelbar(): Boolean
    begin
        Message('Steichelbar');
        exit(false);
    end;

    procedure Heranrufen()
    begin
        Message('Der Hai kommt...');
    end;

    var
        LautTxt: Label 'Platsch';
}