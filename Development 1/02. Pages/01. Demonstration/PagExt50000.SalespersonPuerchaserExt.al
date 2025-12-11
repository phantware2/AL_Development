pageextension 50001 SalespersonPurchaserExt extends "Salespersons/Purchasers"

{
    layout
    {
        // Add changes to page layout here
        addafter("Commission %")
        {
            field(Sales; Rec.Sales)
            {
                ApplicationArea = All;
            }
            field("Type Filter"; Rec."Type Filter")
            {
                ApplicationArea = All;
            }
        }
    }
}