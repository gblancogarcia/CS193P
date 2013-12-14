//
//  GBCardMatchingGame.h
//  Assignment 2
//
//  Created by Gerardo Blanco García on 14/12/13.
//  Copyright (c) 2013 Gerardo Blanco García. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GBDeck.h"

@interface GBCardMatchingGame : NSObject

// Designated initializer.
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(GBDeck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (GBCard *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end