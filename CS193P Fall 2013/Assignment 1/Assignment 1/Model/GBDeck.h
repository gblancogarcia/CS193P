//
//  GBDeck.h
//  Assignment 1
//
//  Created by Gerardo Blanco García on 07/12/13.
//  Copyright (c) 2013 Gerardo Blanco García. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GBCard.h"

@interface GBDeck : NSObject

- (void)addCard:(GBCard *)card;

- (void)addCard:(GBCard *)card atTop:(BOOL)atTop;

- (GBCard *)drawRandomCard;

@end
