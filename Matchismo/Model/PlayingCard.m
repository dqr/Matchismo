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
    return [PlayingCard rankStrings][self.rank];
}

@synthesize suit = _suit;

+ (NSArray *)validSuites
{
    static NSArray *validSuites = nil;
    if (!validSuites)
    {
        validSuites = @[@"♥", @"♦", @"♠", @"♣"];
    }
    return validSuites;
}

+ (NSUInteger)maxRank
{
    return [self rankStrings].count - 1;
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuites] containsObject:suit])
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