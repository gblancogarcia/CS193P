//
//  GBViewController.m
//  Assignment 1
//
//  Created by Gerardo Blanco García on 07/12/13.
//  Copyright (c) 2013 Gerardo Blanco García. All rights reserved.
//

#import "GBCardGameViewController.h"

#import "GBCardMatchingGame.h"
#import "GBDeck.h"
#import "GBPlayingCardDeck.h"

@interface GBCardGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (nonatomic, strong) GBCardMatchingGame *game;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation GBCardGameViewController

- (GBDeck *)createDeck
{
    return [[GBPlayingCardDeck alloc] init];
}

- (GBCardMatchingGame *)game
{
    if (!_game) {
        _game = [[GBCardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                    usingDeck:[self createDeck]];
    }
    
    return _game;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        GBCard *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        [cardButton setTitleColor:card.color forState:UIControlStateNormal];
        [cardButton setTitleColor:card.color forState:UIControlStateDisabled];
        cardButton.enabled = !card.isMatched;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (NSString *)titleForCard:(GBCard *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(GBCard *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
