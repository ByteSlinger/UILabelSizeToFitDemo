//
//  ViewController.h
//  UILabelSizeToFitDemo
//
//  Copyright © 2018 ByteSlinger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (readwrite) UILabel *label;
- (void)updateLabel:(NSString *)notes;

@end

