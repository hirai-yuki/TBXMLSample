//
//  ViewController.m
//  TBXMLSample
//
//  Created by hirai.yuki on 2013/01/25.
//  Copyright (c) 2013年 hirai.yuki. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "TBXML+Dictionary.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://dev.classmethod.jp/feed/"]];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDate *startDate = [NSDate date];
        
        NSError *error = nil;

        // レスポンスデータからTBXMLインスタンスを生成
        TBXML *tbxml = [[TBXML alloc] initWithXMLData:responseObject error:&error];
        
        if (!error) {
            NSDictionary *xml = [TBXML dictionaryWithElement:tbxml.rootXMLElement];
            
            NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:startDate];
            NSLog(@"実行時間 : %lf (sec)\n%@", interval, xml);
        } else {
            NSLog(@"%@ %@", [error localizedDescription], [error userInfo]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@ %@", [error localizedDescription], [error userInfo]);
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

@end
