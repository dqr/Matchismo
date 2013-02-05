//
//  PlayingCard.m
//  Matchismo
//
//  Created by Dave Rolin on 2/3/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    static NSArray *validSuits = nil;
    if (!validSuits)
    {
        validSuits = @[@"♥", @"♦", @"♠", @"♣"];
    }
    return validSuits;
}

+ (NSUInteger)maxRank
{
    return [self rankStrings].count - 1;
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    //static NSArray *rankStrings = nil;
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    //return rankStrings;
}

@end
