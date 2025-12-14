page 50007 "Test Statement Page"
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
                    field(Quantity; Quantity)
                    {
                        ApplicationArea = All;
                    }
                    field(UnitPrice; UnitPrice)
                    {
                        ApplicationArea = All;
                        MinValue = 0;
                    }
                }
                group(Output)
                {
                    field(Result; Result)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field(TotalSales; TotalSales)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field(TotalCredits; TotalCredits)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field(GrandTotal; GrandTotal)
                    {
                        ApplicationArea = All;
                        Editable = false;
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
                    // Result := Value1 > Value12;
                end;
            }
        }
    }

    var
        Quantity: Integer;
        UnitPrice, TotalSales, TotalCredits, GrandTotal, Result : Decimal;
}