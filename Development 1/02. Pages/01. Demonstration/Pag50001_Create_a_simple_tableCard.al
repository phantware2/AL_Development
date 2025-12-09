page 50001 Vehicle
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Vehicle;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                }
                field(Descripion; Rec.Descripion)
                {
                    ApplicationArea = All;
                }
                field(SerialNo; Rec."Serial No.")
                {
                    ApplicationArea = All;
                }
                field(Transmission; Rec.Transmission)
                {
                    ApplicationArea = All;
                }
                field(ListPrice; Rec."List Price")
                {
                    ApplicationArea = All;
                }
                field(ManufacturingDate; Rec."Manufacturing Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}