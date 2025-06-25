//
//  TDPresetTemplate.h
//  TDPresetTemplate
//
//  Created by huangdiao on 2023/10/25.
//

#import <Foundation/Foundation.h>
#import "TDRegisterEventModel.h"
#import "TDLoginEventModel.h"
#import "TDPaymentEventModel.h"
#import "TDPresetConstant.h"
#import "TDGuideEventModel.h"
#import "TDLevelUpEventModel.h"
#import "TDStageEventModel.h"
#import "TDResourceEventModel.h"

//! Project version number for TDPresetTemplate.
FOUNDATION_EXPORT double TDPresetTemplateVersionNumber;

//! Project version string for TDPresetTemplate.
FOUNDATION_EXPORT const unsigned char TDPresetTemplateVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <TDPresetTemplate/PublicHeader.h>

NS_ASSUME_NONNULL_BEGIN

@interface TDEasyStart : NSObject

/**
 Track user registration events.
 @param eventModel registered information, see <TDRegisterEventModel>
 */
+ (void)trackRegister:(TDRegisterEventModel *)eventModel;

/**
 Track login events.
 @param eventModel login information, see <TDLoginEventModel>
 */
+ (void)trackLogin:(TDLoginEventModel *)eventModel;

/**
 Track logout events.
 */
+ (void)trackLogout;

/**
 Track payment events.
 @param eventModel payment infomations, see <TDPaymentEventModel>
 */
+ (void)trackPayment:(TDPaymentEventModel *)eventModel;

/**
 Track guide events.
 @param eventModel guide infomations, see <TDGuideEventModel>
 */
+ (void)trackGuide:(TDGuideEventModel *)eventModel;


/**
 Track level up events.
 @param eventModel level infomations, see <TDLevelUpEventModel>
 */
+ (void)trackLevelUp:(TDLevelUpEventModel *)eventModel;


/**
 Track stage start events.
 @param eventModel stage start infomations, see <TDStageEventModel>
 */
+ (void)trackStageStart:(TDStageEventModel *)eventModel;

/**
 Track stage finish events.
 @param eventModel stage finish infomations, see <TDStageEventModel>
 */
+ (void)trackStageFinish:(TDStageEventModel *)eventModel;

/**
 Track stage fail events.
 @param eventModel stage fail infomations, see <TDStageEventModel>
 */
+ (void)trackStageFail:(TDStageEventModel *)eventModel;

/**
 Track resource get events.
 @param eventModel resource get infomations, see <TDResourceEventModel>
 */
+ (void)trackResourceGet:(TDResourceEventModel *)eventModel;

/**
 Track resource cost events.
 @param eventModel resource cost infomations, see <TDResourceEventModel>
 */
+ (void)trackResourceCost:(TDResourceEventModel *)eventModel;

/**
 Enable Auto-Tracking Events manually
 */
+ (void)enableAutoTrackManually;
+ (BOOL)getEnableAutoTrackManually;

@end

NS_ASSUME_NONNULL_END
