report 50003 "Course List"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = CourseList;

    dataset
    {
        dataitem(Course; Course)
        {

            RequestFilterFields = Type;
            column(Code; Code)
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(Type; Type)
            {
                IncludeCaption = true;
            }
            column(Duration; Duration)
            {
                IncludeCaption = true;
            }
            column(Price; Price)
            {
                IncludeCaption = true;
            }
            column(Active; Active)
            {
                IncludeCaption = true;
            }
            column(Difficulty; Difficulty)
            {
                IncludeCaption = true;
            }
            column(Passing_Rate; "Passing Rate")
            {
                IncludeCaption = true;
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
        layout(CourseList)
        {
            Type = RDLC;
            LayoutFile = './Development 1/07. Reports/02. Lab/layout/CourseList.rdl';
        }
    }

    var
        myInt: Integer;
}