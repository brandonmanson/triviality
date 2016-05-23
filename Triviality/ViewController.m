//
//  ViewController.m
//  Triviality
//
//  Created by DetroitLabs on 5/20/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)createQuestionDictionary {
    // Create Questions
    Question *question1 = [[Question alloc] initWithQuestionAndPossibleAnswers:
                           @"How many states are there in the US?"
                                                                            a1:@"50"
                                                                            a2:@"52"
                                                                            a3:@"47"
                                                                            a4:@"63"
                                                                        answer:@"50"];
    
    Question *question2 = [[Question alloc]initWithQuestionAndPossibleAnswers:
                           @"What is Ford's best-selling model of all time?"
                                                                           a1:@"Taurus"
                                                                           a2:@"F-150"
                                                                           a3:@"Mustang"
                                                                           a4:@"Transit Van"
                                                                       answer:@"F-150"];
    
    Question *question3 = [[Question alloc]initWithQuestionAndPossibleAnswers:
                           @"How many games has the MSU football team won in the last 3 seasons (2013-2015)"
                                                                           a1:@"30"
                                                                           a2:@"36"
                                                                           a3:@"25"
                                                                           a4:@"40"
                                                                       answer:@"36"];
    
    Question *question4 = [[Question alloc] initWithQuestionAndPossibleAnswers:
                           @"How long does it take to make ramen noodles, pour a glass of wine and get back to coding?"
                                                                            a1:@"9 minutes"
                                                                            a2:@"7 minutes"
                                                                            a3:@"15 minutes"
                                                                            a4:@"12 minutes"
                                                                        answer:@"9 minutes"];
    
    Question *question5 = [[Question alloc] initWithQuestionAndPossibleAnswers:
                           @"What number does the quarterback for the Indianapolis Colts wear?"
                                                                            a1:@"8"
                                                                            a2:@"18"
                                                                            a3:@"12"
                                                                            a4:@"9"
                                                                        answer:@"12"];
    
    // Create Question dictionary
    _questionDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                           question1, @"Question 1",
                           question2, @"Question 2",
                           question3, @"Question 3",
                           question4, @"Question 4",
                           question5, @"Question 5",
                           nil];
}

- (void)updateUIForCorrectAnswer {
    self.view.backgroundColor = [UIColor greenColor];
    [rightOrWrongText setTextColor:[UIColor whiteColor]];
    [rightOrWrongText setText:@"Correct!"];
    [nextQuestionButton setEnabled:YES];
    nextQuestionButton.alpha = 100.0;
}

- (void)updateUIForWrongAnswer {
    self.view.backgroundColor = [UIColor redColor];
    [self performSelector:@selector(resetBackgroundToWhite) withObject:nil afterDelay:1.0];
    [rightOrWrongText setTextColor:[UIColor whiteColor]];
    [rightOrWrongText setText:@"Guess Again!"];
}

-(void)resetBackgroundToWhite {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (BOOL)checkAnswer:(NSString *)selectedAnswer {
    
    NSString *questionNumber = [[NSString alloc]initWithFormat:@"Question %lu", _questionNumber];
    Question *answer = [_questionDictionary objectForKey:questionNumber];
    NSString *answerText = answer.answer;
    if ([selectedAnswer isEqualToString:answerText]) {
        [self updateUIForCorrectAnswer];
        _score++;
        NSLog(@"Score is %lu", _score);
        return YES;
    } else {
        [self updateUIForWrongAnswer];
        return NO;
    }
}

-(void)setButtonTextAndUIProperties:(Question *)questionContainingButtonText {
    // Create variables for button text
    NSString *questionOneText = questionContainingButtonText.possibleAnswers[0];
    NSString *questionTwoText = questionContainingButtonText.possibleAnswers[1];
    NSString *questionThreeText = questionContainingButtonText.possibleAnswers[2];
    NSString *questionFourText = questionContainingButtonText.possibleAnswers[3];
    
    // Set Next Question button to disabled and transparent
    [nextQuestionButton setEnabled:NO];
    nextQuestionButton.alpha = 0.0;
    
    // Set text on buttons
    [answerOneButton setTitle:questionOneText forState:UIControlStateNormal];
    [answerTwoButton setTitle:questionTwoText forState:UIControlStateNormal];
    [answerThreeButton setTitle:questionThreeText forState:UIControlStateNormal];
    [answerFourButton setTitle:questionFourText forState:UIControlStateNormal];
}

- (void)setLabelText:(Question *)questionContainingLabelText {
    // Create variable for question text
    NSString *questionLabelText = questionContainingLabelText.question;
    
    // Set label text
    [questionText setText:questionLabelText];
    
    // Set right or wrong label to an empty string and change text color to black (not sure why I'm still doing that)
    [rightOrWrongText setText:@""];
    [rightOrWrongText setTextColor:[UIColor blackColor]];
}


- (void)setLabelsAndButtons:(NSUInteger)questionNumber {
    // Get ket to access current question from _questionDictionary
    NSString *newQuestionKey = [[NSString alloc]initWithFormat:@"Question %lu", questionNumber];
    
    // Question we are pulling data from
    Question *question  = [_questionDictionary objectForKey:newQuestionKey];
    
    // Updating buttons and labels
    [self setButtonTextAndUIProperties:question];
    [self setLabelText:question];
}

- (void)updateQuestion:(NSUInteger)newQuestionNumber {
    // End game if score is 5
    if (_score == 5) {
        UIAlertController *endScore = [UIAlertController alertControllerWithTitle:@"Well Done"
                                                                          message:@"You completed with a score of 5/5"
                                                                   preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *resetGameButton = [UIAlertAction actionWithTitle:@"Play Again"
                                                                  style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction *action) {
            [self reset];
        }];
        [endScore addAction:resetGameButton];
        [self presentViewController:endScore animated:YES completion:nil];
    } else {
        // Go to next question
        self.view.backgroundColor = [UIColor whiteColor];
        [self setLabelsAndButtons:newQuestionNumber];
    
    }
    
}

- (void)reset {
    _score = 0;
    _questionNumber = 1;
    [self updateQuestion:_questionNumber];
}

- (IBAction)answerSelected:(id)sender {
    UIButton *selectedAnswer = sender;
    NSString *selectedAnswerText = selectedAnswer.titleLabel.text;
    [self checkAnswer:selectedAnswerText];
}

- (IBAction)nextQuestionPressed:(id)sender {
    _questionNumber += 1;
    [self updateQuestion:_questionNumber];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createQuestionDictionary];
    [self reset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
