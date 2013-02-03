//
//  Deck.m
//  Matchismo
//
//  Created by Dave Rolin on 2/3/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

// Do lazy instantiation for the getter for the cards property
- (NSMutableArray *)cards
{
    if (!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }

    return _cards;

}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop)
    {
        [self.cards insertObject:card atIndex:0];
    }
    else
    {
        [self.cards addObject:card];
    }
}

- (Card *)drawRandomCard
{
    Card *randomCard = nil;

    if (self.cards.count)
    {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }

    return randomCard;
}

@end
