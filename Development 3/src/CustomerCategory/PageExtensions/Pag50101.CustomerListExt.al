pageextension 50101 "PW CustomerListExt" extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action("PW Assign Default Category")
            {
                Image = ChangeCustomer;
                ApplicationArea = All;
                Caption = 'Assign Default Category to all Customers';
                ToolTip = 'Assigns the Default Category to all Customers';

                trigger OnAction();
                var
                // CustomerCategoryMgt: Codeunit "PW Customer Category Mgt";
                begin
                    // CustomerCategoryMgt.AssignDefaultCategory();
                end;
            }
        }
        addlast(Promoted)
        {
            group(PKTCustomerCategory)
            {
                Caption = 'Customer Category';
                actionref(PWAssignDefaultCategory; "PW Assign Default Category")
                {
                }
            }
        }
    }
    views
    {
        addlast
        {
            view(CustomersWithoutCategory)
            {
                Caption = 'Customers without Category assigned';
                Filters = where("PW Customer Category Code" = filter(''));
            }
        }
    }
}