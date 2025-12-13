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

}