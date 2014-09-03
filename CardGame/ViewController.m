//
//  ViewController.m
//  CardGame
//
//  Created by LouisTran on 31/8/14.
//  Copyright (c) 2014 Louis. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipLable;
@property (nonatomic, getter = getCardTitle) NSString *cardTitle;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *cardDeck;
@property (strong, nonatomic) PlayingCardGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation ViewController

- (PlayingCardGame *) game{
    if(!_game) _game =[[PlayingCardGame alloc] initGame:[self.cardButtons count]
                                               withDeck:[self createDeck]];
    return _game;
}

- (Deck *)cardDeck{
    if(!_cardDeck) _cardDeck = [[PlayingCardDeck alloc] init];
    return _cardDeck;
}

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (void)setFlipCount:(int)flipCount{
    _flipCount =flipCount;
    self.flipLable.text = [NSString stringWithFormat:@"Count %d",self.flipCount];
    NSLog(@"count %d",self.flipCount);
}

- (IBAction)touchCard:(UIButton *)sender {
    NSUInteger index = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:index];
    [self updateUI];
    self.flipCount++;
    
//    if ([sender.currentTitle length]){
//        UIImage *cardImage = [UIImage imageNamed:@"CardBack"];
//        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
//        [sender setTitle:@"" forState:UIControlStateNormal];
//    }
//    else{
//        Card * newCard = [self.cardDeck drawRandomCard];
//        if (newCard){
//            UIImage *cardImage = [UIImage imageNamed:@"CardFront"];
//            [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
//            [sender setTitle:newCard.content forState:UIControlStateNormal];
//            self.flipCount++;
//        }
//    }
}

- (void) updateUI{
    for (UIButton * cardButton in self.cardButtons){
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game getCardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
}

- (NSString *)titleForCard:(Card *)card{
    return card.isChosen? card.content : @"";
}

- (UIImage *)backgroundImageForCard:(Card* )card{
    return [UIImage imageNamed:card.isChosen? @"CardFront": @"CardBack"];
}
@end