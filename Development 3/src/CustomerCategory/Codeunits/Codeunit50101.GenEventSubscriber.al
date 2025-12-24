codeunit 50101 "PW General Event Subscribers"
{

    SingleInstance = true;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeCheckCustBlockage, '', false, false)]
    local procedure OnBeforeCheckCustBlockageByCategory(SalesHeader: Record "Sales Header"; CustCode: Code[20]; var ExecuteDocCheck: Boolean; var IsHandled: Boolean; var TempSalesLine: Record "Sales Line" temporary)

    var
        Customer: Record Customer;
        CustomerCategory: Record "PW Customer Category";
        CustBlockByCategoryLbl: Label 'Customer %1 is blocked by category';
    begin
        IsHandled := true;
        if Customer.Get(CustCode) then begin
            if Customer."PW Customer Category Code" <> '' then begin
                CustomerCategory.Get(Customer."PW Customer Category Code");
                if CustomerCategory.Blocked then
                    Error(CustBlockByCategoryLbl, Customer."No.");
            end;
        end;
    end;
}