codeunit 50100 "PW Customer Category Mgt"
{
    trigger OnRun()
    begin

    end;

    procedure CreateDefaultCategory()
    var
        CustomerCategory: Record "PW Customer Category";
        DefaultCodeTxt: Label 'DEFAULT';
        DefaultDescriptionTxt: Label 'Default Customer Category';
    begin
        CustomerCategory.Code := DefaultCodeTxt;
        CustomerCategory.Description := DefaultDescriptionTxt;
        CustomerCategory.Default := true;
        if CustomerCategory.Insert then
            Message('Default Customer Category created successfully.')
        else
            Message('Default Customer Category already exists.');
    end;

    procedure AssignDefaultCategory(CustomerCode: Code[20])
    var
        Customer: Record Customer;
        CustomerCategory: Record "PW Customer Category";
    begin
        // Set default category to the customer
        Customer.Get(CustomerCode);
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindFirst() then begin
            Customer.Validate("PW Customer Category Code", CustomerCategory.Code);
            Customer.Modify();
            Message('Default Category assigned to Customer %1.', Customer."No.");
        end;
    end;

    procedure AssignDefaultCategory()
    var
        Customer: Record Customer;
        customerCategory: Record "PW Customer Category";
    begin
        //Set default category for ALL Customer 
        customerCategory.SetRange(Default, true);
        if customerCategory.FindFirst() then begin
            Customer.SetFilter("PW Customer Category Code", '%1', '');
            Customer.ModifyAll("PW Customer Category Code", customerCategory.Code, true);
            Message('Default Category assigned to all Customers without Category.');
        end;
    end;

    procedure GetTotalCustomersWithoutCategory(): Integer
    var
        Customer: Record Customer;
    begin
        Customer.SetRange("PW Customer Category Code", '');
        // exit(Customer.Count());
        Message('Total Customers without Category: %1', Customer.Count());
    end;
}