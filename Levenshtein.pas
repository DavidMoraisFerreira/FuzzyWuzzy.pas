
Unit Levenshtein;

Interface

Uses Math;
Function LevenshteinDistance(str1, str2: String): longint;

Implementation
Function LevenshteinDistance(str1, str2: String): longint;

Var mat: array Of array Of integer;
  i, j, n, m: integer;

Const cost: integer = 2;
Begin
  n := length(str1);
  m := length(str2);
  setLength(mat, n+1, m+1);
  For i := 0 To n Do
    Begin
      mat[i, 0] := i;
    End;

  For j := 0 To m Do
    Begin
      mat[0, j] := j;
    End;

  For i := 1 To n Do
    For j := 1 To m Do
      Begin
        If str1[i] = str2[j] Then
          mat[i, j] := mat[i-1, j-1]
        Else
          mat[i, j] := min(mat[i-1,j]+1,min(mat[i,j-1]+1, mat[i-1,j-1]+cost));
      End;

  LevenshteinDistance := mat[n,m];
End;

End.
