
Program DemoUsage;
{$APPTYPE CONSOLE}

Uses FuzzyWuzzy;

Begin
  writeln(PartialRatio('this is a test','this is a test!'));
  writeln('--');
  writeln(Ratio('NEW YORK METS','NEW YORK MEATS'));
  writeln(PartialRatio('YANKEES','NEW YORK YANKEES'));
  writeln('--');
  writeln(PartialRatio('NEW YORK YANKEES', 'YANKEES'));
  writeln(PartialRatio('NEW YORK METS','NEW YORK YANKEES'));
  writeln('--');
  writeln(Ratio('New York Mets vs Atlanta Braves', 'Atlanta Braves vs New York Mets'));
  writeln(TokenSortRatio('New York Mets vs Atlanta Braves', 'Atlanta Braves vs New York Mets'));
  writeln('--');
  writeln(TokenSetRatio('mariners vs angels', 'los angeles angels of anaheim at seattle mariners'));
  writeln('--');
  writeln(Ratio('fuzzy wuzzy was a bear','wuzzy fuzzy was a bear'));
  writeln(TokenSortRatio('fuzzy wuzzy was a bear','wuzzy fuzzy was a bear'));
  writeln('--');
  writeln(TokenSortRatio('fuzzy was a bear','fuzzy fuzzy was a bear'));
  writeln(TokenSetRatio('fuzzy  was a bear','fuzzy fuzzy was a bear'));
End.
