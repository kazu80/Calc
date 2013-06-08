//
//  ViewController.m
//  ProgCalc
//
//  Created by kazuyoshi kawakami on 13/06/08.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    mode = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_label1 release];
    [_labelOp release];
    [_label2 release];
    [super dealloc];
}
- (IBAction)click7:(id)sender {
    [self pushNum:7];
}

- (IBAction)click8:(id)sender {
    [self pushNum:8];
}

- (IBAction)click9:(id)sender {
    [self pushNum:9];
}

- (IBAction)click4:(id)sender {
    [self pushNum:4];
}

- (IBAction)click5:(id)sender {
    [self pushNum:5];
}

- (IBAction)click6:(id)sender {
    [self pushNum:6];
}

- (IBAction)click1:(id)sender {
    [self pushNum:1];
}

- (IBAction)click2:(id)sender {
    [self pushNum:2];
}

- (IBAction)click3:(id)sender {
    [self pushNum:3];
}

- (IBAction)click0:(id)sender {
    [self pushNum:0];
}

- (IBAction)clickClear:(id)sender {
    self.label1.text = @"0";
    self.labelOp.text = @"＋";
    self.label2.text = @"0";
}

- (IBAction)clickOpPlus:(id)sender {
    [self pushOp:0];
}

- (IBAction)clickOpMuins:(id)sender {
    [self pushOp:1];
}

- (IBAction)clickOpMul:(id)sender {
    [self pushOp:2];
}

- (IBAction)clickOpDiv:(id)sender {
    [self pushOp:3];
}

- (IBAction)clickOpEqua:(id)sender {
    // ラベルから値を取得する
    int n1 = [self.label1.text intValue];
    int n2 = [self.label2.text intValue];
    
    //ラベルから記号を取得する
    NSString *op = self.labelOp.text;
    int ans = 0;
    
    //
    if ( [op isEqualToString:@"＋"] ) {
        ans = n1 + n2;
    }
    else if ( [op isEqualToString:@"−"] ){
        ans = n1 - n2;
    }
    else if ( [op isEqualToString:@"×"] ){
        ans = n1 * n2;
    }
    else if ( [op isEqualToString:@"÷"] ){
        if ( n2 == 0 ) {
            return;
        }
        ans = n1 / n2;
    }
    
    self.label1.text = [NSString stringWithFormat:@"%d", ans];
    self.labelOp.text = @"";
    self.label2.text = @"";
    
    mode = 0;
    
    
}

- (void)pushNum:(int)num
{
    // ２桁の数値に対応する
    if ( mode == 0 ) {
        int n = [self.label1.text intValue];
        num = n * 10 + num;
    } else {
        int n = [self.label2.text intValue];
        num = n * 10 + num;
    }

    // ２桁以上は入力させない
    if ( [self isOverNumer:num] ) {
        return;
    }

    
    // 数値をラベルに表示させる
    NSString *str = [NSString stringWithFormat:@"%d", num];
    
    if ( mode == 0 ) {
        self.label1.text = str;
    } else {
        self.label2.text = str;
    }
    
}

-(bool)isOverNumer:(int)num
{
    if ( num >= 100 ) {
        return YES;
    } else {
        return NO;
    }
}

-(void)pushOp:(int)op
{
    //記号をラベルに表示する
    switch (op) {
        case 0:
            self.labelOp.text = @"＋";
            break;
        case 1:
            self.labelOp.text = @"−";
            break;
        case 2:
            self.labelOp.text = @"×";
            break;
        case 3:
            self.labelOp.text = @"÷";
            break;
        default:
            break;
    }
    
    mode = 1;
}

@end
