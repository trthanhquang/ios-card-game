//
//  PlayingCard.m
//  CardGame
//
//  Created by LouisTran on 1/9/14.
//  Copyright (c) 2014 Louis. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
-(NSString *)content{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

-(int)match:(NSArray *)otherCards{
    int score = 0;
    if ([otherCards count]==1)
    {
        PlayingCard* other = [otherCards firstObject];
        if(other.rank==self.rank){
            score =4;
        }else if([other.suit isEqualToString:self.suit]){
            score =1;
        }
//        for (PlayingCard* other in otherCards){
//            if ([self.suit isEqualToString:other.suit])
//                score += 1;
//            else if(self.rank == other.rank){
//                score += 4;
//            }
//        }
    }
    return score;
}

@synthesize suit=_suit;
-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}
- (NSString *)suit{
    return _suit ? _suit:@"?";
}

+(NSArray *)validSuits{
    return @[@"♠︎",@"♣︎",@"♦︎",@"♥︎"];
}
+(NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",
             @"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger) maxRank{
    return [[self rankStrings] count]-1;
}

-(void)setRank:(NSInteger)rank{
    if (rank <=[PlayingCard maxRank]){
        _rank = rank;
    }
}

@end
