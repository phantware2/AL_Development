xmlport 50001 "Vehicle Import XML"
{
    Direction = Import;
    Format = Xml;
    FormatEvaluate = Xml;

    schema
    {
        textelement(VehicleRoot)
        {
            tableelement(Vehicle; Vehicle)
            {
                fieldelement(Make; Vehicle.Model)
                {
                }
                fieldelement(SerialNo; Vehicle."Serial No.")
                {
                }
                fieldelement(ListPrice; Vehicle."List Price")
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