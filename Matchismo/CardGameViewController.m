//
//  CardGameViewController.m
//  Matchismo
//
//  Created by David Rolin on 2/3/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipUpResult;

@end

@implementation CardGameViewController
- (IBAction)matchSizeSelected:(UISegmentedControl *)matchPicker
{
    NSLog(@"matchSizeSelected, index: %d", matchPicker.selectedSegmentIndex);
}

- (IBAction)dealNewGame:(UIButton *)sender
{
    // nil out the current game so we start a new one
    self.game = nil;
    self.flipCount = 0;
    self.flipUpResult.text = @"Lets Play!";
    //update the UI
    [self updateUI];
}

//lazily instantiate the model
- (CardMatchingGame *)game
{
    if (!_game) { _game = [[CardMatchingGame alloc]initWithCardCount:self.cardButtons.count
                                                           usingDeck:[[PlayingCardDeck alloc]init]]; }

    return _game;
}

- (void) setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
}

- (void) updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flips updated to: %d", self.flipCount);
}

- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipUpResult.text = self.game.flipResults;
    self.flipCount++;
    [self updateUI];
}


@end
