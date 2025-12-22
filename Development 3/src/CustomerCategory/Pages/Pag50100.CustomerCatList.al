page 50100 "PW Customer Category List"
{
    Caption = 'Customer Category List';
    SourceTable = "PW Customer Category";
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageId = "PW Customer Category Card";
    AdditionalSearchTerms = 'ranking, categorization';
    AboutTitle = 'About Customer Categories';
    AboutText = 'Here you can define the **categories** for your customers. You can then categorize your customers via the **Customer Card**.';
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Default; Rec.Default)
                {
                }
                field(TotalCustomersForCategory; Rec.TotalCustomersForCategory)
                {
                    ToolTip = 'Total Customers for Category';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Create Default Category")
            {
                Caption = 'Create default category';
                ToolTip = 'Create default category';
                Image = CreateForm;
                trigger OnAction();
                var
                    CustManagement: Codeunit "PW Customer Category Mgt";
                begin
                    CustManagement.CreateDefaultCategory();
                end;
            }
        }
        area(Promoted)
        {
            group(PKTCustomerCategory)
            {
                Caption = 'Customer Category';
                actionref(CreateDefaultCategory; "Create Default Category")
                {
                }
            }
        }
    }
}