/* The following demonstration shows how to create a simple table, set the primary  key, create secondary keys, and add data to the table. The purpose of the table is to record information about vehicles. This includes the model, serial number, transmission type, and date of manufacturing.  */

table 50000 "Vehicle"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; Model; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(20; "Serial No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(30; Descripion; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(40; Transmission; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Automatic,"4-Speed","5-Speed";
        }
        field(50; "List Price"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(60; "Manufacturing Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; Model, "Serial No.")
        {
            Clustered = true;
        }
        key(SK; "Manufacturing Date", Transmission) { }
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