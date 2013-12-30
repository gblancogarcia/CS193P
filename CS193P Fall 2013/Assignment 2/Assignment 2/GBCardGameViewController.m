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

@property (nonatomic) int flipCount;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSegmentedControl;

@end

@implementation GBCardGameViewController

- (void)viewDidLoad
{
    [self.modeSegmentedControl setTintColor:[UIColor clearColor]];
    [self.modeSegmentedControl setTintColor:self.view.tintColor];
    
    self.resultLabel.text = @"";
}

- (GBDeck *)createDeck
{
    return [[GBPlayingCardDeck alloc] init];
}

- (GBCardMatchingGame *)game
{
    if (!_game) {
        _game = [[GBCardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                    usingDeck:[self createDeck]];
        _game.numberOfMatchingCards = [self numberOfMatchingCards];
    }
    
    return _game;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    self.flipCount++;
    [self updateUI];
}

- (IBAction)changeModeSelector:(UISegmentedControl *)sender
{
    self.game.numberOfMatchingCards = [self numberOfMatchingCards];
}

- (NSUInteger) numberOfMatchingCards
{
    return [[self.modeSegmentedControl titleForSegmentAtIndex:self.modeSegmentedControl.selectedSegmentIndex] integerValue];
}

- (IBAction)dealButtonPressed:(id)sender {
    
    self.game = nil;
    self.modeSegmentedControl.enabled = YES;
    self.flipCount = 0;
    [self updateUI];
}

- (void)updateUI
{
    if (self.flipCount > 0) {
        self.modeSegmentedControl.enabled = NO;
    }
    
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
    self.resultLabel.text = self.game.result;
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
