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

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

@property (nonatomic) int flipCount;

@property (strong, nonatomic) Deck *deck;

@end

@implementation CardGameViewController

// use lazy instantiation for the deck getter
- (Deck *)deck
{
    if (!_deck)
    {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flips updated to: %d", self.flipCount);
}
- (IBAction)flipCard:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    Card *card = [self.deck drawRandomCard];
    // if we went face up (isSelected), then
    // get a random card and set our button's label
    // text from contents
    [sender setTitle:card.contents forState:UIControlStateSelected];
    self.flipCount++;
}


@end
