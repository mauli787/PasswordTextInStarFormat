//
//  ViewController.m
//  PasswordTextFld
//
//  Created by Dnyaneshwar Shinde on 20/02/18.
//  Copyright © 2018 Dnyaneshwar Shinde. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    NSString *passwordString,*passwordStar;
    BOOL passwordTextFieldHadFocus ;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    passwordTextFieldHadFocus = YES;
    self.PasswordTextField.delegate =self;
    self.PasswordTextField.enablesReturnKeyAutomatically = YES;
    
}
- (BOOL) textField: (UITextField *)theTextField shouldChangeCharactersInRange: (NSRange)range replacementString: (NSString *)string {
    return YES;
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    passwordString = textField.text;
    NSString *str = textField.text;
    NSMutableString *paswwordStr= [NSMutableString new];

    if (str.length > 0) {
        for (int i = 0; i<str.length; i++) {
            [paswwordStr appendString:@"*"];
            self.PasswordTextField.text = @"";
        }
        NSLog(@"%@",paswwordStr);
        passwordStar = paswwordStr;
        self.PasswordTextField.text = paswwordStr;
    }
}
- (IBAction)changeButtonAction:(UIButton *)sender {
    
    if (passwordTextFieldHadFocus == YES)
    {
        UIImage *btnImage = [UIImage imageNamed:@"eyeopen"];
        [self.changeButton setImage:btnImage forState:UIControlStateNormal];
        passwordTextFieldHadFocus = NO;
        [self.PasswordTextField resignFirstResponder];
        
        self.PasswordTextField.text = passwordString;
    }else {
        self.PasswordTextField.text = passwordStar;
        UIImage *btnImage = [UIImage imageNamed:@"eyeclose"];
        [self.changeButton setImage:btnImage forState:UIControlStateNormal];
        passwordTextFieldHadFocus = YES;
        [self.PasswordTextField resignFirstResponder];
    }
}
@end
