tableextension 50000 SalespersonPuerchaserExt extends "Salesperson/Purchaser"
{
    fields
    {
        // Add changes to table fields here
        field(50000; Sales; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Transaction".Amount where("Salesperson Code" = field(Code)));
        }
    }
}