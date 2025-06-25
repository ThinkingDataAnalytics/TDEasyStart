//
//  TDResourceEventModel.m
//  TDEasyStart
//
//  Created by liulongbing on 2025/5/22.
//

#import "TDResourceEventModel.h"

@implementation TDResourceEventModel

- (NSDictionary *)toEventDictionary {
    NSMutableDictionary *jsonDic = [NSMutableDictionary dictionary];
    NSMutableDictionary *resDic = [NSMutableDictionary dictionary];
    resDic[@"id"] = _resourceId;
    resDic[@"change_num"] = @(_changeNum);
    resDic[@"after_num"] = @(_afterNum);
    jsonDic[@"resource_info"] = resDic;
    if (_eventProperties != nil) {
        [jsonDic addEntriesFromDictionary:_eventProperties];
    }
    return jsonDic;
}

@end
