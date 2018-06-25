//
//  SWTransactionModel.h
//  SafetyWallet
//
//  Created by BeyondAbel on 2018/5/19.
//  Copyright © 2018年 BeyondAbel. All rights reserved.
//


#import "BAWalletModel.h"

typedef NS_ENUM(NSInteger, BATransactionType) {
    BATransactionTypePackage,   // 交易中
    BATransactionTypeIn,        // 转入
    BATransactionTypeOut,       // 转出
};

@interface BATransactionModel : NSObject

@property (nonatomic, strong) NSString *walletAddress;
@property (nonatomic, assign) BAWalletType walletType;

@property (nonatomic, strong) NSString *fromAddress;
@property (nonatomic, strong) NSString *toAddress;
@property (nonatomic, assign) int64_t fee;
@property (nonatomic, assign) long blockHeight;
@property (nonatomic, assign) long lockTime;
@property (nonatomic, strong) NSString *txid;
@property (nonatomic, strong) NSString *amountString;
@property (nonatomic, assign) BATransactionType transactionType;

#pragma mark - Publick
+ (NSArray *)transformBTCBody:(NSDictionary *)body;

- (void)transformETHTransactionInfo:(NSDictionary *)transactionInfo;

- (void)transformTokenTransactionInfo:(NSDictionary *)transactionInfo;

- (NSString *)amountToBTCValue;
- (NSString *)feeToBTCValue;

- (NSString *)localDateTimeString;

- (NSString *)localDateString;

@end
