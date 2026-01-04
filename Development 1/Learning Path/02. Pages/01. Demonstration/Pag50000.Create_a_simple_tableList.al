page 50000 VehicleList
{
    PageType = List;
    ApplicationArea = All;
    Caption = 'Vehicle List';
    UsageCategory = Lists;
    SourceTable = Vehicle;
    CardPageId = Vehicle;

    layout
    {
        area(Content)
        {
            repeater(Group)
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