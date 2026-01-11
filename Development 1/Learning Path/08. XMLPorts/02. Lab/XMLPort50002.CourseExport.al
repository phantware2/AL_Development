xmlport 50002 "Course Export XML"
{
    schema
    {
        textelement(CourseRoot)
        {
            tableelement(Course; Course)
            {
                fieldelement(NodeName3; NodeName2.SourceFieldName)
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
                    field(Name; SourceExpression)
                    {

                    }
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