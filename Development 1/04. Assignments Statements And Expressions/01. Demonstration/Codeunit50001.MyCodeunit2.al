codeunit 50001 MyCodeunit2
{
    trigger OnRun()
    begin
        MaxChar := MaxStrLen(Description);
        Message('The value of %1 is %2', 'Maxchar', MaxChar);
        CodeA := 'HELLO THERE';
        TextA := 'How Are You? ';
        CodeB := CodeA + '! ' + TextA;
        // Description := 'The message is: ' + CodeB;
        Description := CopyStr('The message is: ' + CodeB, 1, MaxStrLen(Description));
        Message('The value of %1 is %2', 'Description', Description);
    end;

    var
        MaxChar: Integer;
        Description: Text[30];
        CodeA: Text[30];
        CodeB: Text[50];
        TextA: Text[50];

}