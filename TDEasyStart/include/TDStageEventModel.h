//
//  TDStageEventModel.h
//  TDEasyStart
//
//  Created by liulongbing on 2025/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TDStageEventModel : NSObject

@property (nonatomic, copy) NSString *stageId;
@property (nonatomic, copy) NSDictionary *eventProperties;

- (NSDictionary *)toEventDictionary;

@end

NS_ASSUME_NONNULL_END
