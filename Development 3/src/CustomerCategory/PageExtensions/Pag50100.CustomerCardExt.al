pageextension 50100 "PW CustomerCardExt" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("PW Customer Category Code"; Rec."PW Customer Category Code")
            {
                ToolTip = 'Customer Category';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addlast("F&unctions")
        {
            action("PW Assign default category")
            {
                Image = ChangeCustomer;
                ApplicationArea = All;
                Caption = 'Assign Default Category';
                ToolTip = 'Assigns a Default Category to the current Customer';

                trigger OnAction();
                var
                    CustomerCategoryMgt: Codeunit "PW Customer Category Mgt";
                begin
                    CustomerCategoryMgt.AssignDefaultCategory(Rec."No.");
                end;
            }
        }
        addlast(Promoted)
        {
            actionref(PWAssignDefaultCategory; "PW Assign default category")
            {
            }

        }
    }
}
