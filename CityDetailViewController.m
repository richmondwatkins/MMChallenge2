//
//  CityDetailViewController.m
//  MMChallenge2
//
//  Created by Richmond on 10/10/14.
//  Copyright (c) 2014 Richmond. All rights reserved.
//

#import "CityDetailViewController.h"
#import "WikiWebViewController.h"
@interface CityDetailViewController () <UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *cityLabel;
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;

@property (strong, nonatomic) IBOutlet UITextField *cityEditField;
@property (strong, nonatomic) IBOutlet UITextField *stateEditField;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property BOOL isEditing;
@end

@implementation CityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cityLabel.text = self.city.name;
    self.stateLabel.text = self.city.state;
    self.stateEditField.hidden = YES;
    self.cityEditField.hidden = YES;
    self.cityEditField.text = self.city.name;
    self.stateEditField.text = self.city.state;
    self.imageView.image = self.city.image;
    self.isEditing = NO;
}

- (IBAction)onEditCityButton:(UIBarButtonItem *)button {
    self.isEditing = !self.isEditing;

    if (self.isEditing == YES) {

        button.title = @"Done";
        self.cityLabel.hidden = YES;
        self.cityEditField.hidden = NO;
        self.stateLabel.hidden =YES;
        self.stateEditField.hidden = NO;
    }else{
        self.city.name = self.cityEditField.text;
        self.city.state = self.stateEditField.text;
        self.cityLabel.text = self.cityEditField.text;
        self.stateLabel.text = self.stateEditField.text;

        button.title = @"Edit";
        self.cityLabel.hidden = NO;
        self.cityEditField.hidden = YES;
        self.stateLabel.hidden = NO;
        self.stateEditField.hidden = YES;
    }
}

- (IBAction)onWikiTap:(UITapGestureRecognizer *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WikiWebViewController *wikiWebCtrl = (WikiWebViewController *)[storyboard instantiateViewControllerWithIdentifier:@"WebView"];
    wikiWebCtrl.urlParams = self.city.name;
    [self presentViewController:wikiWebCtrl  animated:YES completion:nil];
}

\
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
