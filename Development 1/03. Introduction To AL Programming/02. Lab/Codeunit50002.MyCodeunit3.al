codeunit 50002 MyCodeunit3
{
    trigger OnRun()
    begin
        Int1 := 25 DIV 3;
        Message('The value of %1 is %2', 'Int1', Int1);
        Int2 := 25 MOD 3;
        Message('The value of %1 is %2', 'Int2', Int2);
        IntResult := Int1 * 3 + Int2;
        MESSAGE('The value of %1 is %2', 'IntResult', IntResult);
        Amt1 := 25 / 3;
        Message('The value of %1 is %2', 'Amt1', Amt1);
        Amt2 := 0.00000000000000001;
        AmtResult := (Amt1 - Int1) * 3 + Amt2;
        MESSAGE('The value of %1 is %2', 'AmtResult', AmtResult);
    end;

    var
        Int1, Int2, IntResult : Integer;
        Description: Text[30];
        Amt1, Amt2, AmtResult : Decimal;

}