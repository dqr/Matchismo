# Matchismo Notes

## Key slides for final code

Deck            : Lecture 2 Slide 13  
PlayingCard     : Lecture 2 Slide 26  
PlayingCardDeck : Lecture 2 Slide 32  
Card            : Lecture 2 Slide 162  

XCode walkthrough starts at Lecture 2 Slide 35.

### 2012Feb3

Launched XCode from the command line (having looked at the unit test video

In GUI, followed stuff on slides 35-44, except answered yes to both unit tests and to source control.

Adding the model starts on slide 148, started with that.

Added the Card model and committed.

Added the rest of the models, committing after each one.

Now to the beginning part, the UI...


### 2012Feb8

Looking at the commit log and the state of the product, it looks like we left off with a working Homework 0, which is the last thing in the Lecture 2 Slides.

Added this file (these notes) to the repository

On to Lecture 3…  Looks like we'll start at slide 5 and just work linearly through the slides doing the stuff.  Once that's done, we'll be on to Assignment 1 as alluded to on slide 129.

Slides 5 - 33 just deal with going from 1 button to 12 of them.

Slides 34 - 43 deal with what was done in HW 0, i.e. making a random deck, not just the ace of clubs.  On slide 34 Paul uses a single line if (no braces).  I think I'll keep the braces, but shrink it to one line too.  Throw a commit in here for good measure.

Slides xxx

Assignment 1.

Task 1 - just do the walkthrough that's in the lecture 3 slides.  Done.

Task 2 - add 4 more cards.  Copy/Paste last row.  Trick is to be sure to add the copied buttons to the outlet collection.

Task 3 - add a label for the match results.  Added the label in the storyboard, add a new flipResultsProperty to the model, and modify the controller to update the view (storyboard) based on the results from the model (CarMatchingGame).

Task 4 - Add a deal button.  Added a Deal button and wired up to the controller as an Action (drag to inside implementation).  Code for dealNewDeck nils the game so we alloc init a new one on next reference.  Then clean up flip count and flipResults labels (score is automatic via new game), and update the UI.


## Random Notes

Some magic to change the brace style default in XCode:

http://canadian-fury.com/2012/05/16/xcode-4-dot-3-place-all-autocompleted-opening-curly-braces-on-new-lines/

xx