//
//  TDLevelUpEventModel.m
//  TDEasyStart
//
//  Created by liulongbing on 2025/5/22.
//

#import "TDLevelUpEventModel.h"

@implementation TDLevelUpEventModel

- (BOOL)checkProperties{
    return self.level > 0;
}

- (NSDictionary *)toEventDictionary {
    return _eventProperties;
}

- (NSDictionary *)toUserDictionary{
    NSMutableDictionary *jsonDic = [NSMutableDictionary dictionary];
    jsonDic[@"level"] = @(_level);
    if (_userProperties != nil) {
        [jsonDic addEntriesFromDictionary:_userProperties];
    }
    return jsonDic;
}

@end
