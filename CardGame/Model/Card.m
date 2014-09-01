//
//  Card.m
//  CardGame
//
//  Created by LouisTran on 31/8/14.
//  Copyright (c) 2014 Louis. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card
-(int)match:(NSArray *)otherCards{
    int score = 0;
    for (Card *card in otherCards){
        if([card.content isEqualToString:self.content]){
            score++;
        }
    }
    return score;
}
@end
