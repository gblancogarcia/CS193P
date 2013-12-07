//
//  PlayingCard.h
//  Assignment 1
//
//  Created by Gerardo Blanco García on 07/12/13.
//  Copyright (c) 2013 Gerardo Blanco García. All rights reserved.
//

#import "GBCard.h"

@interface GBPlayingCard : GBCard

@property (strong, nonatomic) NSString *suit;

@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;

+ (NSUInteger)maxRank;

@end
