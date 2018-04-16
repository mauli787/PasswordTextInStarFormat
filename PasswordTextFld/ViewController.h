//
//  ViewController.h
//  PasswordTextFld
//
//  Created by Dnyaneshwar Shinde on 20/02/18.
//  Copyright © 2018 Dnyaneshwar Shinde. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic,strong) IBOutlet UITextField *PasswordTextField;

@property (weak, nonatomic) IBOutlet UIButton *changeButton;

- (IBAction)changeButtonAction:(UIButton *)sender;

@end

