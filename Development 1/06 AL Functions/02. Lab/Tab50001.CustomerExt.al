tableextension 50001 CustomerExt extends Customer
{
    fields
    {
        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    procedure UpdateCreditLimit(var NewCreditLimit: Decimal)
    begin

    end;

    procedure CalculateCreditLimit(): Decimal
    begin

    end;
}
