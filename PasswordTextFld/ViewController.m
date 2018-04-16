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
    NSString *realString;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     
    self.PasswordTextField.delegate =self;
    self.PasswordTextField.enablesReturnKeyAutomatically = YES;
      realString = [[NSString alloc] init];
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    if ( textField == _PasswordTextField)
    {
        self.PasswordTextField.secureTextEntry = NO;
        
        if ([string isEqualToString:@""]) {
            
            if (realString.length > 0) {
                realString =    [realString substringWithRange:NSMakeRange(0,[realString length] - 1)];
                self.PasswordTextField.text = [ self.PasswordTextField.text substringWithRange:NSMakeRange(0,[ self.PasswordTextField.text length] - 1)];
            }else{
                NSLog(@"Reached END of String %@",realString);
            }
            
        }else{
            realString =  [realString stringByAppendingString:string];
            NSLog(@"Real String: %@",realString);
            
            NSLog(@"Befor: %@", self.PasswordTextField.text);
            self.PasswordTextField.text = [self.PasswordTextField.text stringByReplacingCharactersInRange:range withString:@"*"];
            
            NSLog(@"After: %@", self.PasswordTextField.text);
        }
        
        return false;
    }
    
    else
        return true;
} 
- (IBAction)changeButtonAction:(UIButton *)sender {
    NSLog(@"%@",realString);
    if ([self.changeButton.currentImage isEqual:[UIImage imageNamed:@"eyeclose"]])
    {
        UIImage *btnImage = [UIImage imageNamed:@"eyeopen"];
        [self.changeButton setImage:btnImage forState:UIControlStateNormal];
        self.PasswordTextField.secureTextEntry = NO;
        self.PasswordTextField.text = realString;
        self.PasswordTextField.font = nil;
        [self.PasswordTextField resignFirstResponder];
    }
    else
    {
        UIImage *btnImage = [UIImage imageNamed:@"eyeclose"];
        [self.changeButton setImage:btnImage forState:UIControlStateNormal];
        self.PasswordTextField.text =@"";
        for (int i=0; i<= realString.length; i++ )
        {
            self.PasswordTextField.text = [self.PasswordTextField.text stringByAppendingString:@"*"];
        }
        [self.PasswordTextField resignFirstResponder];
    }
}
@end
