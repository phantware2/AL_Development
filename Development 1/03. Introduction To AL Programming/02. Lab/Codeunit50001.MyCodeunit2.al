codeunit 50001 MyCodeunit2
{
    trigger OnRun()
    begin
        MaxChar := MaxStrLen(Description);
        Message('The value of %1 is %2', 'Maxchar', MaxChar);
    end;

    var
        MaxChar: Integer;
        Description: Text[30];

}