codeunit 50003 MyCodeunit4
{

    var
        WhatWasIt: Date;
        Description: Text[30];

    trigger OnRun()
    begin
        WhatWasIt := Today;

        case Date2DMY(WhatWasIt, 2) of
            1:
                Description := 'January';
            2:
                Description := 'February';
            3:
                Description := 'March';
            4:
                Description := 'April';
            5:
                Description := 'May';
            6:
                Description := 'June';
            7:
                Description := 'July';
            8:
                Description := 'August';
            9:
                Description := 'September';
            10:
                Description := 'October';
            11:
                Description := 'November';
            12:
                Description := 'December';

        end;
        MESSAGE('%1 is in %2', WhatWasIt, Description);
    end;
}