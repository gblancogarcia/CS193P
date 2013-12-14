//
//  GBPlayingCardDeck.m
//  Assignment 2
//
//  Created by Gerardo Blanco García on 07/12/13.
//  Copyright (c) 2013 Gerardo Blanco García. All rights reserved.
//

#import "GBPlayingCardDeck.h"
#import "GBPlayingCard.h"

@implementation GBPlayingCardDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [GBPlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [GBPlayingCard maxRank]; rank++) {
                GBPlayingCard *card = [[GBPlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
