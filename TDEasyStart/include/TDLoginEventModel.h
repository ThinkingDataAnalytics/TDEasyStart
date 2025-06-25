//
//  TDLoginEventModel.h
//  TDPresetTemplate
//
//  Created by huangdiao on 2023/10/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TDLoginEventModel : NSObject

@property (nonatomic, copy) NSString *accountId;
@property (nonatomic, copy) NSDictionary *eventProperties;


@end

NS_ASSUME_NONNULL_END
