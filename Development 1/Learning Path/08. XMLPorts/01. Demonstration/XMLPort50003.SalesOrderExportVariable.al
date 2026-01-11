xmlport 50003 "Sales Order Export Variable"
{
    Direction = Export;
    Format = VariableText;

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
            tableelement(SalesLine; "Sales Line")
            {
                LinkTable = SalesHeader;
                LinkFields = "Document Type" = field("Document Type"), "Document No." = field("No.");

                fieldelement(Type; SalesLine.Type)
                {
                }
                fieldelement(No; SalesLine."No.")
                {
                }
                fieldelement(Quantity; SalesLine.Quantity)
                {
                }
                fieldelement(Price; SalesLine."Unit Price")
                {
                }
                fieldelement(Discount; SalesLine."Line Discount %")
                {
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