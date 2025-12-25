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

    // Here is the procedure that calculates the last sales line number for a new document:
    local procedure GetLastSalesDocumentLineNo(SalesHeader: Record "Sales Header"): Integer
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindLast() then
            exit(SalesLine."Line No.")
        else
            exit(0);
    end;

    //Here is the business logic that handles the gift assignment logic:
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'Quantity', false, false)]
    local procedure CheckGiftEligibility(var Rec: Record "Sales Line")
    var
        GiftCampaign: Record "PW Gift Campaign";
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
        Handled: Boolean;
    begin
        if (Rec.Type = Rec.Type::Item) then begin
            if (Customer.Get(Rec."Sell-to Customer No.")) then begin
                SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                GiftCampaign.SetRange(CustomerCategoryCode, Customer."PW Customer Category Code");
                GiftCampaign.SetRange(ItemNo, Rec."No.");
                GiftCampaign.SetFilter(StartingDate, '<=%1', SalesHeader."Order Date");
                GiftCampaign.SetFilter(EndingDate, '>=%1', SalesHeader."Order Date");
                GiftCampaign.SetRange(Inactive, false);
                GiftCampaign.SetFilter(MinimumOrderQuantity, '>%1', Rec.Quantity);
                if GiftCampaign.FindFirst() then begin
                    //Integration event raised

                end;
            end;
        end;
    end;

    local procedure DoGiftCheck(var SalesLine: Record "Sales Line"; var GiftCampaign: Record "PW Gift Campaign"; var Handled: Boolean)
    var
        CustomerCatSetup: Record "PW Customer Category Setup";
        GiftAlert: Label 'Attention: there is an active promotion for item %1. if you buy %2 you can have a gift of %3';
    begin
        If Handled then
            exit;

        CustomerCatSetup.Get();
        if (SalesLine.Quantity < GiftCampaign.MinimumOrderQuantity) and (GiftCampaign.MinimumOrderQuantity - SalesLine.Quantity <= CustomerCatSetup."Gift Tolerance Qty") then
            Message(GiftAlert, SalesLine."No.", Format(GiftCampaign.MinimumOrderQuantity), Format(GiftCampaign.GiftQuantity));
    end;

    // The integration events defined in this codeunit are as follows:

    [IntegrationEvent(true, false)]
    local procedure OnBeforeFreeGiftSalesLineAdded(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var Handled: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterFreeGiftSalesLineAdded(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line")
    begin
    end;
}