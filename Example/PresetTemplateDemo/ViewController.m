//
//  ViewController.m
//  PresetTemplateDemo
//
//  Created by huangdiao on 2023/10/25.
//

#import "ViewController.h"
#if __has_include(<ThinkingSDK/ThinkingSDK.h>)
#import <ThinkingSDK/ThinkingSDK.h>
#endif
#import <TDEasyStart/TDEasyStart.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *btns = @[
        @"initTDAnalytics",
        @"trackRegister",
        @"trackLogin",
        @"trackLogout",
        @"trackPayment",
        @"trackGuide",
        @"trackLevelUp",
        @"trackStageStart",
        @"trackStageFinish",
        @"trackStageFail",
        @"trackResourceGet",
        @"trackResourceCost",
        @"flush"
    ];
    
    for (int i=0; i<btns.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:btns[i] forState:UIControlStateNormal];
        [btn setTitleColor:UIColor.blackColor forState:UIControlStateHighlighted];
        [btn setBackgroundColor:UIColor.blueColor];
        [self.view addSubview:btn];
        SEL s = NSSelectorFromString([NSString stringWithFormat:@"%@_onClick:", btns[i]]);
        [btn addTarget:self action:s forControlEvents:UIControlEventTouchUpInside];
        [btn setFrame:CGRectMake(50, 60*i+50, 300, 50)];
    }
}

- (void)initTDAnalytics_onClick:(UIButton *)sender {
#if __has_include(<ThinkingSDK/ThinkingSDK.h>)
    [TDAnalytics enableLog:YES];
//    [TDEasyStart enableAutoTrackManually];
    NSString *appId = @"7be5326f9f4a4e48933dbf2579367901";
    NSString *serverUrl = @"https://receiver-ta-preview.thinkingdata.cn";
    TDConfig *config = [[TDConfig alloc] initWithAppId:appId serverUrl:serverUrl];
    [TDAnalytics startAnalyticsWithConfig:config];
#else
    NSLog(@"未引入 TDAnalytics SDK");
#endif
}
- (void)trackRegister_onClick:(UIButton *)sender {
    TDRegisterEventModel *eventModel = [TDRegisterEventModel new];
    eventModel.accountId = @"tiki-001";
    eventModel.channel = @"AppStore";
    eventModel.eventProperties = @{ @"register_source":@"douyin" };
    eventModel.userProperties = @{ @"register_code":@"JGYJ83L29JY" };
    [TDEasyStart trackRegister:eventModel];
}
- (void)trackLogin_onClick:(UIButton *)sender {
    TDLoginEventModel *eventModel = [TDLoginEventModel new];
    eventModel.accountId = @"tiki-002";
    eventModel.eventProperties = @{ @"login_type":@"wechat" };
    [TDEasyStart trackLogin:eventModel];
}
- (void)trackLogout_onClick:(UIButton *)sender {
    [TDEasyStart trackLogout];
}
- (void)trackPayment_onClick:(UIButton *)sender {
    
    TDPaymentEventModel *eventModel = [TDPaymentEventModel new];
    eventModel.orderId = @"id_1234567890";
    eventModel.paymentName = @"钻石礼包";
    eventModel.paymentNum = 100;
    eventModel.paymentType = @"Alipay";
    eventModel.currencyType = TDCurrencyTypeUSD;
    eventModel.payAmount = 0.99;
    eventModel.eventProperties = @{ @"payment_description":@"一大箱钻石💎" };
    [TDEasyStart trackPayment:eventModel];
}

- (void)trackGuide_onClick:(UIButton *)sender {
    TDGuideEventModel *eventModel = [TDGuideEventModel new];
    eventModel.step = @"123";
    eventModel.eventProperties = @{ @"guide_sss":@"第一步💎" };
    [TDEasyStart trackGuide:eventModel];
}
- (void)trackLevelUp_onClick:(UIButton *)sender {
    TDLevelUpEventModel *eventModel = [TDLevelUpEventModel new];
    eventModel.level = 1;
    eventModel.eventProperties = @{ @"aaaa":@"aaa💎" };
    eventModel.userProperties = @{@"user_aaa":@"dddd"};
    [TDEasyStart trackLevelUp:eventModel];
}

- (void)trackStageStart_onClick:(UIButton *)sender {
    TDStageEventModel *eventModel = [TDStageEventModel new];
    eventModel.stageId = @"sssss";
    eventModel.eventProperties = @{ @"bbb1":@"aaa💎" };
    [TDEasyStart trackStageStart:eventModel];
}

- (void)trackStageFinish_onClick:(UIButton *)sender {
    TDStageEventModel *eventModel = [TDStageEventModel new];
    eventModel.stageId = @"zzzz";
    eventModel.eventProperties = @{ @"bbb2":@"aaa💎" };
    [TDEasyStart trackStageFinish:eventModel];
}

- (void)trackStageFail_onClick:(UIButton *)sender {
    TDStageEventModel *eventModel = [TDStageEventModel new];
    eventModel.stageId = @"wwww";
    eventModel.eventProperties = @{ @"bbb3":@"aaa💎" };
    [TDEasyStart trackStageFail:eventModel];
}

- (void)trackResourceGet_onClick:(UIButton *)sender {
    TDResourceEventModel *eventModel = [TDResourceEventModel new];
    eventModel.resourceId = @"abc";
    eventModel.changeNum = 10;
    eventModel.afterNum = 30;
    eventModel.eventProperties = @{ @"jjjjj":@"aaa💎" };
    [TDEasyStart trackResourceGet:eventModel];
}

- (void)trackResourceCost_onClick:(UIButton *)sender {
    TDResourceEventModel *eventModel = [TDResourceEventModel new];
    eventModel.resourceId = @"def";
    eventModel.changeNum = 20;
    eventModel.afterNum = 10;
    eventModel.eventProperties = @{ @"kkkkk":@"aaa💎" };
    [TDEasyStart trackResourceGet:eventModel];
}

- (void)flush_onClick:(UIButton *)sender {
#if __has_include(<ThinkingSDK/ThinkingSDK.h>)
    [TDAnalytics flush];
#else
    NSLog(@"未引入 TDAnalytics SDK");
#endif
}
@end
