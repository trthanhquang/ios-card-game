//
//  PlayingCardGame.m
//  CardGame
//
//  Created by LouisTran on 1/9/14.
//  Copyright (c) 2014 Louis. All rights reserved.
//

#import "PlayingCardGame.h"

@interface PlayingCardGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray* cardList;
@end

@implementation PlayingCardGame

-(NSMutableArray *)cardList{
    if(!_cardList){
        _cardList = [[NSMutableArray alloc] init];
        NSLog(@"init cardList");
    }
    return _cardList;
}

-(instancetype)initGame:(NSUInteger)count withDeck
                       :(Deck *)deck{
    
    self = [super init];
    
    if(self){
        for(int i =0; i<count; i++){
            Card* card = [deck drawRandomCard];
            if(card)
            {
                [self.cardList addObject:card];
            }
            else{
                self = nil;
                NSLog(@"nil...");
                break;
            }
            NSLog(@"game initialized. %lu card",[self.cardList count]);
        }
    }
    return self;
}


-(void)chooseCardAtIndex:(NSUInteger)index{
    Card * card = [self getCardAtIndex:index];
    NSLog(@"card at index %lu is %@",index,card.content);
    
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        } else {
            for (Card * other in self.cardList)
                //card.chosen is still NO here
                if(other.isChosen && !other.isMatched)
                {
                    int matchScore= [card match:@[other]];
                    if(matchScore){
                        self.score += matchScore*4;
                        card.matched = YES;
                        other.matched = YES;
                    }else{
                        other.chosen = NO;
                        self.score -= 2;
                    }
                    break;
                }
            //cost each run:
            self.score -=1;
            card.chosen = YES;
            NSLog(@"Card %@ is chosen",card.content);
        }
    }
}

-(Card *)getCardAtIndex:(NSUInteger)index{
    return (index<[self.cardList count])? self.cardList[index]: nil;
}

@end
