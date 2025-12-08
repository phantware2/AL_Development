table 50002 Course
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; Code; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(20; Name; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(30; Description; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(40; Type; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "Instructor Led","e-Learning","Remote Training ";
        }
        field(50; Duration; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(60; Price; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70; Active; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(80; Difficulty; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(90; "Passing Rate"; Integer)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}