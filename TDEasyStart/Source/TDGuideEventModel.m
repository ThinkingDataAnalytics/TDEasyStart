//
//  TDGuideEventModel.m
//  TDEasyStart
//
//  Created by liulongbing on 2025/5/22.
//

#import "TDGuideEventModel.h"

@implementation TDGuideEventModel

- (NSDictionary *)toJsonDictionary {
    NSMutableDictionary *jsonDic = [NSMutableDictionary dictionary];
    jsonDic[@"guide_id"] = _step;
    if (_eventProperties != nil) {
        [jsonDic addEntriesFromDictionary:_eventProperties];
    }
    return jsonDic;
}

@end
