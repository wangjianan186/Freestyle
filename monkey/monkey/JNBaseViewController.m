//
//  JNBaseViewController.m
//  monkey
//
//  Created by Bigbang on 2016/12/18.
//  Copyright © 2016年 Bigbang. All rights reserved.
//

#import "JNBaseViewController.h"

@interface JNBaseViewController ()

@end

@implementation JNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RandomColor((arc4random()%256), (arc4random()%256), (arc4random()%256));

//    敲 inlineBlock
//    <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
//        <#statements#>
//    };
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 如果你自己设计一套第三方框架，你会怎么设计 ？ 你会考虑哪些东西 ？
 
 1> 框架的名字 : 最好名字中表达框架的功能
 2> 简单易用 
    * 能够快速入手 
    * 简单的接口 类的设计 方法的设计 (方法名 参数 返回值)
    *详尽的注释
 3> 扩展性 (其他开发者可以给这个框架动态添加功能)
 4> 性能 (运行效率 耗时 效益)
 5> 对项目的侵入性
    *尽量不要让其他开发者的类继承框架内部的类
 6> 资源管理 图片打包 图片 音频 视频 bundle 中
 7> 框架升级
    不哟啊修改以前的方法名 最好保留旧方法 提醒
*/


/* 
    iOS 一些函数
 rand() ----随机数
 
 abs() / labs() ----整数绝对值
 
 fabs() / fabsf() / fabsl() ----浮点数绝对值
 
 floor() / floorf() / floorl() ----向下取整
 
 ceil() / ceilf() / ceill() ----向上取整
 
 round() / roundf() / roundl() ----四舍五入
 
 sqrt() / sqrtf() / sqrtl() ----求平方根
 
 fmax() / fmaxf() / fmaxl() ----求最大值
 
 fmin() / fminf() / fminl() ----求最小值
 
 hypot() / hypotf() / hypotl() ----求直角三角形斜边的长度
 
 fmod() / fmodf() / fmodl() ----求两数整除后的余数
 
 modf() / modff() / modfl() ----浮点数分解为整数和小数
 
 frexp() / frexpf() / frexpl() ----浮点数分解尾数和二为底的指数
 
 sin() / sinf() / sinl() ----求正弦值
 
 sinh() / sinhf() / sinhl() ----求双曲正弦值
 
 cos() / cosf() / cosl() ----求余弦值
 
 cosh() / coshf() / coshl() ----求双曲余弦值
 
 tan() / tanf() / tanl() ----求正切值
 
 tanh() / tanhf() / tanhl() ----求双曲正切值
 
 asin() / asinf() / asinl() ----求反正弦值
 
 asinh() / asinhf() / asinhl() ----求反双曲正弦值
 
 acos() / acosf() / acosl() ----求反余弦值
 
 acosh() / acoshf() / acoshl() ----求反双曲余弦值
 
 atan() / atanf() / atanl() ----求反正切值
 
 atan2() / atan2f() / atan2l() ----求坐标值的反正切值
 
 atanh() / atanhf() / atanhl() ----求反双曲正切值
 
 原文链接：http://www.jianshu.com/p/0ca725ecf7f7
 
 */
@end
