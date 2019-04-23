
Unit MyUtils;

Interface

Uses Classes, sysutils;

Procedure Split(Const Delimiter: Char; Input: String; Const Strings: TStrings);
Function MergeList(List: TStrings): string;
Procedure InsertionSort(Var A: Array Of String; size: integer);

Implementation

//https://stackoverflow.com/a/2625799
Procedure Split(Const Delimiter: Char; Input: String; Const Strings: TStrings);
Begin
  Assert(Assigned(Strings));
  Strings.Clear;
  Strings.Delimiter := Delimiter;
  Strings.DelimitedText := Input;
End;


Function MergeList(List: TStrings): string;
Begin
  List.Delimiter := ' ';
  List.QuoteChar := #0;
  MergeList := List.DelimitedText;
End;


Procedure InsertionSort(Var A: Array Of String; size: integer);

Var
  i, j: integer;
  x: string;
Begin
  For i := 1 To size-1 Do
    Begin
      x := A[i];
      j := i - 1;
      While ((j>=0) And (CompareText(A[j], x)>0)) Do
        Begin
          A[j + 1] := A[j];
          j := j - 1;
        End;
      A[j + 1] := x;
    End;
End;


End.
