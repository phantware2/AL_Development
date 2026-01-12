xmlport 50004 "Course Export Variable"
{
    Direction = Both;
    Format = VariableText;
    FieldDelimiter = 'None';
    FieldSeparator = ',';

    schema
    {
        textelement(CourseRoot)
        {
            tableelement(Course; Course)
            {
                fieldelement(Code; Course.Code) { }
                fieldelement(Name; Course.Name) { }
                fieldelement(Description; Course.Description) { }
                fieldelement(Type; Course.Type) { }
                fieldelement(Duration; Course.Duration) { }
                fieldelement(Price; Course.Price) { }
                fieldelement(Active; Course.Active) { }
                fieldelement(Difficulty; Course.Difficulty) { }
                fieldelement(PassingRate; Course."Passing Rate") { }

                trigger OnAfterGetRecord()
                var
                    ProgressPercent: Integer;
                begin
                    CurrentCount += 1;

                    if TotalCount > 0 then
                        ProgressPercent := Round((CurrentCount * 100) / TotalCount, 1)
                    else
                        ProgressPercent := 0;

                    ProgressDlg.Update(1, Course.Code);
                    ProgressDlg.Update(2, Format(ProgressPercent) + ' %');
                end;
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
                }
            }
        }
    }

    trigger OnPreXmlPort()
    begin
        // Count records for progress tracking
        TotalCount := Course.Count;
        CurrentCount := 0;

        ProgressDlg.Open(
            'Processing Courses\' +
            'Current Course: #1########################\' +
            'Progress: #2############################'
        );
    end;

    trigger OnPostXmlPort()
    begin
        ProgressDlg.Close();

        // Refresh Course page automatically
        RefreshCoursePage();

        Message('Course upload completed successfully.');
    end;

    local procedure RefreshCoursePage()
    var
        CoursePage: Page "Course List";
    begin
        // Works if the page is open
        CoursePage.Update(false);
    end;

    var
        ProgressDlg: Dialog;
        TotalCount: Integer;
        CurrentCount: Integer;
}
