tableextension 50000 SalespersonPuerchaserExt extends "Salesperson/Purchaser"
{
    fields
    {
        // Add changes to table fields here
        field(50000; Sales; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Transaction".Amount where("Salesperson Code" = field(Code), Type = field("Type Filter")));
        }
        field(50001; "Type Filter"; Option)
        {
            optionmembers = "G/L Account",Item,Resource;
            FieldClass = FlowFilter;
        }
    }
}