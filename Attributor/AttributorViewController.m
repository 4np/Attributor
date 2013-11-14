//
//  AttributorViewController.m
//  Attributor
//
//  Created by Jeroen Wesbeek on 14/11/13.
//  Copyright (c) 2013 MyCompany. All rights reserved.
//

#import "AttributorViewController.h"

@interface AttributorViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;
@end

@implementation AttributorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // make the title of the button outlined and set the color to be the global tint color
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
    [title setAttributes:@{ NSStrokeWidthAttributeName : @3,
                            NSStrokeColorAttributeName : self.outlineButton.tintColor }
                   range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title
                                  forState:UIControlStateNormal];
}

- (IBAction)changeBodySelectionColorToMatchBackgroundOfButton:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:sender.backgroundColor
                                  range:self.body.selectedRange];
}

- (IBAction)outlineBodySelection {
    [self.body.textStorage addAttributes:@{ NSStrokeWidthAttributeName : @-3,
                                            NSStrokeColorAttributeName : [UIColor blackColor] }
                                   range:self.body.selectedRange];
}

- (IBAction)unOutlineBodySelection {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName
                                     range:self.body.selectedRange];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
