//
//  TDPaymentEventModel.h
//  ThinkingSDK
//
//  Created by huangdiao on 2023/10/20.
//

#import <Foundation/Foundation.h>
#import "TDPresetConstant.h"

NS_ASSUME_NONNULL_BEGIN

@interface TDPaymentEventModel : NSObject

@property (nonatomic, copy) NSString *orderId;
@property (nonatomic, copy) NSString *paymentName;
@property (nonatomic, copy) NSString *paymentType;
@property (nonatomic, assign) int paymentNum;
@property (nonatomic, assign) double payAmount;
@property (nonatomic, assign) TDCurrencyType currencyType;
@property (nonatomic, copy) NSDictionary *eventProperties;

- (NSDictionary *)toJsonDictionary;

@end

NS_ASSUME_NONNULL_END
