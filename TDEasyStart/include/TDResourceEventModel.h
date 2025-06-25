//
//  TDResourceEventModel.h
//  TDEasyStart
//
//  Created by liulongbing on 2025/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TDResourceEventModel : NSObject

@property (nonatomic, copy) NSString *resourceId;
@property (nonatomic, assign) double changeNum;
@property (nonatomic, assign) double afterNum;
@property (nonatomic, copy) NSDictionary *eventProperties;

- (NSDictionary *)toEventDictionary;


@end

NS_ASSUME_NONNULL_END
