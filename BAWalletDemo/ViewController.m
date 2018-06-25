//
//  ViewController.m
//  BAWalletDemo
//
//  Created by BeyondAbel on 2018/6/25.
//  Copyright © 2018年 BeyondAbel. All rights reserved.
//

#import "ViewController.h"
#import <BAWallet/BAWallet.h>

@interface ViewController ()

@property (nonatomic, strong) BAWalletModel *btcWalletModel;
@property (nonatomic, strong) BAWalletModel *ethWalletModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *mnemonic = @"atom latin night lion crowd dust sphere snack drift tiger pelican scout";
    self.btcWalletModel = [BAWalletModel createdWallet:BAWalletTypeBTC mnemonic:mnemonic password:@"123456"];
    
    NSString *ethMnemonic = @"rural dress curtain bundle curve save immune rare wage input boss ozone";
    self.ethWalletModel = [BAWalletModel createdWallet:BAWalletTypeETH mnemonic:ethMnemonic password:@"123456"];
    
    NSLog(@"随机获取BTC助记词 ： %@", [BAWalletModel getRandomPassphrase:BAWalletTypeBTC]);
    NSLog(@"随机获取ETH助记词 ： %@", [BAWalletModel getRandomPassphrase:BAWalletTypeETH]);
    
    UIButton *sendETHButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sendETHButton setTitle:@"发送ETH" forState:UIControlStateNormal];
    sendETHButton.frame = (CGRect){(self.view.frame.size.width - 120) / 2, 200, 120, 40};
    [sendETHButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sendETHButton addTarget:self action:@selector(sendETH) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendETHButton];
    
    UIButton *fetchETHButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [fetchETHButton setTitle:@"获取ETH交易记录" forState:UIControlStateNormal];
    fetchETHButton.frame = (CGRect){(self.view.frame.size.width - 180) / 2, 260, 180, 40};
    [fetchETHButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [fetchETHButton addTarget:self action:@selector(fetchETHTransaction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fetchETHButton];
    
    UIButton *sendBTCButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sendBTCButton setTitle:@"发送BTC" forState:UIControlStateNormal];
    sendBTCButton.frame = (CGRect){(self.view.frame.size.width - 120) / 2, 320, 120, 40};
    [sendBTCButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sendBTCButton addTarget:self action:@selector(sendBTC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendBTCButton];
    
    UIButton *fetchBTCButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [fetchBTCButton setTitle:@"获取BTC交易记录" forState:UIControlStateNormal];
    fetchBTCButton.frame = (CGRect){(self.view.frame.size.width - 180) / 2, 380, 180, 40};
    [fetchBTCButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [fetchBTCButton addTarget:self action:@selector(fetchBTCTransaction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fetchBTCButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendETH {
    NSLog(@"发送ETH开始---------------");
    [self.ethWalletModel sendTransactionTo:@"0xf62b2b84d3555414e909aA36D6dC63cE5b3cf236" password:@"123456" totalAmount:@"0.1" fees:@"0.001" completed:^(NSString *txId, NSError *error) {
        
        if (error == nil) {
            NSLog(@"发送成功，交易Id为 %@", txId);
        }
    }];
}

- (void)fetchETHTransaction {
    NSLog(@"获取ETH交易记录开始---------------");
    [self.ethWalletModel fetchUserTransactionListWithOffset:0 limit:100 completed:^(NSError *error, NSArray *userTransactions) {
        if (error == nil) {
            for (BATransactionModel *transactionModel in userTransactions) {
                NSLog(@"从%@到%@:%@", transactionModel.fromAddress, transactionModel.toAddress, transactionModel.amountString);
            }
        }
    }];
}

- (void)sendBTC {
    NSLog(@"发送BTC开始---------------");
    [self.btcWalletModel sendTransactionTo:@"miD4HbCQeM65ZXeBU2TCr7eW2CCF1AnHE6" password:@"123456" totalAmount:@"0.1" fees:@"0.01" completed:^(NSString *txId, NSError *error) {
        if (error == nil) {
            NSLog(@"发送成功，交易Id为 %@", txId);
        }
    }];
}

- (void)fetchBTCTransaction { 
    NSLog(@"获取BTC交易记录开始---------------");
    [self.btcWalletModel fetchUserTransactionListWithOffset:0 limit:100 completed:^(NSError *error, NSArray *userTransactions) {
        if (error == nil) {
            for (BATransactionModel *transactionModel in userTransactions) {
                NSLog(@"从%@到%@:%@", transactionModel.fromAddress, transactionModel.toAddress, transactionModel.amountString);
            }
        }
    }];
}

@end
