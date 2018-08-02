//
//  EditViewController.m
//  UILabelSizeToFitDemo
//
//  Copyright © 2018 ByteSlinger. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (_passedViewController != nil) {
        _textView.text = _passedViewController.label.text;
        _textView.font = _passedViewController.label.font;
    }
}

- (IBAction)okButtonClicked:(id)sender {
    [_passedViewController updateLabel:_textView.text];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
