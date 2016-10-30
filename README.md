# TEvo Code Challenge For .txt File Parsing, Data Collecting, and Reformatting

## Instructions:

Once cloned down, run ```ruby bin/run.rb``` to receive output results.

### Bonus:

Alternatively, run ```ruby bin/interactive.rb``` and follow command prompts for interactive version.

### Testing:

Install Rspec with ```gem install rspec```.

Run ```rspec``` for available tests.

## Original data will come in 3 .txt files:

### comma.txt:

```
Abercrombie, Neil, Male, Tan, 2/13/1943
Bishop, Timothy, Male, Yellow, 4/23/1967
Kelly, Sue, Female, Pink, 7/12/1959
```
### pipe.txt:

```
Smith | Steve | D | M | Red | 3-3-1985
Bonk | Radek | S | M | Green | 6-3-1975
Bouillon | Francis | G | M | Blue | 6-3-1975
```

### space.txt:

```
Kournikova Anna F F 6-3-1975 Red
Hingis Martina M F 4-2-1979 Green
Seles Monica H F 12-2-1973 Black
```

## Desired Output:

### Output 1:
+ First sorted by gender (females before males/alphabetical order)
+ Then sorted by last name in ascending order

### Output 2:
+ Sorted by birth date in ascending order

### Output 3:
+ Sorted by last name in descending order

### output_sample.txt:

```
Output 1:
Hingis Martina Female 4/2/1979 Green
Kelly Sue Female 7/12/1959 Pink
Kournikova Anna Female 6/3/1975 Red
Seles Monica Female 12/2/1973 Black
Abercrombie Neil Male 2/13/1943 Tan
Bishop Timothy Male 4/23/1967 Yellow
Bonk Radek Male 6/3/1975 Green
Bouillon Francis Male 6/3/1975 Blue
Smith Steve Male 3/3/1985 Red

Output 2:
Abercrombie Neil Male 2/13/1943 Tan
Kelly Sue Female 7/12/1959 Pink
Bishop Timothy Male 4/23/1967 Yellow
Seles Monica Female 12/2/1973 Black
Bonk Radek Male 6/3/1975 Green
Bouillon Francis Male 6/3/1975 Blue
Kournikova Anna Female 6/3/1975 Red
Hingis Martina Female 4/2/1979 Green
Smith Steve Male 3/3/1985 Red

Output 3:
Smith Steve Male 3/3/1985 Red
Seles Monica Female 12/2/1973 Black
Kournikova Anna Female 6/3/1975 Red
Kelly Sue Female 7/12/1959 Pink
Hingis Martina Female 4/2/1979 Green
Bouillon Francis Male 6/3/1975 Blue
Bonk Radek Male 6/3/1975 Green
Bishop Timothy Male 4/23/1967 Yellow
Abercrombie Neil Male 2/13/1943 Tan
```
