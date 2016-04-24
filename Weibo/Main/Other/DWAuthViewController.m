//
//  DWAuthViewController.m
//  Weibo
//
//  Created by Daniel on 16/2/28.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWAuthViewController.h"
#import "DWAccount.h"
#define AuthURL @"https://api.weibo.com/oauth2/authorize?client_id=1025145242&redirect_uri=http://www.vocabulary.com/&response_type=code"
#import "DWHttpTool.h"
@interface DWAuthViewController ()<UIWebViewDelegate>
@property (nonatomic,weak) IBOutlet UIWebView *webView;
@end

@implementation DWAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:AuthURL];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest: request];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *absoluteStr = [request.URL absoluteString];
    NSRange range = [absoluteStr rangeOfString:@"code="];
    if (range.length != 0) {
        NSUInteger fromIndex = range.location + range.length;
        NSString *code = [absoluteStr substringFromIndex:fromIndex];
        [self exchangeTokenWithCode:code];
        return NO;
    }
    return YES;
}
- (void)exchangeTokenWithCode:(NSString *)code
{
    NSDictionary *params = @{@"client_id" : @"1025145242",
                             @"client_secret" : @"2e264190d37e5d99382a4f30de539b4f",
                             @"grant_type" : @"authorization_code",
                             @"code" : code,
                             @"redirect_uri" : @"www.vocabulary.com/",};
    
    [DWHttpTool postWithURL:@"https://api.weibo.com/oauth2/access_token"
                     params:params
                    success:^(id json) {
                        DWAccount *account = [DWAccount accountWithDict:json];
                        [account save];
                     }
                    failure:^(NSError *error) {
                         
                     }];
}
@end
