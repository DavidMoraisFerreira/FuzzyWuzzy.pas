 FuzzyWuzzy.pas - Fuzzy String Matching in Free Pascal
==================

FuzzyWuzzy.pas is a (Free) Pascal port of [FuzzyWuzzy](https://github.com/seatgeek/fuzzywuzzy), a fuzzy string matching library that uses the [Levenshtein Distance](https://en.wikipedia.org/wiki/Levenshtein_distance).

## How to Get Started

After installing the [Free Pascal](https://www.freepascal.org/) binaries for your operating systems, you can compile and execute DemoUsage.pas using the following commands:

```
> fpc DemoUsage.pas
> ./DemoUsage
```

### Supported Algorithms

* Ratio()
* PartialRatio()
* TokenSortRatio()
* TokenSetRatio()