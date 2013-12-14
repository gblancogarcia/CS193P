//
//  GBDeck.m
//  Assignment 2
//
//  Created by Gerardo Blanco García on 07/12/13.
//  Copyright (c) 2013 Gerardo Blanco García. All rights reserved.
//

#import "GBDeck.h"

#pragma mark - Private interface

@interface GBDeck()

@property (strong, nonatomic) NSMutableArray *cards;

@end

#pragma mark -
#pragma mark Implementation

@implementation GBDeck

#pragma mark -
#pragma mark Lazy instantiation

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

#pragma mark -
#pragma mark Public methods

- (void)addCard:(GBCard *)card
{
    [self addCard:card atTop:NO];
}

- (void)addCard:(GBCard *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (GBCard *)drawRandomCard
{
    GBCard *randomCard = nil;
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

@end
