xmlport 50002 "Course Export XML"
{
    schema
    {
        textelement(CourseRoot)
        {
            tableelement(Course; Course)
            {
                fieldelement(Code; Course.Code)
                {
                }
                fieldelement(Name; Course.Name)
                {
                }
                fieldelement(Description; Course.Description)
                {
                }
                fieldelement(Type; Course.Type)
                {
                }
                fieldelement(Duration; Course.Duration)
                {
                }
                fieldelement(Price; Course.Price)
                {
                }
                fieldelement(Active; Course.Active)
                {
                }
                fieldelement(Difficulty; Course.Difficulty)
                {
                }
                fieldelement(PassingRate; Course."Passing Rate")
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