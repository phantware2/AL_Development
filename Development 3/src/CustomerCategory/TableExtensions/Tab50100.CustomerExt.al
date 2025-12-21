tableextension 50100 "PW CustomerExt" extends Customer
{
    fields
    {
        field(50100; "PW Customer Category Code"; Code[20])
        {
            TableRelation = "PW Customer Category";
            Caption = 'Customer Category Code';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                CustomerCategory: Record "PW Customer Category";
                BlockedErr: Label 'This category is blocked.';
            begin
                if CustomerCategory.Get("PW Customer Category Code") then begin
                    if CustomerCategory.Blocked then
                        Error(BlockedErr);
                end;
            end;
        }
    }
    keys
    {
        key(PWCustomerCategory; "PW Customer Category Code")
        {
        }
    }
}