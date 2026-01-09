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
                AutoUpdate = true;
                fieldelement(Model; Vehicle.Model)
                {
                }
                fieldelement(Descripion; Vehicle.Descripion)
                {
                }
                fieldelement(SerialNo; Vehicle."Serial No.")
                {
                }
                fieldelement(Transmission; Vehicle.Transmission)
                {
                }
                fieldelement(ListPrice; Vehicle."List Price")
                {
                }
                fieldelement(ManufacturingDate; Vehicle."Manufacturing Date")
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