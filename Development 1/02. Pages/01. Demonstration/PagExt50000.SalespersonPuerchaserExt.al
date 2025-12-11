pageextension 50001 SalespersonPuerchaserExt extends "Salespersons/Purchasers"

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
        }
    }
}