//
//  TDGuideEventModel.h
//  TDEasyStart
//
//  Created by liulongbing on 2025/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TDGuideEventModel : NSObject

@property (nonatomic, copy) NSString *step;
@property (nonatomic, copy) NSDictionary *eventProperties;

- (NSDictionary *)toJsonDictionary;

@end

NS_ASSUME_NONNULL_END
