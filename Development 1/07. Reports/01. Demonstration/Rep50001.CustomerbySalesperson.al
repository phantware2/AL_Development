report 50001 "Customer by Salesperson"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = CustomerbySalesperson;

    dataset
    {
        dataitem("Salesperson/Purchaser"; "Salesperson/Purchaser")
        {
            PrintOnlyIfDetail = true;
            column(Code; Code)
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            dataitem(Customer; Customer)
            {
                DataItemLinkReference = "Salesperson/Purchaser";
                DataItemLink = "Salesperson Code" = field(Code);
                // DataItemTableView = sorting("Salesperson Code");

                column(CustNo; "No.")
                {
                    IncludeCaption = true;
                }
                column(CustName; Name)
                {
                    IncludeCaption = true;
                }
                column(CustCity; City)
                {
                    IncludeCaption = true;
                }
                column(CustPhoneNo; "Phone No.")
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
                    // field(Name; SourceExpression)
                    // {

                    // }
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
        layout(CustomerbySalesperson)
        {
            Type = RDLC;
            LayoutFile = './Development 1/07. Reports/01. Demonstration/layout/CustomerbySalesperson.rdl';
        }
    }

    var
        myInt: Integer;
}