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
                caption = 'Assign Default Category';
                ToolTip = 'Assigns the Default Category to all Customers';

                trigger OnAction();
                var
                    CustomerCategoryMgt: Codeunit "PW Customer Category Mgt";
                begin
                    CustomerCategoryMgt.AssignDefaultCategory();
                end;
            }
            action(GetTotalCustomersWithoutCategory)
            {
                Image = ChangeCustomer;
                ApplicationArea = All;
                caption = 'Get Total Customers Without Category';
                ToolTip = 'Gets the total number of customers without a category assigned';

                trigger OnAction();
                var
                    CustomerCategoryMgt: Codeunit "PW Customer Category Mgt";
                begin
                    CustomerCategoryMgt.GetTotalCustomersWithoutCategory();
                end;
            }
        }
        addafter(Category_Process)
        {
            group(PWCategory_Process)
            {
                Caption = 'Categories Process';
                actionref(PWAssignDefaultCategory; "PW Assign Default Category")
                {
                }
                actionref(GetTotalCustomersWithoutCategory_Promoted; GetTotalCustomersWithoutCategory)
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