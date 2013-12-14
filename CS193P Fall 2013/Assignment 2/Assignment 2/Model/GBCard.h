//
//  GBCard.h
//  Assignment 2
//
//  Created by Gerardo Blanco García on 07/12/13.
//  Copyright (c) 2013 Gerardo Blanco García. All rights reserved.
//

@import Foundation;

@interface GBCard : NSObject

@property (nonatomic, strong) NSString *contents;

@property (nonatomic, strong) UIColor *color;

@property (nonatomic, getter = isChosen) BOOL chosen;

@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
