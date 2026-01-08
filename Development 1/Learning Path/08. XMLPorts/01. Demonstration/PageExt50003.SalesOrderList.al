pageextension 50003 SalesOrderExt extends "Sales Order List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(Processing)
        {
            action(RunMyReport)
            {
                Caption = 'Export Sales Orders to XML';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = ExportToExcel;

                trigger OnAction()
                var
                    // Xmlport.Run(50000, true, false);
                    Xmlport: XmlPort "Sales Order Export XML";
                begin
                    Xmlport.Run();
                end;
            }
            action(SalesOrderExportVariable)
            {
                Caption = 'Sales Order Export Variable';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = ExportToExcel;
                RunObject = xmlport "Sales Order Export Variable";
            }
        }
    }

    var
        myInt: Integer;
}