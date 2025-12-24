page 50009 TestMyCodeunits
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    // SourceTable = TableName;
    Caption = 'Test My Codeunit 4';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                // field(Name; NameSource)
                // {

                // }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                Image = Process;
                Caption = 'Run My Codeunit 4';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    myCodeunit4: Codeunit MyCodeunit4;
                begin
                    myCodeunit4.Run();
                end;
            }
        }
    }

    var
        myInt: Integer;
}