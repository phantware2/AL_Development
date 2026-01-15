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

                trigger OnBeforeInsertRecord()
                // var
                //     ProgressPercent: Integer;
                begin
                    //     CurrentCount += 1;

                    //     if TotalCount > 0 then
                    //         ProgressPercent := Round((CurrentCount * 100) / TotalCount, 1)
                    //     else
                    //         ProgressPercent := 0;

                    //     ProgressDlg.Update(1, Course.Code);
                    //     ProgressDlg.Update(2, Format(ProgressPercent) + ' %');

                    TotDemInv += 1;
                    dialogProgress.Open((T002txt));
                    dialogProgress.Update(1, TotDemInv);
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

    // trigger OnPreXmlPort()
    // begin
    //     // Count records for progress tracking
    //     TotalCount := Course.Count;
    //     CurrentCount := 0;

    //     ProgressDlg.Open(
    //         'Processing Courses\' +
    //         'Current Course: #1########################\' +
    //         'Progress: #2############################'
    //     );
    // end;

    // trigger OnPostXmlPort()
    // begin
    //     ProgressDlg.Close();
    //     Message('Course upload completed successfully.');
    // end;

    trigger OnPostXmlPort()
    begin
        IF TotDemInv <> 0 then
            dialogProgress.Close();
        Message(Text001Lbl);
    end;

    var
        // ProgressDlg: Dialog;
        // TotalCount: Integer;
        // CurrentCount: Integer;

        dialogProgress: Dialog;
        Text001Lbl: Label 'Price List Line Import Successfully';
        T002Txt: Label 'Total Price List Line Uploaded #1';
        TotDemInv: Integer;
}
