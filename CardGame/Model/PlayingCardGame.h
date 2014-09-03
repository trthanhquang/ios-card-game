//
//  PlayingCardGame.h
//  CardGame
//
//  Created by LouisTran on 1/9/14.
//  Copyright (c) 2014 Louis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface PlayingCardGame : NSObject
-(instancetype)initGame:(NSUInteger)count
               withDeck:(Deck*)deck;
-(void) chooseCardAtIndex:(NSUInteger) index;
-(Card*) getCardAtIndex:(NSUInteger) index;

@property (nonatomic,readonly) NSInteger score;

@end
