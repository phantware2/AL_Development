pageextension 50002 CustomerCardExt extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast("F&unctions")
        {
            action(UpdateCreditLimit)
            {
                Caption = 'Update Credit Limit';
                ApplicationArea = All;
                Image = CalculateCost;
                trigger OnAction()
                begin
                    CallUpdateCreditLimit;
                end;
            }
        }
        addlast(Promoted)
        {
            actionref(UpdateCreditLimit1; UpdateCreditLimit)
            {
            }

        }
    }


    local procedure CallUpdateCreditLimit()
    var
        CreditLimitCalculated, CreditLimitActual : Decimal;
    begin
        CreditLimitCalculated := Rec.CalculateCreditLimit;
        IF CreditLimitCalculated = Rec."Credit Limit (LCY)" THEN BEGIN
            MESSAGE(Text90003);
            EXIT;
        END;
        IF GUIALLOWED AND NOT CONFIRM(
          Text90001,
          FALSE,
          Rec.FIELDCAPTION("Credit Limit (LCY)"),
          CreditLimitCalculated)
        THEN
            EXIT;
        CreditLimitActual := CreditLimitCalculated;
        Rec.UpdateCreditLimit(CreditLimitActual);
        IF CreditLimitActual <> CreditLimitCalculated THEN
            MESSAGE(Text90002, CreditLimitActual);
    end;

    var
        Text90001: Label 'Are you sure that you want to set the %1 to %2?';
        Text90002: Label 'The credit limit was rounded to %1 to comply with company policies.';
        Text90003: Label 'The credit limit is up to date.';
}