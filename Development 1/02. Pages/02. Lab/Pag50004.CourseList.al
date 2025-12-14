page 50004 "Course List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Course;
    Caption = 'Course List';
    CardPageId = Course;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Level; Level)
                {
                    ApplicationArea = All;
                }
                field(Suggestion; Suggestion)
                {
                    ApplicationArea = All;
                }
                field(SPA; SPA)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(RunMyCodeunit)
            {
                ApplicationArea = All;
                Caption = 'Run My Codeunit';
                Image = Action;
                RunObject = Codeunit MyCodeunit;
            }
            action(RunMyCodeunit2)
            {
                ApplicationArea = All;
                Caption = 'Run My Codeunit 2';
                Image = Action;
                RunObject = Codeunit MyCodeunit2;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Level := '';
        Suggestion := '';
        SPA := false;
        case Rec.Difficulty of
            1 .. 5:
                begin
                    Level := 'Beginner';
                    Suggestion := 'Take e-Learning or remote training';
                    SPA := true;
                end;
            6 .. 8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Attend instructor-Led';
                end;
            9 .. 10:
                begin
                    Level := 'Advanced';
                    Suggestion := 'Attend instructor-Led and self study';
                    SPA := false;
                end;
        end;
        if (Rec."Passing Rate" > 70) and (Rec.Difficulty >= 6) then
            SPA := true;
    end;

    var
        Level: Text[30];
        Suggestion: Text[80];
        SPA: Boolean;
}