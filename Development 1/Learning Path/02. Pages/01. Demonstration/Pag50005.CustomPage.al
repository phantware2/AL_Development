page 50005 "Custom Page"
{
    PageType = Card;
    Caption = 'Custom Page';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Item;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Costing Method"; Rec."Costing Method")
                {
                    ApplicationArea = All;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                }
                field("Profit %"; Rec."Profit %")
                {
                    ApplicationArea = All;
                    ExtendedDatatype = Ratio;
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Inventory - List")
            {
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                RunObject = Report "Inventory - List";
            }
            action("Item Turnover")
            {
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                RunObject = page "Item Turnover";
            }
        }
    }
}