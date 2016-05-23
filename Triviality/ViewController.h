//
//  ViewController.h
//  Triviality
//
//  Created by DetroitLabs on 5/20/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//
//  Need a question object with string property for question and NSArray for possible answers
//  

#import <UIKit/UIKit.h>
#import "Question.h"

@interface ViewController : UIViewController {
    IBOutlet UIButton *answerOneButton;
    IBOutlet UIButton *answerTwoButton;
    IBOutlet UIButton *answerThreeButton;
    IBOutlet UIButton *answerFourButton;
    IBOutlet UIButton *nextQuestionButton;
    IBOutlet UILabel *questionText;
    IBOutlet UILabel *rightOrWrongText;
}

@property NSDictionary *questionDictionary;
@property NSUInteger score;
@property NSUInteger questionNumber;

- (BOOL)checkAnswer:(NSString *)selectedAnswer;
- (void)updateQuestion:(NSUInteger)newQuestionNumber;
- (void)createQuestionDictionary;
- (void)setLabelsAndButtons:(NSUInteger)questionNumber;
- (void)setButtonTextAndUIProperties:(Question *)questionContainingButtonText;
- (void)setLabelText:(Question *)questionContainingLabelText;
- (void)updateUIForCorrectAnswer;
- (void)updateUIForWrongAnswer;
- (void)resetBackgroundToWhite;
- (void)reset;

@end

