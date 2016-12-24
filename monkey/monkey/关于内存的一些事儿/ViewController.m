//
//  ViewController.m
//  整理资料
//
//  Created by 王佳男 on 16/8/14.
//  Copyright © 2016年 Wang JiaNan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)dealloc {
    
    /*
     注意：
     
     1.  一定要牢记 UITableView 上的控件 必须创建 一次，
     如果是 for 循环出来的 控件一定要把 控件删除之后 重新创建，
     否则 会产生 滑动时候的卡顿 和 混乱
     
     2. Cell 先创建 UI 时， 不要传入模型 （那个方法只调用一次）， 在 UpdataUI 时传入模型, 更新 UI
     
     */

    
    
    //移除不需要的 View
    //  [HeaderView removeFromSuperview];
    
    //把不需要的 设置为  nil
    //  HeaderView == nil;
    
    //移除 VC 里的通知
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:@"Not" object:nil];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //调回主线程
    //  [self performSelectorOnMainThread:<#(nonnull SEL)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>]
    
    //开启延迟线程
    // [self performSelector:<#(nonnull SEL)#> withObject:<#(nullable id)#> afterDelay:<#(NSTimeInterval)#>]
    
    
    
    // View 的 clipsToBounds = YES  切掉其余的
    
    // 处理 TableView 间隙的问题
    // ViewDidLoad      self.automaticallyAdjustsScrollViewInsets = NO;
    
    //屏幕不拉伸问题
    // 加一张 Default-568@2x.png
    
    //边缘手势
    UIScreenEdgePanGestureRecognizer *screenEdgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
    screenEdgePan.edges = UIRectEdgeLeft;
 
    
    //   ping 指令
    
    // 注意 :  ping www.baidu.com  一定没有 http://
    
    // 查看 DNS 和 端口号
    
    
    // 如何在  View 的图层上添加一个 image ， contents 表示接受内容
    //  self.customView.layer.contens = (id)[UIImage iamgeNamed:@"me"].CGImage;
    
    
    // iOS 在画线的时候 线的粗细情况 （除以）
    //  [UIScreen mainScreen].scale
}

// getter
- (NSMutableArray *)dataArray {

    if (_dataArray == nil) {

        _dataArray = [[NSMutableArray alloc] init];
    }
    
    return _dataArray;
}

@end
