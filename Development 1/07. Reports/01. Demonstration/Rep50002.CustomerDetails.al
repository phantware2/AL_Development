report 50002 "Customer Details"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = CustomerDetails;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(City; City)
            {
                IncludeCaption = true;
            }
            column(PhoneNo; "Phone No.")
            {
                IncludeCaption = true;
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Customer No." = field("No.");
                column(CustomerNo; "Customer No.")
                {
                    IncludeCaption = true;
                }
                column(PostingDate; "Posting Date")
                {
                    IncludeCaption = true;
                }
                column(DocumentType; "Document Type")
                {
                    IncludeCaption = true;
                }
                column(DocumentNo; "Document No.")
                {
                    IncludeCaption = true;
                }
                column(Description; Description)
                {
                    IncludeCaption = true;
                }
                column(AmountLCY; "Amount (LCY)")
                {
                    IncludeCaption = true;
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