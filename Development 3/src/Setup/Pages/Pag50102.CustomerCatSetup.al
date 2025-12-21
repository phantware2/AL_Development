page 50102 "PW Customer Category Setup"
{
    Caption = 'Customer Category Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "PW Customer Category Setup";
    InsertAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Minimum Accepted Vendor Rate"; Rec."Minimum Accepted Vendor Rate")
                {
                }
                field("Gift Tolerance Qty"; Rec."Gift Tolerance Qty")
                {
                }
                field("Default Charge (Item)"; Rec."Default Charge (Item)")
                {
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}