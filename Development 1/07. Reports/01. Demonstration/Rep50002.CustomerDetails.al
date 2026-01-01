report 50002 "Customer Details"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = CustomerDetails;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(ColumnName; SourceFieldName)
            {

            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Customer No." = field("No.");
                column(ColumnName; SourceFieldName)
                {

                }
            }
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }

    rendering
    {
        layout(CustomerDetails)
        {
            Type = RDLC;
            LayoutFile = './Development 1/07. Reports/01. Demonstration/layout/CustomerDetails.rdl';
        }
    }
}