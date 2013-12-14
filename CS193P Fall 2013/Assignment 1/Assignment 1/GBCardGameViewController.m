//
//  GBViewController.m
//  Assignment 1
//
//  Created by Gerardo Blanco García on 07/12/13.
//  Copyright (c) 2013 Gerardo Blanco García. All rights reserved.
//

#import "GBCardGameViewController.h"

#import "GBDeck.h"
#import "GBPlayingCardDeck.h"

@interface GBCardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

@property (nonatomic) int flipCount;

@property (nonatomic, strong) GBDeck *deck;

@end

@implementation GBCardGameViewController

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipsCount = %d", self.flipCount);
}

- (GBDeck *)deck
{
    if (!_deck) {
        _deck = [self createDeck];
    }
    
    return _deck;
}

- (GBDeck *)createDeck
{
    return [[GBPlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    if ([sender.currentTitle length]) {
        UIImage *cardImage = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
    } else {
        GBCard *card = [self.deck drawRandomCard];
        if (card) {
            UIImage *cardImage = [UIImage imageNamed:@"cardfront"];
            [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
            [sender setTitleColor:card.color forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
}

@end
