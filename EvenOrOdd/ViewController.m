//
//  ViewController.m
//  EvenOrOdd
//
//  Created by tstone10 on 5/23/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)evaluateInput:(id)sender {
	//attempt grabbing input as a number
	NSNumber *input = [self convertStringToNumber:[_textField text]];
	
	if(input != nil) {
		//is numeric
		//check for period to see if non-whole number
		if  ([[_textField text] rangeOfString:@"."].location != NSNotFound) {
			_resultLabel.text = @"Invalid Entry.";
		}
		else {
			int inputInt = [input intValue];
			if(inputInt % 2) {
				_resultLabel.text = @"Odd Number";
			}
			else {
				_resultLabel.text = @"Even Number";
			}
		}
	}
	else {
		_resultLabel.text = @"Invalid Entry.";
	}
}

- (NSNumber *)convertStringToNumber:(NSString *)inputText {
	NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
	return [nf numberFromString:inputText];
}

@end
