//
//  ViewController.m
//  CardGame
//
//  Created by LouisTran on 31/8/14.
//  Copyright (c) 2014 Louis. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "Card.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipLable;
@property (nonatomic, getter = getCardTitle) NSString *cardTitle;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *cardDeck;

@end

@implementation ViewController

- (PlayingCardDeck *)cardDeck{
    if(!_cardDeck) _cardDeck = [[PlayingCardDeck alloc] init];
    return _cardDeck;
}

- (void)setFlipCount:(int)flipCount{
    _flipCount =flipCount;
    self.flipLable.text = [NSString stringWithFormat:@"Count %d",self.flipCount];
    NSLog(@"count %d",self.flipCount);
}

- (NSString *)getCardTitle{
    Card *randomCard = nil;
    randomCard = [self.cardDeck drawRandomCard];
    return[randomCard content];
}

- (IBAction)flipCard:(UIButton *)sender {
    if ([sender.currentTitle length]){
        UIImage *cardImage = [UIImage imageNamed:@"CardBack"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    else if([self.cardDeck getSize])
    {
        UIImage *cardImage = [UIImage imageNamed:@"CardFront"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:self.getCardTitle forState:UIControlStateNormal];
        self.flipCount++;
    }
}
@end