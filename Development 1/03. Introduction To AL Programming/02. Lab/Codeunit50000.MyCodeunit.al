codeunit 50000 MyCodeunit
{
    trigger OnRun()
    begin
        LoopNo := 25;
        Message('The value of %1 is %2', LoopNo);
        YesOrNo := true;
        Message('The value of %1 is %2', 'YesOrNo', YesOrNo);
        Amount := 27.50;
        Message('The value of %1 is %2', 'Amount', Amount);
        "When Was It" := 20250521D;
        Message('The value of %1 is %2', 'When Was It', "When Was It");
        "What Time" := 153000T;
        Message('The value of %1 is %2', 'What Time', "What Time");
        Description := 'Now is the time.';
        Message('The value of %1 is %2', 'Description', Description);
        "Code Number" := 'abc 123 x';
        Message('The value of %1 is %2', 'Code Number', "Code Number");
        Ch := 65;
        MESSAGE('The value of %1 is %2', 'Ch', Ch);
        Ch := 'A';
        MESSAGE('The value of %1 is %2', 'Ch', Ch);
        Message('The value of %1 is %2', 'Color', Color);
    end;

    var
        LoopNo: Integer;
        YesOrNo: Boolean;
        Amount: Decimal;
        "When Was It": Date;
        "What Time": Time;
        Description: Text[30];
        "Code Number": Code[10];
        Ch: Char;
        Color: Option Red,Orange,Yellow,Green,Blue,Violet;
}