//
//  ViewController.m
//  MonitorExterno
//
//  Created by Rafael Brigagão Paulino on 16/10/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //self.view.alpha = 0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)play:(id)sender
{
    
    [[VariaveisGlobais shared].video play];
}

- (IBAction)pause:(id)sender
{
    [[VariaveisGlobais shared].video pause];

}

- (IBAction)stop:(id)sender
{
    [[VariaveisGlobais shared].video stop];

}
@end
