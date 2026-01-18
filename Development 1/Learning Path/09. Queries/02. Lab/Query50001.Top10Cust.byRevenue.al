query 50001 "Top 10 Cust. by Revenue"
{
    QueryType = Normal;
    OrderBy = descending(Amount__LCY_);
    TopNumberOfRows = 10;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Customer_Posting_Group; "Customer Posting Group")
            {
            }

            dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Customer."No.";
                DataItemTableFilter = "Document Type" = filter(Invoice | "Credit Memo");

                column(Amount__LCY_; "Amount (LCY)")
                {
                    Method = Sum;
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