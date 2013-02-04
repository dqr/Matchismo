//
//  PlayingCard.h
//  Matchismo
//
//  Created by Dave Rolin on 2/3/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;

@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuites;
+ (NSUInteger)maxRank;

@end
