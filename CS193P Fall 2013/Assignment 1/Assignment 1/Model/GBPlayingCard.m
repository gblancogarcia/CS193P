//
//  PlayingCard.m
//  Assignment 1
//
//  Created by Gerardo Blanco García on 07/12/13.
//  Copyright (c) 2013 Gerardo Blanco García. All rights reserved.
//

#import "GBPlayingCard.h"

NSString * const GBPlayingCardHeart = @"♥️";
NSString * const GBPlayingCardDiamond = @"♦️";
NSString * const GBPlayingCardClub = @"♠️";
NSString * const GBPlayingCardSpade = @"♣️";

@implementation GBPlayingCard

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    return @[GBPlayingCardHeart, GBPlayingCardDiamond, GBPlayingCardClub, GBPlayingCardSpade];
}

- (void)setSuit:(NSString *)suit
{
    if ([[GBPlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank
{
    return ([[self rankStrings] count] - 1);
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [GBPlayingCard maxRank]) {
        _rank = rank;
    }
}

- (NSString *)contents
{
    NSArray *rankStrings = [GBPlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (UIColor *)color
{
    UIColor *color = nil;
    
    if ((self.suit == GBPlayingCardHeart) || (self.suit == GBPlayingCardDiamond)) {
        color = [UIColor redColor];
    } else {
        color = [UIColor blackColor];
    }
    
    return color;
}

@end
