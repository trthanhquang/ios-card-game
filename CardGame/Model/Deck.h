//
//  Deck.h
//  CardGame
//
//  Created by LouisTran on 31/8/14.
//  Copyright (c) 2014 Louis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;
-(Card *)drawRandomCard;
-(NSUInteger)getSize;
@end
