//
//  ViewController.m
//  UILabelSizeToFitDemo
//
//  Copyright © 2018 ByteSlinger. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"

@interface ViewController ()

@end

@implementation ViewController
static NSString *INITIAL_TEXT = @"Line 1\nLine ............... 2\nLine .... 3";

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // skip '#' character
    [scanner scanHexInt:&rgbValue];
    
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0
                           green:((rgbValue & 0xFF00) >> 8)/255.0
                            blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self updateLabel:INITIAL_TEXT];
}

/*
    After rotation make sure the label fits and recenter it
 */
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    if (_label != nil) {
        [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
         {
             [self updateLabel:self->_label.text];
         } completion:^(id<UIViewControllerTransitionCoordinatorContext> context)
         {}];
    }
}

// this is called before the segue.  Set the UILabel in the EditViewController.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EditViewController *vc = [segue destinationViewController];
    
    vc.passedViewController = sender;
}

- (IBAction)editLabel:(id)sender {
    [self performSegueWithIdentifier:@"edit-label" sender:self];
}

-(void)updateLabel:(NSString *)notes {
    // close to the "sticky" notes color
    UIColor *bananaColor = [ViewController colorWithHexString:@"#FFFC79"];
    
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        _label.numberOfLines = 0;
        _label.textColor = UIColor.blackColor;
        _label.backgroundColor = [bananaColor colorWithAlphaComponent:0.9f];
        _label.textAlignment = NSTextAlignmentLeft;
        
        [self.view addSubview:_label];
    }
    
    // set new text
    _label.text = notes;
    
    // make font size based on screen size
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat fontSize = MIN(screenWidth,screenHeight) / 12;
    [_label setFont:[UIFont systemFontOfSize:fontSize]];
    
    // calculate the bounding rect, limiting the width to the width of the view
    CGRect frame = [notes boundingRectWithSize:CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX)
                                       options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                    attributes:@{NSFontAttributeName: _label.font}
                                       context:nil];

    // set frame and then use sizeToFit
    [_label setFrame:frame];
    [_label sizeToFit];
    
    // center the label in my view
    CGPoint center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    [_label setCenter:center];
}

- (void)updateLabel1:(NSString *)notes {
    // close to the "sticky" notes color
    UIColor *bananaColor = [ViewController colorWithHexString:@"#FFFC79"];
    
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        _label.numberOfLines = 0;
        _label.textColor = UIColor.blackColor;
        [_label setBackgroundColor:[bananaColor colorWithAlphaComponent:0.9f]];
        _label.textAlignment = NSTextAlignmentLeft;
        
        [self.view addSubview:_label];
    }
    
    // make font size based on screen size
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat fontSize = MIN(screenWidth,screenHeight) / 12;
    [_label setFont:[UIFont systemFontOfSize:fontSize]];
    
    // split lines
    NSArray *lines = [notes componentsSeparatedByString:@"\n"];
    NSString *longestLine = lines[0];   // prime it with 1st line
    
    // fill a temp UILabel with each line to find the longest line
    for (int i = 0; i < lines.count; i++) {
        NSString *line = (NSString *)lines[i];
        
        if (longestLine == nil || line.length > longestLine.length) {
            longestLine = line;
        }
    }
    
    // force UILabel to fit the largest line
    [_label setNumberOfLines:1];
    [_label setText:longestLine];
    [_label sizeToFit];
    
    // make sure it doesn't go off the screen
    if (_label.frame.size.width > screenWidth) {
        CGRect frame = _label.frame;
        frame.size.width = screenWidth - 20;
        _label.frame = frame;
    }
    // now fill with the actual notes (this saves the previous width)
    [_label setNumberOfLines:0];
    [_label setText:notes];
    [_label sizeToFit];

    // center the label in my view
    CGPoint center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    [_label setCenter:center];
}


@end
