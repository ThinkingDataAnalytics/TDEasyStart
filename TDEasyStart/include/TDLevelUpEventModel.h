//
//  TDLevelUpEventModel.h
//  TDEasyStart
//
//  Created by liulongbing on 2025/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TDLevelUpEventModel : NSObject

@property (nonatomic, assign) int level;
@property (nonatomic, copy) NSDictionary *eventProperties;
@property (nonatomic, copy) NSDictionary *userProperties;

- (BOOL)checkProperties;
- (NSDictionary *)toEventDictionary;
- (NSDictionary *)toUserDictionary;

@end

NS_ASSUME_NONNULL_END
