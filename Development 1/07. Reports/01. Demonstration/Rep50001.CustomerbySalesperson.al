report 50001 "Customer by Salesperson"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = CustomerbySalesperson;

    dataset
    {
        dataitem("Salesperson/Purchaser"; "Salesperson/Purchaser")
        {
            column(ColumnName; SourceFieldName)
            {

            }
            dataitem(Customer; Customer)
            {
                DataItemLinkReference = "Salesperson/Purchaser";
                DataItemLink = "Salesperson Code" = field(Code);
                DataItemTableView = sorting("Salesperson Code");

                column(ColumnName; SourceFieldName)
                {

                }
            }
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {

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

    rendering
    {
        layout(CustomerbySalesperson)
        {
            Type = RDLC;
            LayoutFile = './07. Reports/01. Demonstration/layout/CustomerbySalesperson.rdl';
        }
    }

    var
        myInt: Integer;
}