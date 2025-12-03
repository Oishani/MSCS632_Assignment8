# MSCS632_Assignment8

## Overview
This assignment demonstrates a Family Tree Program in Prolog. It defines family relationships and implements rules to query parent, grandparent, sibling, cousin, descendant, ancestor, and uncle/aunt relationships. Logical inference and recursion are used to answer queries.

## Directory Structure
- prolog/
  - `family_tree.pl`: Prolog source code with facts, rules, and sample queries
  - `run_family_tree.sh`: Bash script to run the CLI app and demonstrate all features

## Features Demonstrated
- Define basic relationships: parent, male, female
- Derived relationships: grandparent, sibling, cousin
- Logical inference queries: children, siblings, cousin check, grandparents, mothers, fathers
- Recursive logic: descendants, ancestors
- Additional feature: uncle/aunt
- Edge cases: queries for people with no children or cousins

## How to Run
1. Install SWI-Prolog:
   - **macOS**: Run `brew install swi-prolog` (requires Homebrew)
   - **Ubuntu/Debian**: Run `sudo apt-get install swi-prolog`
   - **Windows**: Download the installer from https://www.swi-prolog.org/download/stable and follow setup instructions
2. Verify installation and command availability:
   - Open a terminal and run:
     ```zsh
     swipl --version
     ```
   - You should see the SWI-Prolog version output. If you see a 'command not found' error, ensure SWI-Prolog is installed and your PATH is set correctly.
3. Run the demonstration script:
   ```zsh
   cd prolog
   chmod +x run_family_tree.sh
   ./run_family_tree.sh
   ```
The script will preload data and run sample queries, displaying results for all required features and edge cases.

## Sample Output
```
--- Family Tree Demo ---

1. Children of john:
[mary,tom]
2. Siblings of mary:
[tom]
3. Grandparents of alice:
[john,susan]
4. Mother of carol:
[lisa]
5. Father of dave:
[tom]
6. Cousins of emma:
[]
7. Siblings for each person:
  tom: [mary]
  bob: [alice]
  dave: [carol]
  frank: [emma]
  henry: [grace]
  mary: [tom]
  alice: [bob]
  carol: [dave]
  emma: [frank]
  grace: [henry]
8. Is alice a cousin of carol? 
yes
9. Descendants of john:
[mary,tom,alice,bob,emma,frank,carol,dave,grace,henry]
10. Ancestors of grace:
[carol,john,susan,tom,lisa]
11. Uncles/Aunts of bob:
[tom]
12. Children of frank (should be empty):
[]
13. Cousins of henry (should be empty):
[]
--- End of Demo ---
```