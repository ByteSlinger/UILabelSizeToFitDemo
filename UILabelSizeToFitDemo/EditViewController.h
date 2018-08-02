//
//  EditViewController.h
//  UILabelSizeToFitDemo
//
//  Copyright © 2018 ByteSlinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface EditViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (readwrite) ViewController *passedViewController;
@end
