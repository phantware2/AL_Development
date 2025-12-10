report 50010 MyProcessOnlyReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {

            trigger OnPreDataItem()
            begin
                Clear(Customer);
                Clear(Counter);
                if not ReplaceExisting then
                    Customer.SetRange("Name 2", '');
            end;

            trigger OnAfterGetRecord()
            begin
                if Customer2.get(Customer."No.") then begin
                    Customer2."Name 2" := Name2ToApply;
                    Customer2.Modify();
                    Counter += 1;
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Ready!, %1 Customer were updated.', Counter);
            end;
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(Name2ToApply; Name2ToApply)
                    {
                        ApplicationArea = All;
                        Caption = 'Name2ToApply';
                        ToolTip = ' Specifies Name 2 To Apply.';
                    }
                    field(ReplaceExisting; ReplaceExisting)
                    {
                        ApplicationArea = All;
                        Caption = 'ReplaceExisting';
                        ToolTip = ' ReplaceExisting';
                    }
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

    var
        Customer2: Record Customer;
        Counter: Integer;
        Name2ToApply: Text;
        ReplaceExisting: Boolean;
}