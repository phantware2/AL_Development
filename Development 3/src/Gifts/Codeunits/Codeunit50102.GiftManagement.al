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

    local procedure AddFreeGiftSalesLine(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var Handled: Boolean)
    var
        GiftCampaign: Record "PW Gift Campaign";
        Customer: Record Customer;
        SalesLineGift: Record "Sales Line";
        LineNo: Integer;
    begin
        if Handled then
            exit;

        Customer.Get(SalesLine."Sell-to Customer No.");
        GiftCampaign.SetRange(CustomerCategoryCode, Customer."PW Customer Category Code");
        GiftCampaign.SetRange(ItemNo, SalesLine."No.");
        GiftCampaign.SetFilter(StartingDate, '<=%1', SalesHeader."Order Date");
        GiftCampaign.SetFilter(EndingDate, '>=%1', SalesHeader."Order Date");
        GiftCampaign.SetRange(Inactive, false);
        GiftCampaign.SetFilter(MinimumOrderQuantity, '<=%1', SalesLine.Quantity);
        if GiftCampaign.FindFirst() then begin
            //Active promo found. We need to insert a new Sales Line
            LineNo := GetLastSalesDocumentLineNo(SalesHeader);
            SalesLineGift.Init();
            SalesLineGift.TransferFields(SalesLine);
            SalesLineGift."Line No." := LineNo + 10000;
            SalesLineGift.Validate(Quantity, GiftCampaign.GiftQuantity);
            SalesLineGift.Validate("Line Discount %", 100);
            if SalesLineGift.Insert() then
                Message('free gift added');
        end;
    end;
}