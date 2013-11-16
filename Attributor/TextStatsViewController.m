//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Jeroen Wesbeek on 16/11/13.
//  Copyright (c) 2013 MyCompany. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController()
@property (weak, nonatomic) IBOutlet UILabel *colorfulChararactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;
@end

@implementation TextStatsViewController

// code to test if this view controller works as expected
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    // add some attributed string for testing purposed
//    self.textToAnalyze = [[NSAttributedString alloc] initWithString:@"test"
//                                                         attributes:@{ NSForegroundColorAttributeName : [UIColor greenColor],
//                                                                       NSStrokeWidthAttributeName : @-3} ];
//}

- (void)setTextToAnalyse:(NSAttributedString *)textToAnalyze {
    _textToAnalyze = textToAnalyze;
    
    // update the UI if we're on screen
    if (self.view.window) [self updateUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateUI];
}


- (void)updateUI {
    self.colorfulChararactersLabel.text = [NSString stringWithFormat:@"%lu colorful characters", [[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%lu outlined characters", [[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
}

- (NSAttributedString *)charactersWithAttribute:(NSString *)attributeName {
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    
    long index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName
                                         atIndex:index
                                  effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        } else {
            index++;
        }
    }
    
    return characters;
}

@end
