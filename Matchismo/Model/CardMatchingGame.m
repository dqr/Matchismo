//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Dave Rolin on 2/9/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;
@property (nonatomic) NSString *flipResults;

@end

@implementation CardMatchingGame

// lazily instantiate the getter for flipResults
- (NSString *)flipResults
{
    if (!_flipResults) { _flipResults = [[NSString alloc] init]; }
    return _flipResults;
}
- (NSMutableArray *)cards
{
    if (!_cards) { _cards = [[NSMutableArray alloc]init]; }
    return _cards;
}

- (id)initWithCardCount:(NSInteger)count
              usingDeck:(Deck *)deck
{
    self = [super init];
    if (self)
    {
        for (int i = 0; i < count; i++)
        {
            Card *card = [deck drawRandomCard];
            if (!card)
            {
                self = nil;
            }
            else
            {
                self.cards[i] = card;
            }
        }
    }

    return self;

}

- (Card *)cardAtIndex:(NSInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define flipCost 1
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2

- (void)flipCardAtIndex:(NSInteger)index
{
    
    Card *card = [self cardAtIndex:index];
    if (!card.isUnplayable)
    {
        if (!card.isFaceUp)
        // we flipped a card to face up.  Trundle through the
        // other cards to see if we can match
        {
            // track if we're the only face up card
            BOOL isOnlyOneCardFaceUp = YES;

            for (Card *otherCard in self.cards)
            {
                if (otherCard.isFaceUp && !otherCard.isUnplayable)
                // multiple cards are face up.  Look for matches
                // and note that multiple cards are face up and playable
                {
                    isOnlyOneCardFaceUp = NO;
                    
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore)
                    // match case
                    {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore*MATCH_BONUS;
                        self.flipResults = [NSString stringWithFormat:@"Matched %@ and %@ for %d points", card.contents, otherCard.contents, matchScore*MATCH_BONUS];
                    }
                    else
                    //mismatch case
                    {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        self.flipResults = [NSString stringWithFormat:@"%@ and %@ don't match! lose %d points!", card.contents, otherCard.contents, MISMATCH_PENALTY];
                    }
                }
            }
            self.score -= flipCost;
            if (isOnlyOneCardFaceUp) { self.flipResults = [NSString stringWithFormat:@"Flipped up %@", card.contents]; }
        }
        card.faceUp = !card.isFaceUp;
    }
}

@end
