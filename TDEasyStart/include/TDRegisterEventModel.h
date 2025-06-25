//
//  TDRegisterEventModel.h
//  TDPresetTemplate
//
//  Created by huangdiao on 2023/10/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TDRegisterEventModel : NSObject

@property (nonatomic, copy) NSString *accountId;
@property (nonatomic, copy) NSString *channel;
@property (nonatomic, copy) NSDictionary *eventProperties;
@property (nonatomic, copy) NSDictionary *userProperties;

@end

NS_ASSUME_NONNULL_END
