xmlport 50000 "Sales Order Export XML"
{
    Direction = Export;
    Format = Xml;
    FormatEvaluate = Xml;

    schema
    {
        textelement(SalesheaderRoot)
        {
            tableelement(SalesHeader; "Sales Header")
            {
                SourceTableView = where("Document Type" = const(Order));

                fieldelement(Customer; SalesHeader."Sell-to Customer No.")
                {
                }
                fieldelement(No; SalesHeader."No.")
                {
                }
                fieldelement(Date; SalesHeader."Order Date")
                {
                }
                fieldelement(Currency; SalesHeader."Currency Code")
                {
                }
            }

        }
    }
}

    requestpage
    {
        layout
        {
            area(content)
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
                action(ActionName)
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}