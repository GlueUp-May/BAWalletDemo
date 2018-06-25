//
//  BAWalletKit.h
//  BAWallet
//
//  Created by BeyondAbel on 2018/6/22.
//  Copyright © 2018年 BeyondAbel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAWalletKit : NSObject

@property (nonatomic, assign) BOOL testNetworking;

+ (instancetype)defaultWalletKit;

@end
