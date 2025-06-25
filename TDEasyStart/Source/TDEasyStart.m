//
//  TDPresetTemplate.m
//  DevelopProgram
//
//  Created by huangdiao on 2023/10/24.
//

#import "TDEasyStart.h"

#if __has_include(<ThinkingDataCore/ThinkingDataCore.h>)
#import <ThinkingDataCore/ThinkingDataCore.h>
#else
#import "ThinkingDataCore.h"
#endif

#if __has_include(<ThinkingSDK/ThinkingSDK.h>)
#import <ThinkingSDK/ThinkingSDK.h>
#else
#import "ThinkingSDK.h"
#endif

static NSString * const TD_NEW_DEVICE_EVENT = @"ta_new_device";
static NSString * const TD_REGISTER_EVENT   = @"ta_register";
static NSString * const TD_LOGIN_EVENT      = @"ta_login";
static NSString * const TD_LOGOUT_EVENT     = @"ta_logout";
static NSString * const TD_PAYMENT_EVENT    = @"ta_payment";
static NSString * const TD_GUIDE_EVENT    = @"ta_guide";
static NSString * const TD_LEVEL_UP_EVENT    = @"ta_level_up";
static NSString * const TD_STAGE_START_EVENT    = @"ta_stage_start";
static NSString * const TD_STAGE_FINISH_EVENT    = @"ta_stage_finish";
static NSString * const TD_STAGE_FAIL_EVENT    = @"ta_stage_fail";
static NSString * const TD_RESOURCE_GET_EVENT    = @"ta_resource_get";
static NSString * const TD_RESOURCE_COST_EVENT    = @"ta_resource_cost";

static NSString * const TD_CHANNEL              = @"channel";
static NSString * const TD_REGISTER_TIME        = @"register_time";
static NSString * const TD_REGISTER_ZONE_OFFSET = @"register_zone_offset";

@interface TDEasyStart ()

@end

static BOOL _enableAutoTrackManually = NO;

@implementation TDEasyStart

+ (void)load {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(analyticsInitSuccessNotification:) name:kAnalyticsNotificationNameInit object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(analyticsInstallEventNotification:) name:kAnalyticsNotificationNameAppInstall object:nil];
}

+ (void)trackRegister:(TDRegisterEventModel *)eventModel {
    if (eventModel != nil) {
        if (eventModel.accountId != nil) {
            [TDAnalytics login:eventModel.accountId];
        }
        
        [TDAnalytics track:TD_REGISTER_EVENT properties:eventModel.eventProperties];
        
        NSDate *registerTime = [NSDate date];
        NSInteger sourceGMTOffset = [[NSTimeZone localTimeZone] secondsFromGMTForDate:registerTime];
        double registerZoneOffset = (double)(sourceGMTOffset/3600.0);
        NSMutableDictionary *userProperties = [NSMutableDictionary dictionary];
        userProperties[TD_REGISTER_TIME] = registerTime;
        userProperties[TD_REGISTER_ZONE_OFFSET] = [NSNumber numberWithDouble:registerZoneOffset];
        if (eventModel.channel != nil) {
            userProperties[TD_CHANNEL] = eventModel.channel;
        }
        if (eventModel.userProperties != nil) {
            [userProperties addEntriesFromDictionary:eventModel.userProperties];
        }
        [TDAnalytics userSetOnce:userProperties];
    }
}

+ (void)trackLogin:(TDLoginEventModel *)eventModel {
    if (eventModel != nil) {
        if (eventModel.accountId != nil) {
            [TDAnalytics login:eventModel.accountId];
        }
        [TDAnalytics track:TD_LOGIN_EVENT properties:eventModel.eventProperties];
    }
}

+ (void)trackLogout {
    [TDAnalytics track:TD_LOGOUT_EVENT];
    [TDAnalytics logout];
}

+ (void)trackPayment:(TDPaymentEventModel *)eventModel {
    if (eventModel != nil) {
        NSDictionary *properties = [eventModel toJsonDictionary];
        [TDAnalytics track:TD_PAYMENT_EVENT properties:properties];
    }
}

+ (void)trackGuide:(TDGuideEventModel *)eventModel{
    if(eventModel != nil){
        [TDAnalytics track:TD_GUIDE_EVENT properties:eventModel.toJsonDictionary];
    }
}

+ (void)trackLevelUp:(TDLevelUpEventModel *)eventModel{
    if(eventModel != nil && eventModel.checkProperties){
        NSMutableDictionary *superProperties = [NSMutableDictionary dictionary];
        superProperties[@"tmp_level"] = @(eventModel.level);
        [TDAnalytics setSuperProperties:superProperties];
        [TDAnalytics track:TD_LEVEL_UP_EVENT properties:eventModel.toEventDictionary];
        [TDAnalytics userSet:eventModel.toUserDictionary];
    }
}

+ (void)trackStageStart:(TDStageEventModel *)eventModel{
    if(eventModel != nil){
        [TDAnalytics track:TD_STAGE_START_EVENT properties:eventModel.toEventDictionary];
    }
}

+ (void)trackStageFinish:(TDStageEventModel *)eventModel{
    if(eventModel != nil){
        [TDAnalytics track:TD_STAGE_FINISH_EVENT properties:eventModel.toEventDictionary];
    }
}

+ (void)trackStageFail:(TDStageEventModel *)eventModel{
    if(eventModel != nil){
        [TDAnalytics track:TD_STAGE_FAIL_EVENT properties:eventModel.toEventDictionary];
    }
}

+ (void)trackResourceGet:(TDResourceEventModel *)eventModel{
    if(eventModel != nil){
        [TDAnalytics track:TD_RESOURCE_GET_EVENT properties:eventModel.toEventDictionary];
    }
}

+ (void)trackResourceCost:(TDResourceEventModel *)eventModel{
    if(eventModel != nil){
        [TDAnalytics track:TD_RESOURCE_COST_EVENT properties:eventModel.toEventDictionary];
    }
}

+ (void)enableAutoTrackManually {
    _enableAutoTrackManually = YES;
}

+ (BOOL)getEnableAutoTrackManually {
    return _enableAutoTrackManually;
}

// MARK: - notification

+ (void)analyticsInitSuccessNotification:(NSNotification *)notification {
    [self enableAutoTrack];
}

+ (void)analyticsInstallEventNotification:(NSNotification *)notification {
    [self trackDeviceActivation];
}

// MARK: - private methods

+ (void)trackDeviceActivation {
    TDFirstEventModel *firstModel = [[TDFirstEventModel alloc] initWithEventName:TD_NEW_DEVICE_EVENT];
    [TDAnalytics trackWithEventModel:firstModel];
}

+ (void)enableAutoTrack {
    if (![TDEasyStart getEnableAutoTrackManually]) {
        [TDAnalytics enableAutoTrack:TDAutoTrackEventTypeAppInstall | TDAutoTrackEventTypeAppStart | TDAutoTrackEventTypeAppEnd | TDAutoTrackEventTypeAppViewCrash ];
    }
}

@end
