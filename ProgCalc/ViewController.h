//
//  ViewController.h
//  ProgCalc
//
//  Created by kazuyoshi kawakami on 13/06/08.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int mode;
}

@property (retain, nonatomic) IBOutlet UILabel *label1;
@property (retain, nonatomic) IBOutlet UILabel *labelOp;
@property (retain, nonatomic) IBOutlet UILabel *label2;
- (IBAction)click7:(id)sender;
- (IBAction)click8:(id)sender;
- (IBAction)click9:(id)sender;
- (IBAction)click4:(id)sender;
- (IBAction)click5:(id)sender;
- (IBAction)click6:(id)sender;
- (IBAction)click1:(id)sender;
- (IBAction)click2:(id)sender;
- (IBAction)click3:(id)sender;
- (IBAction)click0:(id)sender;
- (IBAction)clickClear:(id)sender;
- (IBAction)clickOpPlus:(id)sender;
- (IBAction)clickOpMuins:(id)sender;
- (IBAction)clickOpMul:(id)sender;
- (IBAction)clickOpDiv:(id)sender;
- (IBAction)clickOpEqua:(id)sender;

- (void)pushNum:(int)num;
- (void)pushOp:(int)op;

@end
