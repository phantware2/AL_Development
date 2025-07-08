pageextension 50000 MyExtension extends "Customer List"
{
    trigger OnOpenPage()
    begin
        Report.Run(Report::MyReport);
    end;
}