//
//  Question.m
//  Triviality
//
//  Created by DetroitLabs on 5/20/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "Question.h"

@implementation Question

-(id)initWithQuestionAndPossibleAnswers:(NSString *)question a1:(NSString *)possibleAnswer1 a2:(NSString *)possibleAnswer2 a3:(NSString *)possibleAnswer3 a4:(NSString *)possibleAnswer4 answer:(NSString *)answer {
    self = [super init];
    if (self) {
        _question = question;
        _possibleAnswers = [[NSArray alloc]initWithObjects:possibleAnswer1, possibleAnswer2, possibleAnswer3, possibleAnswer4, nil];
        _answer = answer;
        
    }
    return self;
}

+(id)initWithQuestionAndPossibleAnswers:(NSString *)question a1:(NSString *)possibleAnswer1 a2:(NSString *)possibleAnswer2 a3:(NSString *)possibleAnswer3 a4:(NSString *)possibleAnswer4 answer:(NSString *)answer {
    return [[self alloc] initWithQuestionAndPossibleAnswers:question a1:possibleAnswer1 a2:possibleAnswer2 a3:possibleAnswer3 a4:possibleAnswer4 answer:answer];
}

@end
