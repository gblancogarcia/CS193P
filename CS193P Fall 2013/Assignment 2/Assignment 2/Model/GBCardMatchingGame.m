//
//  GBCardMatchingGame.m
//  Assignment 2
//
//  Created by Gerardo Blanco García on 14/12/13.
//  Copyright (c) 2013 Gerardo Blanco García. All rights reserved.
//

#import "GBCardMatchingGame.h"

@interface GBCardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;

@property (nonatomic, readwrite) NSString *result;

@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation GBCardMatchingGame

- (NSUInteger)numberOfMatchingCards
{
    if (_numberOfMatchingCards < 2) {
        _numberOfMatchingCards = 2;
    }
    
    return _numberOfMatchingCards;
}

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (instancetype)init
{
    return nil;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(GBDeck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            GBCard *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

static const int COST_TO_CHOOSE = 1;
static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    GBCard *card = [self cardAtIndex:index];
    
    NSString *result = @"";
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            NSMutableArray *otherCards = [NSMutableArray array];
            
            for (GBCard *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [otherCards addObject:otherCard];
                }
            }
            
            if ([otherCards count] == (self.numberOfMatchingCards - 1)) {
                int matchScore = [card match:otherCards];
                if (matchScore) {
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    
                    result =  [NSString stringWithFormat:@"Matched %@", card.contents];
                    
                    for (GBCard *otherCard in otherCards) {
                        otherCard.matched = YES;
                        result = [result stringByAppendingString:[NSString stringWithFormat:@" %@", otherCard.contents]];
                    }
                    
                    result = [result stringByAppendingString:[NSString stringWithFormat:@"for %d point(s).", (matchScore * MATCH_BONUS)]];
            } else {
                    self.score -= MISMATCH_PENALTY;
                    
                    result =  [NSString stringWithFormat:@"%@", card.contents];
                    
                    for (GBCard *otherCard in otherCards) {
                        otherCard.chosen = NO;
                        result = [result stringByAppendingString:[NSString stringWithFormat:@" %@", otherCard.contents]];
                    }
                    
                    result = [result stringByAppendingString:[NSString stringWithFormat:@" don’t match! %d point(s) penalty.", MISMATCH_PENALTY]];
                }
            } else {
                result = [NSString stringWithFormat:@"%@", card.contents];
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
    self.result = result;
}

- (GBCard *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] :  nil;
}

@end
