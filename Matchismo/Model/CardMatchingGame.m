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
@end

@implementation CardMatchingGame

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
        {
            for (Card *otherCard in self.cards)
            {
                if (otherCard.isFaceUp && !otherCard.isUnplayable)
                {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore)
                    {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore*MATCH_BONUS;
                    }
                    else
                    {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                }
            }
            self.score -= flipCost;
        }
        card.faceUp = !card.isFaceUp;
    }
}

@end
