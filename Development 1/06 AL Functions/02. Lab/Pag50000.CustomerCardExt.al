pageextension 50002 CustomerCardExt extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Customer")
        {
            action(UpdateCreditLimit)
            {
                Caption = 'Update Credit Limit';
                ApplicationArea = All;
                Image = CalculateCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    CallUpdateCreditLimit;
                end;
            }
        }
    }

    local procedure CallUpdateCreditLimit()
    var
        CreditLimitCalculated, CreditLimitActual : Decimal;
    begin
        CreditLimitCalculated := Rec.CalculateCreditLimit()
    end;

    var
        Text90001: Label 'Are you sure that you want to set the %1 to %2?';
        Text90002: Label 'The credit limit was rounded to %1 to comply with company policies.';
        Text90003: Label 'The credit limit is up to date.';
}