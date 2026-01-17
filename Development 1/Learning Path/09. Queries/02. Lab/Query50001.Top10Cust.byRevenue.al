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
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}