//
//  ViewController.m
//  TestProject
//
//  Created by yichengxu on 15/5/8.
//  Copyright (c) 2015年 Insigmaservice. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "CollectionViewController.h"
#import "NetworkManager.h"



@interface ViewController ()

@property (nonatomic, strong) UIButton *centerBtn;
@property (nonatomic, strong) UIButton *bottomBtn;

@property (nonatomic, strong) UIButton *loginBtn;

@property (nonatomic, assign) BOOL hasEnlarge;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.centerBtn];
    [self.view addSubview:self.bottomBtn];
    [self.view addSubview:self.loginBtn];
    self.hasEnlarge = YES;
    
    [self.centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
  //      make.center.equalTo(self.view);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(200);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [self.bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).with.offset(10);
        make.trailing.equalTo(self.view.mas_trailing).with.offset(-10);
        make.bottom.equalTo(self.view).with.offset(-10);
        
        make.height.mas_equalTo(40);
    }];
    
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.centerBtn);
        
        make.baseline.equalTo(self.centerBtn);
        make.leading.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)loginBtn
{
    if (nil == _loginBtn)
    {
        _loginBtn = [[UIButton alloc] init];
        _loginBtn.backgroundColor = [UIColor blueColor];
        [_loginBtn setTitle:@"登录master" forState:UIControlStateNormal];
        
        [_loginBtn addTarget:self action:@selector(loginIn) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _loginBtn;
}

- (void)loginIn
{
    [NetworkManager loginIn];
}


- (UIButton *)bottomBtn
{
    if (nil == _bottomBtn)
    {
        _bottomBtn = [[UIButton alloc] init];
        _bottomBtn.backgroundColor = [UIColor greenColor];
        
        [_bottomBtn addTarget:self action:@selector(testAnimation) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _bottomBtn;
    
}

- (void)testAnimation
{
    [UIView animateWithDuration:1.0 animations:
     ^{
         
         [self.centerBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
             make.centerX.equalTo(self.view);
             make.size.mas_equalTo(CGSizeMake(80, 80));
             if (self.hasEnlarge ) {
                 
                 make.top.equalTo(self.view).with.offset(70);
             }
             else
             {
                 
                 make.top.equalTo(self.view).with.offset(400);
             }
             
             self.hasEnlarge = !self.hasEnlarge;
         }];
         
    }];
    
    
    
    //        [self.view setNeedsUpdateConstraints];
    /*       [self.centerBtn mas_updateConstraints:^(MASConstraintMaker *make)
     {
     //            if (self.hasEnlarge) {
     //                self.centerBtn.frame.origin.y
     //            }
     
     
     self.hasEnlarge = !self.hasEnlarge;
     
     }];*/

}

- (void)updateViewConstraints
{
    [self.centerBtn mas_updateConstraints:^(MASConstraintMaker *make)
     {
         if (self.hasEnlarge )
         {
             
             make.top.equalTo(self.view).with.offset(70);
         }
         else
         {
             
             make.top.equalTo(self.view).with.offset(400);
         }
         
         self.hasEnlarge = !self.hasEnlarge;
         
     }];
    
    [super updateViewConstraints];
}

- (UIButton *)centerBtn
{
    if (nil == _centerBtn)
    {
        _centerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        [_centerBtn setTitle:@"居中" forState:UIControlStateNormal];
        
   //     [_centerBtn sizeToFit];
        
        _centerBtn.backgroundColor = [UIColor darkGrayColor];
        
        [_centerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_centerBtn addTarget:self action:@selector(popCollecView) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _centerBtn;
}

- (void)popCollecView
{
    CollectionViewController *vc = [[CollectionViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
