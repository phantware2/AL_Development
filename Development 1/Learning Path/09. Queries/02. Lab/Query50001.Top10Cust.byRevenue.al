query 50001 "Top 10 Cust. by Revenue"
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {
            }
            filter(Customer_Posting_Group; "Customer Posting Group")
            {
            }
            dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Customer."No.";
                DataItemTableFilter = "Document Type" = filter(Invoice | "Credit Memo");

                filter(Vendor_Posting_Group; "Vendor Posting Group")
                {
                }
                column(Name; Name)
                {
                }
                column(City; City)
                {
                }
                filter(Blocked; Blocked)
                {
                }
            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}