//
//  JJNavigationController.m
//  JJ
//
//  Created by Bigbang on 16/5/27.
//  Copyright © 2016年 Bigbang. All rights reserved.
//

#import "JJNavigationController.h"

@interface JJAphaView : UIView

@end

@implementation JJAphaView

@end


@interface JJNavigationAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic) UINavigationControllerOperation animationType;

@end

@implementation JJNavigationAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25f;
    
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    //获取容器视图
    UIView *containerView = [transitionContext
                             containerView];
    //fromViewController从哪个VC准备跳转
    UIViewController *fromViewController = [transitionContext
                                            viewControllerForKey:UITransitionContextFromViewControllerKey
                                            ];
    //toViewController跳转到的VC
    UIViewController *toViewController = [transitionContext
                                          viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //push
    if(self.animationType ==UINavigationControllerOperationPush)
    {
        [containerView insertSubview:toViewController.view
                        aboveSubview:fromViewController.view];
        //添加一个半透明的view
        JJAphaView *alphaView = [[JJAphaView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        alphaView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        alphaView.userInteractionEnabled = NO;
        
        [fromViewController.view addSubview:alphaView];
        
        toViewController.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        //向toViewController的view上添加阴影
        [toViewController.view.layer setShadowColor:[UIColor blackColor].CGColor];//设置阴影颜色
        [toViewController.view.layer setShadowOpacity:0.5f];//设置阴影透明度
        [toViewController.view.layer setShadowRadius:5];//设置阴影半径
        [toViewController.view.layer setShadowOffset:CGSizeMake(-5, 0)];//设置阴影偏移量
        
        [UIView animateWithDuration:[self
                                     transitionDuration:transitionContext] animations:^{
            
            alphaView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75f];
            
            fromViewController.view.frame = CGRectMake(15, 15, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-30);
            toViewController.view.frame = CGRectMake(0 , 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            
        } completion:^(BOOL finished) {
            //不用手动去移除“from”视图，transitionContext将自动帮你完成。
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }else if (self.animationType ==UINavigationControllerOperationPop)//pop
    {
        
        [containerView insertSubview:toViewController.view
                        belowSubview:fromViewController.view];
        JJAphaView *alphaView = nil;
        for (UIView *view in toViewController.view.subviews) {
            if([view isKindOfClass:[JJAphaView class]])
            {
                alphaView = (JJAphaView *)view;
            }
        }
        
        [UIView animateWithDuration:[self
                                     transitionDuration:transitionContext] animations:^{
            
            
            alphaView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
            
            fromViewController.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width , 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            toViewController.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        } completion:^(BOOL finished) {
            if(![transitionContext transitionWasCancelled])
            {
                [alphaView removeFromSuperview];
                
            }
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }
}


@end


@interface JJNavigationController () <UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,strong) JJNavigationAnimation *navAnimation;

@property (nonatomic,strong) UIPercentDrivenInteractiveTransition *percentDrivenInteractiveTransition;

@end

@implementation JJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.delegate = self;
    self.navigationBarHidden = YES;
    
    self.interactivePopGestureRecognizer.enabled = NO;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
    pan.delegate = self;
    pan.maximumNumberOfTouches = 1;
    [self.interactivePopGestureRecognizer.view addGestureRecognizer:pan];//往导航自带的pop手势所在的view添加手势
}

//控制可交互式的转场,这种方式同样需要定义动画效果，只是这个动画效果会根据跟随交互式手势来切换VC并同时播放动画效果。iOS7提供了一个默认的基于百分比的动画实现 UIPercentDrivenInteractiveTransition
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    
    if([animationController isKindOfClass:[JJNavigationAnimation class]])
        return self.percentDrivenInteractiveTransition;
    return nil;
    
}

//负责实际执行动画,非交互式切换，即定义一种从一个VC到另一个VC的动画效果，切换的时候自动播放
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    
    if(operation ==UINavigationControllerOperationPush)
    {
        self.navAnimation.animationType = UINavigationControllerOperationPush;
    }else if(operation ==UINavigationControllerOperationPop)
    {
        self.navAnimation.animationType = UINavigationControllerOperationPop;
    }
    
    return (id)self.navAnimation;
}

- (JJNavigationAnimation *)navAnimation
{
    if(_navAnimation ==nil)
    {
        _navAnimation = [[JJNavigationAnimation alloc] init];
    }
    
    return _navAnimation;
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if(self.viewControllers &&self.viewControllers.count>1 )
    {
        return YES;
    }else
    {
        return NO;
    }
}

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture
{
    CGPoint point = [gesture translationInView:gesture.view];
    CGFloat progress =  point.x/gesture.view.bounds.size.width;
    //限制progress始终>0,并且及时左滑progress为0,不会触发pop动画
    progress = MIN(1.0, MAX(0.0, progress));
    
    if(gesture.state ==UIGestureRecognizerStateBegan)
    {
        self.percentDrivenInteractiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        
        [self popViewControllerAnimated:YES];
    }else if (gesture.state ==UIGestureRecognizerStateChanged)
    {
        [self.percentDrivenInteractiveTransition updateInteractiveTransition:progress];
    }else if (gesture.state ==UIGestureRecognizerStateCancelled||gesture.state ==UIGestureRecognizerStateEnded)
    {
        //当手势结束的时候,如果进度大于0.3,那么就完成pop动画,否则取消pop操作.
        if(progress >0.3f)
        {
            [self.percentDrivenInteractiveTransition finishInteractiveTransition];
        }else
        {
            [self.percentDrivenInteractiveTransition cancelInteractiveTransition];
        }
        
        self.percentDrivenInteractiveTransition = nil;
    }
    
}


@end
