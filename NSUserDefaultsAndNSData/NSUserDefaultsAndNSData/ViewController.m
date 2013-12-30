//
//  ViewController.m
//  NSUserDefaultsAndNSData
//
//  Created by Dolice on 2013/12/30.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSUserDefaults *userDefaults;
@property NSMutableArray *list;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // ユーザーデフォルト初期化
    _userDefaults  = [NSUserDefaults standardUserDefaults];
}

// ユーザーデフォルトから読み込み
- (void)loadFromUserDefaults
{
    NSData *listData = [_userDefaults objectForKey:@"UD_LIST_KEY"];
    _list = [[NSMutableArray alloc] init];
    _list = [NSKeyedUnarchiver unarchiveObjectWithData:listData];
}

// ユーザーデフォルトに保存
- (void)saveToUserDefaults
{
    _list = [[NSMutableArray alloc] initWithArray:_list];
    [_list addObject:@"Apple"];
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:_list];
    [_userDefaults setObject:listData forKey:@"UD_LIST_KEY"];
    [_userDefaults synchronize];
}

@end
