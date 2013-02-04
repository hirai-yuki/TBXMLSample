//
//  TBXML+Dictionary.h
//  TBXMLSample
//
//  Created by hirai.yuki on 2013/01/29.
//  Copyright (c) 2013年 hirai.yuki. All rights reserved.
//

#import "TBXML.h"

/**
 TBXMLで解析したXMLをNSDictionaryに変換する機能を拡張
 */
@interface TBXML (Dictionary)

/**
 TBXMLElementをNSDictionaryに変換する
 */
+ (NSDictionary *)dictionaryWithElement:(TBXMLElement *)element;

@end
