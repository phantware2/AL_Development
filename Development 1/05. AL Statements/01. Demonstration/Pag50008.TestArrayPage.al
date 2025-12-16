page 50008 "Test Array Page"
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
                    field(InputNumber1; InputNumber[1])
                    {
                    }
                    field(InputNumber2; InputNumber[2])
                    {
                    }
                    field(InputNumber3; InputNumber[3])
                    {
                    }
                    field(InputNumber4; InputNumber[4])
                    {
                    }
                    field(InputNumber5; InputNumber[5])
                    {
                    }
                    field(InputNumber6; InputNumber[6])
                    {
                    }
                    field(InputNumber7; InputNumber[7])
                    {
                    }
                    field(InputNumber8; InputNumber[8])
                    {
                    }
                    field(InputNumber9; InputNumber[9])
                    {
                    }
                    field(InputNumber10; InputNumber[10])
                    {
                    }
                }
                group(Output)
                {
                    field(OutputNumber1; OutputNumber[1])
                    {
                        Editable = false;
                    }
                    field(OutputNumber2; OutputNumber[2])
                    {
                        Editable = false;
                    }
                    field(OutputNumber3; OutputNumber[3])
                    {
                        Editable = false;
                    }
                    field(OutputNumber4; OutputNumber[4])
                    {
                        Editable = false;
                    }
                    field(OutputNumber5; OutputNumber[5])
                    {
                        Editable = false;
                    }
                    field(OutputNumber6; OutputNumber[6])
                    {
                        Editable = false;
                    }
                    field(OutputNumber7; OutputNumber[7])
                    {
                        Editable = false;
                    }
                    field(OutputNumber8; OutputNumber[8])
                    {
                        Editable = false;
                    }
                    field(OutputNumber9; OutputNumber[9])
                    {
                        Editable = false;
                    }
                    field(OutputNumber10; OutputNumber[10])
                    {
                        Editable = false;
                    }
                }
                group(Counter)
                {
                    field(LoopCount; LoopCount)
                    {
                        Editable = false;
                    }
                    field(SwapCount; SwapCount)
                    {
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
            action(Clear)
            {
                ApplicationArea = Basic, Suite;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Clear(InputNumber);
                    Clear(OutputNumber);
                    LoopCount := 0;
                    SwapCount := 0;
                end;
            }
            action(GenerateInput)
            {
                Caption = 'Generate Input';
                ApplicationArea = Basic, Suite;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    LoopCount := 0;
                    SwapCount := 0;

                    for idx := 1 to ArrayLen(InputNumber) do
                        InputNumber[idx] := Random(ArrayLen(InputNumber));
                end;
            }
            action(PopulateOutput)
            {
                Caption = 'Populate Output';
                ApplicationArea = Basic, Suite;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    LoopCount := 0;
                    SwapCount := 0;

                    idx := 1;
                    while (idx <= ArrayLen(InputNumber)) and (idx <= ArrayLen(OutputNumber)) do begin
                        OutputNumber[idx] := InputNumber[idx];
                        idx += 1;
                    end;
                end;
            }
            action(Sort)
            {
                ApplicationArea = Basic, Suite;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    LoopCount := 0;
                    SwapCount := 0;

                    repeat
                        IsSorted := true;
                        for idx := ArrayLen(OutputNumber) downto 2 do begin
                            loopCount += 1;
                            if OutputNumber[idx] < OutputNumber[idx - 1] then begin
                                // Swap
                                TempNumber := OutputNumber[idx];
                                OutputNumber[idx] := OutputNumber[idx - 1];
                                OutputNumber[idx - 1] := TempNumber;
                                SwapCount += 1;
                                IsSorted := false;
                            end;
                        end;
                    until IsSorted;
                end;
            }
            action(ImprovedSort)
            {
                Caption = 'Improved Sort';
                ApplicationArea = Basic, Suite;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    LoopCount := 0;
                    SwapCount := 0;
                    LowestSwitch := 2;

                    repeat
                        IsSorted := true;
                        for idx := ArrayLen(OutputNumber) downto LowestSwitch do begin
                            loopCount += 1;
                            if OutputNumber[idx] < OutputNumber[idx - 1] then begin
                                // Swap
                                TempNumber := OutputNumber[idx];
                                OutputNumber[idx] := OutputNumber[idx - 1];
                                OutputNumber[idx - 1] := TempNumber;
                                SwapCount += 1;
                                IsSorted := false;
                                LowestSwitch := idx + 1;
                            end;
                        end;
                    until IsSorted;
                end;
            }
        }
    }

    var
        InputNumber, OutputNumber : array[10] of Integer;
        LoopCount, SwapCount, idx, LowestSwitch, TempNumber : Integer;
        IsSorted: Boolean;
}