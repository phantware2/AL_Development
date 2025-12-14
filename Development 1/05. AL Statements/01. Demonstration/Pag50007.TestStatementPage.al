page 50007 "Test Statement Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    // SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(General)
            {
                group(Input)
                {
                    field(Quantity; Quantity)
                    {
                        ApplicationArea = All;
                    }
                    field(UnitPrice; UnitPrice)
                    {
                        ApplicationArea = All;
                        MinValue = 0;
                    }
                }
                group(Output)
                {
                    field(Result; Result)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field(TotalSales; TotalSales)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field(TotalCredits; TotalCredits)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field(GrandTotal; GrandTotal)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                }
                group(Output2)
                {
                    field(TotalQtySales; TotalQtySales)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field(TotalQtyCredits; TotalQtyCredits)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field(GrandQtyTotal; GrandQtyTotal)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ExecuteIF)
            {
                Caption = 'Execute IF';
                ApplicationArea = Basic, Suite;
                Image = ExecuteBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    if Quantity = 0 then
                        exit;

                    Result := Quantity * UnitPrice;

                    if Result < 0 then
                        TotalCredits := TotalCredits + Result
                    else
                        TotalSales := TotalSales + Result;

                    GrandTotal := GrandTotal + Result;
                end;
            }
            action(Clear)
            {
                ApplicationArea = Basic, Suite;
                Image = ClearFilter;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Quantity := 0;
                    UnitPrice := 0;
                    Result := 0;
                    TotalSales := 0;
                    TotalCredits := 0;
                    GrandTotal := 0;
                end;
            }
            action(ExecuteCompound)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Execute Compound';
                Image = ClearFilter;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    if Quantity = 0 then
                        exit;
                    Result := Quantity * UnitPrice;

                    if Result < 0 then begin
                        TotalCredits := TotalCredits + Result;
                        TotalQtyCredits := TotalQtyCredits + Quantity;
                    end else begin
                        TotalSales := TotalSales + Result;
                        TotalQtySales := TotalQtySales + Quantity;
                    end;

                    GrandTotal := GrandTotal + Result;
                    GrandQtyTotal := GrandQtyTotal + Quantity;
                end;
            }
            action(ExecuteCase)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Execute Case';
                Image = ClearFilter;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Result := Quantity * UnitPrice;
                    case true of
                        quantity = 0:
                            exit;
                        Quantity < 0:
                            begin

                                TotalCredits := TotalCredits + Result;
                                TotalQtyCredits := TotalQtyCredits + Quantity;
                            end;
                        Quantity > 0:
                            begin
                                TotalSales := TotalSales + Result;
                                TotalQtySales := TotalQtySales + Quantity;
                            end;
                    end;
                    GrandTotal := GrandTotal + Result;
                    GrandQtyTotal := GrandQtyTotal + Quantity;
                end;
            }
        }
    }

    var
        Quantity, TotalQtySales, TotalQtyCredits, GrandQtyTotal : Integer;
        UnitPrice, TotalSales, TotalCredits, GrandTotal, Result :
                            Decimal;
}