//
//  TDStageEventModel.m
//  TDEasyStart
//
//  Created by liulongbing on 2025/5/22.
//

#import "TDStageEventModel.h"

@implementation TDStageEventModel

- (NSDictionary *)toEventDictionary {
    NSMutableDictionary *jsonDic = [NSMutableDictionary dictionary];
    jsonDic[@"stage_id"] = _stageId;
    if (_eventProperties != nil) {
        [jsonDic addEntriesFromDictionary:_eventProperties];
    }
    return jsonDic;
}

@end
