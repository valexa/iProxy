/*
 * Copyright 2010, Torsten Curdt
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "StatusViewController.h"

@implementation StatusViewController

@synthesize ipLabel;
@synthesize portLabel;
@synthesize theURL;
@synthesize urlLabel;
@synthesize uploadLabel;
@synthesize downloadLabel;

-(void)viewDidLoad{
	titleLabel.text = @"iPad Configuration (flip for Mac):";
	ipadView.frame = CGRectMake(9,240,300,142);		
	[self.view addSubview:ipadView];	
}

- (IBAction)showInstructions
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://github.com/valexa/iProxy"]]; 
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return TRUE;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
	UIInterfaceOrientation theInterfaceOrientation = [self interfaceOrientation];	
	if (theInterfaceOrientation == UIInterfaceOrientationPortrait || theInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
		[macView removeFromSuperview];	
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];	
		titleLabel.text = @"(flip device to see Mac configuration)";		
		titleLabel.frame = CGRectMake(35,197,248,21);
		ipadView.frame = CGRectMake(9,240,300,142);			
		[self.view addSubview:ipadView];
		[UIView commitAnimations];			
	}else {
		[ipadView removeFromSuperview];					
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];			
		titleLabel.text = @"(flip device to see iPad configuration)";
		titleLabel.frame = CGRectMake(116,133,248,21);		
		macView.frame = CGRectMake(5,165,469,125);			
		[self.view addSubview:macView];	
		[UIView commitAnimations];				
	}	
}

@end
