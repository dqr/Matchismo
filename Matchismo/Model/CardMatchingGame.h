//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Dave Rolin on 2/9/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// This is our designated initializer
- (id)initWithCardCount:(NSInteger)cardCount
              usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSInteger)index;

- (Card *)cardAtIndex:(NSInteger)index;

@property (nonatomic, readonly) int score;
@property (nonatomic, readonly) NSString *flipResults;

@end
