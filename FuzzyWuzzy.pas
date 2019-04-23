
Unit FuzzyWuzzy;

Interface

Uses Math, Levenshtein, StrUtils, Classes, MyUtils;

Function Ratio(str1: String; str2: String): integer;
Function PartialRatio(str1: String; str2: String): integer;
Function TokenSortRatio(str1: String; str2: String): integer;
Function TokenSetRatio(str1: String; str2: String): integer;

Implementation

Function Ratio(str1: String; str2: String): integer;

Var
  sumLength: integer;
  ratioFloat: real;
Begin
  sumLength := length(str1) + length(str2);
  ratioFloat := (sumLength - LevenshteinDistance(str1, str2)) / sumLength;
  Ratio := Round(RatioFloat * 100);
End;


Function PartialRatio(str1: String; str2: String): integer;

Var
  shortString, longString, currentSubstring: string;
  n, m, i, windowSize, maxSimilarity: integer;
Begin
  n := length(str1);
  m := length(str2);

  If n < m Then
    Begin
      shortString := str1;
      longString := str2;
      windowSize := n;
    End
  Else
    Begin
      shortString := str2;
      longString := str1;
      windowSize := m;
    End;

  maxSimilarity := 0;

  For i := 1 To (length(longString)-windowSize)+1 Do
    Begin
      currentSubstring := copy(longString, i, windowSize);
      maxSimilarity := max(maxSimilarity, Ratio(shortString, currentSubstring));
    End;

  PartialRatio := maxSimilarity;
End;


Function TokenSortRatio(str1: String; str2: String): integer;

Var
  i: integer;
  tokenizedStr1, tokenizedStr2: TStringList;
  sortedStr1, sortedStr2: string;
Begin
  tokenizedStr1 := TStringList.Create;
  Split(' ', str1, tokenizedStr1);
  tokenizedStr1.Sort;

  tokenizedStr2 := TStringList.Create;
  Split(' ', str2, tokenizedStr2);
  tokenizedStr2.Sort;

  sortedStr1 := MergeList(tokenizedStr1);
  sortedStr2 := MergeList(tokenizedStr2);

  TokenSortRatio := Ratio(sortedStr1, sortedStr2);
End;


Function TokenSetRatio(str1: String; str2: String): integer;

Var
  tokenizedStr1, tokenizedStr2: TStringList;
  intersection, distinctStr1, distinctStr2: TStringList;
  i, maxSimilarity: integer;
  compareSet0, compareSet1, compareSet2: string;
Begin
  tokenizedStr1 := TStringList.Create;
  Split(' ', str1, tokenizedStr1);
  tokenizedStr2 := TStringList.Create;
  Split(' ', str2, tokenizedStr2);

  intersection := TStringList.Create;
  distinctStr1 := TStringList.Create;
  distinctStr2 := TStringList.Create;

  For i := 0 To tokenizedStr1.Count-1 Do
    Begin
      If tokenizedStr2.IndexOf(tokenizedStr1[i])<>-1 Then
        intersection.Add(tokenizedStr1[i])
      Else
        distinctStr1.Add(tokenizedStr1[i]);
    End;

  For i := 0 To tokenizedStr2.Count-1 Do
    If intersection.IndexOf(tokenizedStr2[i])=-1 Then
      distinctStr2.Add(tokenizedStr2[i]);

  intersection.Sort;
  distinctStr1.Sort;
  distinctStr2.Sort;

  compareSet0 := MergeList(intersection);
  compareSet1 := Concat(MergeList(intersection), ' ', MergeList(distinctStr1));
  compareSet2 := Concat(MergeList(intersection), ' ', MergeList(distinctStr2));
  maxSimilarity := max(Ratio(compareSet0, compareSet1), Ratio(compareSet0, compareSet2));
  maxSimilarity := max(maxSimilarity, Ratio(compareSet1, compareSet2));

  TokenSetRatio := maxSimilarity;
End;


End.
