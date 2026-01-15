query 50000 SimpleItem
{
    QueryType = Normal;
    Caption = 'Simple Item';
    Description = 'A simple item query demonstration.';

    elements
    {
        dataitem(Item; Item)
        {
            column(No_; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Base_Unit_of_Measure; "Base Unit of Measure")
            {
            }
            column(Unit_Cost; "Unit Cost")
            {
            }
            filter(Item_Category_Code; "Item Category Code")
            {
            }
            filter(Inventory; Inventory)
            {
            }
            filter(Inventory_Posting_Group; "Inventory Posting Group")
            {
            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}