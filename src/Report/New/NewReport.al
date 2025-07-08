report 50000 MyReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    CaptionML = ENU = 'MyFirstReport';
    RDLCLayout = 'src/Report/layouts/MyFirstReport.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting(Name);
            RequestFilterFields = "No.", City;

            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(Balance__LCY; "Balance (LCY)")
            {
                IncludeCaption = true;
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No.");
                DataItemLinkReference = Customer;
                DataItemTableView = sorting("Posting Date");

                column(Amount; Amount)
                {
                    IncludeCaption = true;
                }
                column(Posting_Date; "Posting Date")
                {
                    IncludeCaption = true;
                }
            }
        }

        dataitem(ReportVariables; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = const(1));

            column(DisplayLedgerInformation; DisplayLedgerInformation)
            {
            }
            column(CompanyName; CompanyInfo.Name) { IncludeCaption = true; }
            column(CompanyAddress; CompanyInfo.Address) { IncludeCaption = true; }
            column(CompanyCity; CompanyInfo.City) { IncludeCaption = true; }
            column(CompanyCountry; CompanyInfo."Country/Region Code") { IncludeCaption = true; }
            column(CompanyLogo; CompanyInfo.Picture) { IncludeCaption = true; }
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
                    field(DisplayLedgerInformation; DisplayLedgerInformation)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Ledgers';
                        ToolTip = 'Specifies that ledgers are shown on the report';
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
        DisplayLedgerInformation: Boolean;
        CompanyInfo: Record "Company Information";

    trigger OnPreReport()
    begin
        CompanyInfo.get();
        CompanyInfo.CalcFields(Picture);
    end;
}