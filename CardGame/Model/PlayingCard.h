//
//  PlayingCard.h
//  CardGame
//
//  Created by LouisTran on 1/9/14.
//  Copyright (c) 2014 Louis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic)NSString *suit;
@property (nonatomic) NSInteger rank;
+(NSArray *)validSuits;
+(NSUInteger) maxRank;
@end
