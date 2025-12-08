/* The following demonstration shows how to create a table to record sales transactions and create fields that have a table relation to other tables. 

You need to create a new table, named Sales Transaction. This table must record the salesperson of a particular transaction. The Salesperson/Purchaser table holds the record of all salespersons and purchasers in CRONUS International, Ltd. Therefore, your Sales Transaction table sets a table relation for the Salesperson Code field in the Sales Transaction table to relate to the Salesperson/Purchaser table. 

The Sales Transaction table must also to record sales transactions of Items, Resources, or G/L Accounts. The Type field is used to differentiate this. Depending on the Type selected, the No. field must relate to different tables, the Item table, the Resource table, the G/L Account table, or the Standard Text table. The following steps show how to set a conditional table relation on the No. field.  

Note: Selecting Filter in the Type column enables users to filter instances where Commission % is greater than zero. For this scenario, only the Filter option can be used. Const and Field options locate exact matches only by using the equal to operator. 
*/

table 50001 "Sales Transaction"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(20; "Salesperson Code"; Code[10])
        {
            DataClassification = CustomerContent;

            TableRelation = "Salesperson/Purchaser" where("Commission %" = filter(> 0));
        }
        field(30; Type; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "G/L Account",Item,Resource,"Standard Text";
        }
        field(40; "No."; Code[20])
        {
            DataClassification = CustomerContent;

            TableRelation = if (Type = const(Item)) Item
            else if (Type = const(Resource)) Resource
            else if (Type = const("G/L Account")) "G/L Account"
            else
            "Standard Text";
        }
        field(50; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Line No.")
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