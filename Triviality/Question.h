//
//  Question.h
//  Triviality
//
//  Created by DetroitLabs on 5/20/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property(nonatomic, strong) NSString *question;
@property(nonatomic, strong) NSArray *possibleAnswers;
@property(nonatomic, strong) NSString *answer;

- (id)initWithQuestionAndPossibleAnswers:(NSString *)question
                                      a1:(NSString *)possibleAnswer1
                                      a2:(NSString *)possibleAnswer2
                                      a3:(NSString *)possibleAnswer3
                                      a4:(NSString *)possibleAnswer4
                                  answer:(NSString *)answer;

+ (id)initWithQuestionAndPossibleAnswers:(NSString *)question
                                      a1:(NSString *)possibleAnswer1
                                      a2:(NSString *)possibleAnswer2
                                      a3:(NSString *)possibleAnswer3
                                      a4:(NSString *)possibleAnswer4
                                  answer:(NSString *)answer;

@end
