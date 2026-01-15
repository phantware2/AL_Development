query 50000 SimpleItem
{
    QueryType = Normal;
    Caption = 'Simple Item';
    Description = 'A simple item query demonstration.';

    elements
    {
        dataitem(DataItemName; SourceTableName)
        {
            column(ColumnName; SourceFieldName)
            {

            }
            filter(FilterName; SourceFieldName)
            {

            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}