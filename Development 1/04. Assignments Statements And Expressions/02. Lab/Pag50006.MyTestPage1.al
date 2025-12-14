page 50006 "My Test Page 1"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    // SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(General)
            {
                group(Input)
                {
                    field(Value1; Value1)
                    {
                        ApplicationArea = All;
                    }
                    field(Value12; Value12)
                    {
                        ApplicationArea = All;
                    }
                }
                group(Output)
                {
                    field(Result; Result)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Execute)
            {

                trigger OnAction()
                begin
                    Result := Value1 > Value12;
                end;
            }
        }
    }

    var
        Value1, Value12 : Integer;
        Result: Boolean;
}