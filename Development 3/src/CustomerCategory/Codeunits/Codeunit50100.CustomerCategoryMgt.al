codeunit 50100 "PW Customer Category Mgt"
{
    trigger OnRun()
    begin

    end;

    procedure CreateDefaultCategory()
    var
        CustomerCategory: Record "PW Customer Category";
        DefaultCodeTxt: Label 'DEFAULT';
        DefaultDescriptionTxt: Label 'Default Customer Category';
    begin
        CustomerCategory.Code := DefaultCodeTxt;
        CustomerCategory.Description := DefaultDescriptionTxt;
        CustomerCategory.Default := true;
        if CustomerCategory.Insert then
            Message('Default Customer Category created successfully.')
        else
            Message('Default Customer Category already exists.');
    end;
}