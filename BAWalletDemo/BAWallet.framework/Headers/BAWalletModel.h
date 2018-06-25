//
//  BAWalletModel.h
//  TestETH
//
//  Created by BeyondAbel on 2018/5/4.
//  Copyright © 2018年 BeyondAbel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BAWalletType) {
    BAWalletTypeBTC,
    BAWalletTypeETH,
    BAWalletTypeERC20,
};

@interface BAWalletModel : NSObject

@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *mnemonic;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *passwordTips;

@property (nonatomic, copy) NSString *serviceName;
@property (nonatomic, strong) UIImage *qrCode;

@property (nonatomic, assign) BAWalletType walletType;

- (BAWalletModel *)initializeCompletd:(void (^)(NSError *error))completed;

+ (NSString *)getRandomPassphrase:(BAWalletType)walletType;

+ (BAWalletModel *)createdWallet:(BAWalletType)walletType mnemonic:(NSString *)mnemonic password:(NSString *)password;

- (void)updateBlockchainDataWithCompletd:(void (^)(NSError *error))completed;

- (void)sendTransactionTo:(NSString *)toAddress password:(NSString *)password totalAmount:(NSString *)totalAmount fees:(NSString *)fees completed:(void (^)(NSString *txId, NSError *error))completed;

- (void)fetchUserTransactionListWithOffset:(NSInteger)offset limit:(NSInteger)limit completed:(void (^)(NSError *error, NSArray *userTransactions))completed;

- (NSString *)getBanlaceBit;

@end
