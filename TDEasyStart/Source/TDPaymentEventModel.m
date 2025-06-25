//
//  TDPaymentEventModel.m
//  ThinkingSDK
//
//  Created by huangdiao on 2023/10/20.
//

#import "TDPaymentEventModel.h"

const NSString * TD_ORDER_ID        = @"order_id";
const NSString * TD_PAYMENT_NAME    = @"payment_name";
const NSString * TD_PAYMENT_NUM     = @"payment_num";
const NSString * TD_PAYMENT_TYPE    = @"payment_type";
const NSString * TD_CURRENCY_TYPE   = @"currency_type";
const NSString * TD_PAY_AMOUNT      = @"pay_amount";

@implementation TDPaymentEventModel

- (instancetype)init {
    if (self = [super init]) {
        _currencyType = TDCurrencyTypeNONE;
    }
    return self;
}

- (BOOL)checkProperties {
    if (_orderId == nil || _orderId.length == 0) {
        NSLog(@"TDPresetTemplate: orderId cannot be empty");
        return NO;
    }
    if (_paymentName == nil || _paymentName.length == 0) {
        NSLog(@"TDPresetTemplate: paymentName cannot be empty");
        return NO;
    }
    if (_paymentNum <= 0) {
        NSLog(@"TDPresetTemplate: paymentNum cannot be less than 0");
        return NO;
    }
    if (_paymentType == nil || _paymentType.length == 0) {
        NSLog(@"TDPresetTemplate: paymentType cannot be empty");
        return NO;
    }
    NSString *currency_type = [self getCurrencyTypeString];
    if (currency_type == nil || currency_type.length == 0) {
        NSLog(@"TDPresetTemplate: currencyType cannot be empty");
        return NO;
    }
    if (_payAmount <= 0) {
        NSLog(@"TDPresetTemplate: payAmount cannot be less than 0");
        return NO;
    }
    return YES;
}

- (NSDictionary *)toJsonDictionary {
    [self checkProperties];
    NSMutableDictionary *jsonDic = [NSMutableDictionary dictionary];
    jsonDic[TD_ORDER_ID] = _orderId;
    jsonDic[TD_PAYMENT_NAME] = _paymentName;
    jsonDic[TD_PAYMENT_NUM] = [NSNumber numberWithInt:_paymentNum];
    jsonDic[TD_PAYMENT_TYPE] = _paymentType;
    jsonDic[TD_CURRENCY_TYPE] = [self getCurrencyTypeString];
    jsonDic[TD_PAY_AMOUNT] = [NSDecimalNumber numberWithDouble:_payAmount];
    if (_eventProperties != nil) {
        [jsonDic addEntriesFromDictionary:_eventProperties];
    }
    return jsonDic;
}

- (NSString *)getCurrencyTypeString {
    NSString *typeString = @"";
    switch (_currencyType) {
        case TDCurrencyTypeAED:
            typeString = @"AED";
            break;
        case TDCurrencyTypeAFN:
            typeString = @"AFN";
            break;
        case TDCurrencyTypeALL:
            typeString = @"ALL";
            break;
        case TDCurrencyTypeAMD:
            typeString = @"AMD";
            break;
        case TDCurrencyTypeANG:
            typeString = @"ANG";
            break;
        case TDCurrencyTypeAOA:
            typeString = @"AOA";
            break;
        case TDCurrencyTypeARS:
            typeString = @"ARS";
            break;
        case TDCurrencyTypeAUD:
            typeString = @"AUD";
            break;
        case TDCurrencyTypeAWG:
            typeString = @"AWG";
            break;
        case TDCurrencyTypeAZN:
            typeString = @"AZN";
            break;
        case TDCurrencyTypeBAM:
            typeString = @"BAM";
            break;
        case TDCurrencyTypeBBD:
            typeString = @"BBD";
            break;
        case TDCurrencyTypeBDT:
            typeString = @"BDT";
            break;
        case TDCurrencyTypeBGN:
            typeString = @"BGN";
            break;
        case TDCurrencyTypeBHD:
            typeString = @"BHD";
            break;
        case TDCurrencyTypeBIF:
            typeString = @"BIF";
            break;
        case TDCurrencyTypeBMD:
            typeString = @"BMD";
            break;
        case TDCurrencyTypeBND:
            typeString = @"BND";
            break;
        case TDCurrencyTypeBOB:
            typeString = @"BOB";
            break;
        case TDCurrencyTypeBRL:
            typeString = @"BRL";
            break;
        case TDCurrencyTypeBSD:
            typeString = @"BSD";
            break;
        case TDCurrencyTypeBTC:
            typeString = @"BTC";
            break;
        case TDCurrencyTypeBTN:
            typeString = @"BTN";
            break;
        case TDCurrencyTypeBWP:
            typeString = @"BWP";
            break;
        case TDCurrencyTypeBYN:
            typeString = @"BYN";
            break;
        case TDCurrencyTypeBYR:
            typeString = @"BYR";
            break;
        case TDCurrencyTypeBZD:
            typeString = @"BZD";
            break;
        case TDCurrencyTypeCAD:
            typeString = @"CAD";
            break;
        case TDCurrencyTypeCDF:
            typeString = @"CDF";
            break;
        case TDCurrencyTypeCHF:
            typeString = @"CHF";
            break;
        case TDCurrencyTypeCLF:
            typeString = @"CLF";
            break;
        case TDCurrencyTypeCLP:
            typeString = @"CLP";
            break;
        case TDCurrencyTypeCNY:
            typeString = @"CNY";
            break;
        case TDCurrencyTypeCOP:
            typeString = @"COP";
            break;
        case TDCurrencyTypeCRC:
            typeString = @"CRC";
            break;
        case TDCurrencyTypeCUC:
            typeString = @"CUC";
            break;
        case TDCurrencyTypeCUP:
            typeString = @"CUP";
            break;
        case TDCurrencyTypeCVE:
            typeString = @"CVE";
            break;
        case TDCurrencyTypeCZK:
            typeString = @"CZK";
            break;
        case TDCurrencyTypeDJF:
            typeString = @"DJF";
            break;
        case TDCurrencyTypeDKK:
            typeString = @"DKK";
            break;
        case TDCurrencyTypeDOP:
            typeString = @"DOP";
            break;
        case TDCurrencyTypeDZD:
            typeString = @"DZD";
            break;
        case TDCurrencyTypeEGP:
            typeString = @"EGP";
            break;
        case TDCurrencyTypeERN:
            typeString = @"ERN";
            break;
        case TDCurrencyTypeETB:
            typeString = @"ETB";
            break;
        case TDCurrencyTypeEUR:
            typeString = @"EUR";
            break;
        case TDCurrencyTypeFJD:
            typeString = @"FJD";
            break;
        case TDCurrencyTypeFKP:
            typeString = @"FKP";
            break;
        case TDCurrencyTypeGBP:
            typeString = @"GBP";
            break;
        case TDCurrencyTypeGEL:
            typeString = @"GEL";
            break;
        case TDCurrencyTypeGGP:
            typeString = @"GGP";
            break;
        case TDCurrencyTypeGHS:
            typeString = @"GHS";
            break;
        case TDCurrencyTypeGIP:
            typeString = @"GIP";
            break;
        case TDCurrencyTypeGMD:
            typeString = @"GMD";
            break;
        case TDCurrencyTypeGNF:
            typeString = @"GNF";
            break;
        case TDCurrencyTypeGTQ:
            typeString = @"GTQ";
            break;
        case TDCurrencyTypeGYD:
            typeString = @"GYD";
            break;
        case TDCurrencyTypeHKD:
            typeString = @"HKD";
            break;
        case TDCurrencyTypeHNL:
            typeString = @"HNL";
            break;
        case TDCurrencyTypeHRK:
            typeString = @"HRK";
            break;
        case TDCurrencyTypeHTG:
            typeString = @"HTG";
            break;
        case TDCurrencyTypeHUF:
            typeString = @"HUF";
            break;
        case TDCurrencyTypeIDR:
            typeString = @"IDR";
            break;
        case TDCurrencyTypeILS:
            typeString = @"ILS";
            break;
        case TDCurrencyTypeIMP:
            typeString = @"IMP";
            break;
        case TDCurrencyTypeINR:
            typeString = @"INR";
            break;
        case TDCurrencyTypeIQD:
            typeString = @"IQD";
            break;
        case TDCurrencyTypeIRR:
            typeString = @"IRR";
            break;
        case TDCurrencyTypeISK:
            typeString = @"ISK";
            break;
        case TDCurrencyTypeJEP:
            typeString = @"JEP";
            break;
        case TDCurrencyTypeJMD:
            typeString = @"JMD";
            break;
        case TDCurrencyTypeJOD:
            typeString = @"JOD";
            break;
        case TDCurrencyTypeJPY:
            typeString = @"JPY";
            break;
        case TDCurrencyTypeKES:
            typeString = @"KES";
            break;
        case TDCurrencyTypeKGS:
            typeString = @"KGS";
            break;
        case TDCurrencyTypeKHR:
            typeString = @"KHR";
            break;
        case TDCurrencyTypeKMF:
            typeString = @"KMF";
            break;
        case TDCurrencyTypeKPW:
            typeString = @"KPW";
            break;
        case TDCurrencyTypeKRW:
            typeString = @"KRW";
            break;
        case TDCurrencyTypeKWD:
            typeString = @"KWD";
            break;
        case TDCurrencyTypeKYD:
            typeString = @"KYD";
            break;
        case TDCurrencyTypeKZT:
            typeString = @"KZT";
            break;
        case TDCurrencyTypeLAK:
            typeString = @"LAK";
            break;
        case TDCurrencyTypeLBP:
            typeString = @"LBP";
            break;
        case TDCurrencyTypeLKR:
            typeString = @"LKR";
            break;
        case TDCurrencyTypeLRD:
            typeString = @"LRD";
            break;
        case TDCurrencyTypeLSL:
            typeString = @"LSL";
            break;
        case TDCurrencyTypeLTL:
            typeString = @"LTL";
            break;
        case TDCurrencyTypeLVL:
            typeString = @"LVL";
            break;
        case TDCurrencyTypeLYD:
            typeString = @"LYD";
            break;
        case TDCurrencyTypeMAD:
            typeString = @"MAD";
            break;
        case TDCurrencyTypeMDL:
            typeString = @"MDL";
            break;
        case TDCurrencyTypeMGA:
            typeString = @"MGA";
            break;
        case TDCurrencyTypeMKD:
            typeString = @"MKD";
            break;
        case TDCurrencyTypeMMK:
            typeString = @"MMK";
            break;
        case TDCurrencyTypeMNT:
            typeString = @"MNT";
            break;
        case TDCurrencyTypeMOP:
            typeString = @"MOP";
            break;
        case TDCurrencyTypeMRO:
            typeString = @"MRO";
            break;
        case TDCurrencyTypeMUR:
            typeString = @"MUR";
            break;
        case TDCurrencyTypeMVR:
            typeString = @"MVR";
            break;
        case TDCurrencyTypeMWK:
            typeString = @"MWK";
            break;
        case TDCurrencyTypeMXN:
            typeString = @"MXN";
            break;
        case TDCurrencyTypeMYR:
            typeString = @"MYR";
            break;
        case TDCurrencyTypeMZN:
            typeString = @"MZN";
            break;
        case TDCurrencyTypeNAD:
            typeString = @"NAD";
            break;
        case TDCurrencyTypeNGN:
            typeString = @"NGN";
            break;
        case TDCurrencyTypeNIO:
            typeString = @"NIO";
            break;
        case TDCurrencyTypeNOK:
            typeString = @"NOK";
            break;
        case TDCurrencyTypeNPR:
            typeString = @"NPR";
            break;
        case TDCurrencyTypeNZD:
            typeString = @"NZD";
            break;
        case TDCurrencyTypeOMR:
            typeString = @"OMR";
            break;
        case TDCurrencyTypePAB:
            typeString = @"PAB";
            break;
        case TDCurrencyTypePEN:
            typeString = @"PEN";
            break;
        case TDCurrencyTypePGK:
            typeString = @"PGK";
            break;
        case TDCurrencyTypePHP:
            typeString = @"PHP";
            break;
        case TDCurrencyTypePKR:
            typeString = @"PKR";
            break;
        case TDCurrencyTypePLN:
            typeString = @"PLN";
            break;
        case TDCurrencyTypePYG:
            typeString = @"PYG";
            break;
        case TDCurrencyTypeQAR:
            typeString = @"QAR";
            break;
        case TDCurrencyTypeRON:
            typeString = @"RON";
            break;
        case TDCurrencyTypeRSD:
            typeString = @"RSD";
            break;
        case TDCurrencyTypeRUB:
            typeString = @"RUB";
            break;
        case TDCurrencyTypeRWF:
            typeString = @"RWF";
            break;
        case TDCurrencyTypeSAR:
            typeString = @"SAR";
            break;
        case TDCurrencyTypeSBD:
            typeString = @"SBD";
            break;
        case TDCurrencyTypeSCR:
            typeString = @"SCR";
            break;
        case TDCurrencyTypeSDG:
            typeString = @"SDG";
            break;
        case TDCurrencyTypeSEK:
            typeString = @"SEK";
            break;
        case TDCurrencyTypeSGD:
            typeString = @"SGD";
            break;
        case TDCurrencyTypeSHP:
            typeString = @"SHP";
            break;
        case TDCurrencyTypeSLL:
            typeString = @"SLL";
            break;
        case TDCurrencyTypeSOS:
            typeString = @"SOS";
            break;
        case TDCurrencyTypeSRD:
            typeString = @"SRD";
            break;
        case TDCurrencyTypeSTD:
            typeString = @"STD";
            break;
        case TDCurrencyTypeSVC:
            typeString = @"SVC";
            break;
        case TDCurrencyTypeSYP:
            typeString = @"SYP";
            break;
        case TDCurrencyTypeSZL:
            typeString = @"SZL";
            break;
        case TDCurrencyTypeTHB:
            typeString = @"THB";
            break;
        case TDCurrencyTypeTJS:
            typeString = @"TJS";
            break;
        case TDCurrencyTypeTMT:
            typeString = @"TMT";
            break;
        case TDCurrencyTypeTND:
            typeString = @"TND";
            break;
        case TDCurrencyTypeTOP:
            typeString = @"TOP";
            break;
        case TDCurrencyTypeTRY:
            typeString = @"TRY";
            break;
        case TDCurrencyTypeTTD:
            typeString = @"TTD";
            break;
        case TDCurrencyTypeTWD:
            typeString = @"TWD";
            break;
        case TDCurrencyTypeTZS:
            typeString = @"TZS";
            break;
        case TDCurrencyTypeUAH:
            typeString = @"UAH";
            break;
        case TDCurrencyTypeUGX:
            typeString = @"UGX";
            break;
        case TDCurrencyTypeUSD:
            typeString = @"USD";
            break;
        case TDCurrencyTypeUYU:
            typeString = @"UYU";
            break;
        case TDCurrencyTypeUZS:
            typeString = @"UZS";
            break;
        case TDCurrencyTypeVEF:
            typeString = @"VEF";
            break;
        case TDCurrencyTypeVND:
            typeString = @"VND";
            break;
        case TDCurrencyTypeVUV:
            typeString = @"VUV";
            break;
        case TDCurrencyTypeWST:
            typeString = @"WST";
            break;
        case TDCurrencyTypeXAF:
            typeString = @"XAF";
            break;
        case TDCurrencyTypeXAG:
            typeString = @"XAG";
            break;
        case TDCurrencyTypeXAU:
            typeString = @"XAU";
            break;
        case TDCurrencyTypeXCD:
            typeString = @"XCD";
            break;
        case TDCurrencyTypeXDR:
            typeString = @"XDR";
            break;
        case TDCurrencyTypeXOF:
            typeString = @"XOF";
            break;
        case TDCurrencyTypeXPF:
            typeString = @"XPF";
            break;
        case TDCurrencyTypeYER:
            typeString = @"YER";
            break;
        case TDCurrencyTypeZAR:
            typeString = @"ZAR";
            break;
        case TDCurrencyTypeZMK:
            typeString = @"ZMK";
            break;
        case TDCurrencyTypeZMW:
            typeString = @"ZMW";
            break;
        case TDCurrencyTypeZWL:
            typeString = @"ZWL";
            break;
        default:
            break;
    }
    return typeString;
}

@end
