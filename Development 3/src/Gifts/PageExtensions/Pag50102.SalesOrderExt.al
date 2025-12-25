pageextension 50102 "PW SalesOrderExt" extends "Sales Order"
{
    actions
    {
        addlast(Processing)
        {
            action("PKT Add Free Gifts")
            {
                Caption = 'Add Free Gifts';
                ToolTip = 'Adds Free Gifts to the current Sales Order based on active Campaigns';
                ApplicationArea = All;
                Image = Add;

                trigger OnAction()
                var
                // GiftManagement: Codeunit "PW Gift Management";
                begin
                    // GiftManagement.AddGifts(Rec);
                end;
            }
        }
        addlast(Promoted)
        {
            group(PKTGifts)
            {
                Caption = 'Gifts';
                actionref(PKTAddFreeGifts; "PKT Add Free Gifts")
                {
                }
            }
        }
    }
}
