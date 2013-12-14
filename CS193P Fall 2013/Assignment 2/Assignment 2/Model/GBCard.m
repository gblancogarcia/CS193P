//
//  GBCard.m
//  Assignment 2
//
//  Created by Gerardo Blanco García on 07/12/13.
//  Copyright (c) 2013 Gerardo Blanco García. All rights reserved.
//

#import "GBCard.h"

@interface GBCard ()

@end

@implementation GBCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (GBCard *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}


@end
