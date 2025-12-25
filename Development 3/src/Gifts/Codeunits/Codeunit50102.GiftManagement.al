codeunit 50102 "PW Gift Management"
{

    procedure AddGifts(var SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        Handled: Boolean;
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        //We exclude the generated gifts lines in order to avoid loops
        SalesLine.SetFilter("Line Discount %", '<>100');
        if SalesLine.FindSet() then
            repeat

            until SalesLine.Next() = 0;
    end;
}