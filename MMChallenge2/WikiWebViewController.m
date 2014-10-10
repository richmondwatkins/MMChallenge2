//
//  WikiWebViewController.m
//  MMChallenge2
//
//  Created by Richmond on 10/10/14.
//  Copyright (c) 2014 Richmond. All rights reserved.
//

#import "WikiWebViewController.h"

@interface WikiWebViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *wikiWebView;

@end

@implementation WikiWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    NSString *fullURL = [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@", self.urlParams];
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.wikiWebView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onBackClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
