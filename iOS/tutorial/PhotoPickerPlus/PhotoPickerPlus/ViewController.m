//
//  ViewController.m
//  PhotoPickerPlus
//
//  Created by Brandon Coston on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize imageView;

-(IBAction)pickPhotoSelected:(id)sender{
    SlideChute *temp = [[SlideChute alloc] init];
    [temp setDelegate:self];
    [self setModalPresentationStyle:UIModalPresentationCurrentContext];
    [self presentViewController:temp animated:YES completion:^(void){
        [temp release];
    }];
}

-(void) slideChuteControllerDidCancel:(SlideChute *)picker{
    [self dismissViewControllerAnimated:YES completion:^(void){
        
    }];
}
-(void) slideChuteController:(SlideChute *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [self dismissViewControllerAnimated:YES completion:^(void){
        [[self imageView] setImage:[info objectForKey:UIImagePickerControllerOriginalImage]];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end