//
//  UIView+YRLayoutConstraint.m
//  MoveService
//
//  Created by Luck on 17/3/30.
//  Copyright © 2017年 hongmw. All rights reserved.
//

#import "UIView+YRLayoutConstraint.h"

@implementation UIView (YRLayoutConstraint)
/*
    XCode莫名的输出 ”if we're in the real pre-commit handler we can't actually add any new fences due to CA restriction“ 原因如下：这个问题其实是xcode 编译器设置的问题，其实并不影响app使用
        http://www.cnblogs.com/isItOk/p/6243371.html
 
 */

/*
        -------------- VFL语言约束 -------------
 
 (NSArray *)constraintsWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)opts metrics:(NSDictionary *)metrics views:(NSDictionary *)views;
 
 ### 参数定义:
 第一个参数：V:|-(>=XXX) :表示垂直方向上相对于SuperView大于、等于、小于某个距离
 若是要定义水平方向，则将V：改成H：即可
 在接着后面-[]中括号里面对当前的View/控件 的高度/宽度进行设定；
 第二个参数：options：字典类型的值；这里的值一般在系统定义的一个enum里面选取
 第三个参数：metrics：nil；一般为nil ，参数类型为NSDictionary，从外部传入 //衡量标准
 第四个参数：views：就是上面所加入到NSDictionary中的绑定的View
 
 
 ### 使用规则:
 |: 表示父视图
 -:表示距离
 V:  :表示垂直
 H:  :表示水平
 >= :表示视图间距、宽度和高度必须大于或等于某个值
 <= :表示视图间距、宽度和高度必须小宇或等于某个值
 == :表示视图间距、宽度或者高度必须等于某个值
 @  :>=、<=、==  限制   最大为  1000
 |-[view]-|:  视图处在父视图的左右边缘内
 |-[view]  :   视图处在父视图的左边缘
 |[view]   :   视图和父视图左边对齐
 -[view]-  :  设置视图的宽度高度
 |-30.0-[view]-30.0-|:  表示离父视图 左右间距  30
 [view(200.0)] : 表示视图宽度为 200.0
 |-[view(view1)]-[view1]-| :表示视图宽度一样，并且在父视图左右边缘内
 V:|-[view(50.0)] : 视图高度为  50
 V:|-(==padding)-[imageView]->=0-[button]-(==padding)-| : 表示离父视图的距离
 为Padding,这两个视图间距必须大于或等于0并且距离底部父视图为 padding。
 [wideView(>=60@700)]  :视图的宽度为至少为60 不能超过  700
 如果没有声明方向默认为  水平  V:
 
 
 －－－－－－－－－－－－－－－－－－－－－－－－－分割线－－－－－－－－－－－－－－－－－－－－－－－
 
 +(instancetype)constraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c;
 
 ### 参数说明:
 第一个参数:指定约束左边的视图view1
 第二个参数:指定view1的属性attr1，具体属性见文末。
 第三个参数:指定左右两边的视图的关系relation，具体关系见文末。
 第四个参数:指定约束右边的视图view2
 第五个参数:指定view2的属性attr2，具体属性见文末。
 第六个参数:指定一个与view2属性相乘的乘数multiplier
 第七个参数:指定一个与view2属性相加的浮点数constant
 
 
 这个函数的对照公式为:
 view1.attr1 <relation> view2.attr2 * multiplier + constant
 
 
 
 */


/**
 * 设置一个约束
 
 @param myAttribute 约束我的那个条件
 @param layoutRelation 约束关系
 @param toView 依赖谁
 @param toAttribute 依赖它的哪个条件
 @param multiplier 向量系数
 @param constant 偏移量
 @return NSLayoutConstraint
 */
- (NSLayoutConstraint *)addConstraintmyWitthAttribute:(NSLayoutAttribute)myAttribute
                                       LayoutRelation:(NSLayoutRelation)layoutRelation
                                               ToView:(UIView * )toView
                                    toLayoutAttribute:(NSLayoutAttribute)toAttribute
                                           multiplier:(CGFloat)multiplier
                                             constant:(CGFloat)constant
                                           identifier:(NSString * )identifier{
    
    //为了避免和系统生成的自动伸缩的约束不冲突 设置为NO
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                         attribute:myAttribute
                                                                         relatedBy:layoutRelation
                                                                            toItem:toView
                                                                         attribute:toAttribute
                                                                        multiplier:multiplier
                                                                          constant:constant];
    
    layoutConstraint.identifier = identifier;//设置约束标识
    
    return layoutConstraint;
}

- (NSArray<NSLayoutConstraint *> * )addEdgeInsetsConstraintToView:(UIView * )toView
                                                    offEdgeInsets:(UIEdgeInsets)edg
                                             identifierDictionary:(NSDictionary <NSString * ,NSString *> * )identifierDict{
    
    NSLayoutConstraint * topConstraint      = [self addTopConstraintToViewTop:toView Offset:edg.top identifier:identifierDict[YRTopIdentifier]];
    NSLayoutConstraint * leftConstraint     = [self addLeftConstraintToViewLeft:toView Offset:edg.left identifier:identifierDict[YRLeftIdentifier]];
    NSLayoutConstraint * bottomConstraint   = [self addBottomConstraintToViewBottom:toView Offset:(-edg.bottom) identifier:identifierDict[YRBottomIdentifier]];
    NSLayoutConstraint * rightConstraint    = [self addRightConstraintToViewRight:toView Offset:(-edg.right) identifier:identifierDict[YRRightIdentifier]];
    return @[topConstraint,leftConstraint,bottomConstraint,rightConstraint];
}

- (NSArray<NSLayoutConstraint *>*)addEdgInsetsConstraintToView:(UIView * )toView
                                                  otherTopView:(UIView * )topView
                                                 offEdgeInsets:(UIEdgeInsets)edg
                                          identifierDictionary:(NSDictionary <NSString * ,NSString *> * )identifierDict{
    
    NSLayoutConstraint * topConstraint      = [self addTopConstraintToViewTop:topView Offset:edg.top identifier:identifierDict[YRTopIdentifier]];
    NSLayoutConstraint * leftConstraint     = [self addLeftConstraintToViewLeft:toView Offset:edg.left identifier:identifierDict[YRLeftIdentifier]];
    NSLayoutConstraint * bottomConstraint   = [self addBottomConstraintToViewBottom:toView Offset:(-edg.bottom) identifier:identifierDict[YRBottomIdentifier]];
    NSLayoutConstraint * rightConstraint    = [self addRightConstraintToViewRight:toView Offset:(-edg.right) identifier:identifierDict[YRRightIdentifier]];
    
    return @[topConstraint,leftConstraint,bottomConstraint,rightConstraint];
}

- (NSArray<NSLayoutConstraint *>*)addEdgInsetsConstraintToView:(UIView * )toView
                                                 otherLeftView:(UIView * )leftView
                                                 offEdgeInsets:(UIEdgeInsets)edg
                                          identifierDictionary:(NSDictionary <NSString * ,NSString *> * )identifierDict{
    
    NSLayoutConstraint * topConstraint      = [self addTopConstraintToViewTop:toView Offset:edg.top identifier:identifierDict[YRTopIdentifier]];
    NSLayoutConstraint * leftConstraint     = [self addLeftConstraintToViewLeft:leftView Offset:edg.left identifier:identifierDict[YRLeftIdentifier]];
    NSLayoutConstraint * bottomConstraint   = [self addBottomConstraintToViewBottom:toView Offset:(-edg.bottom) identifier:identifierDict[YRBottomIdentifier]];
    NSLayoutConstraint * rightConstraint    = [self addRightConstraintToViewRight:toView Offset:(-edg.right) identifier:identifierDict[YRRightIdentifier]];
    
    return @[topConstraint,leftConstraint,bottomConstraint,rightConstraint];
}

- (NSArray<NSLayoutConstraint *>*)addEdgInsetsConstraintToView:(UIView * )toView
                                                   otherBottom:(UIView * )BottomView
                                                 offEdgeInsets:(UIEdgeInsets)edg
                                          identifierDictionary:(NSDictionary <NSString * ,NSString *> * )identifierDict{
    
    NSLayoutConstraint * topConstraint      = [self addTopConstraintToViewTop:toView Offset:edg.top identifier:identifierDict[YRTopIdentifier]];
    NSLayoutConstraint * leftConstraint     = [self addLeftConstraintToViewLeft:toView Offset:edg.left identifier:identifierDict[YRLeftIdentifier]];
    NSLayoutConstraint * bottomConstraint   = [self addBottomConstraintToViewBottom:BottomView Offset:(-edg.bottom) identifier:identifierDict[YRBottomIdentifier]];
    NSLayoutConstraint * rightConstraint    = [self addRightConstraintToViewRight:toView Offset:(-edg.right) identifier:identifierDict[YRRightIdentifier]];
    
    return @[topConstraint,leftConstraint,bottomConstraint,rightConstraint];
}

- (NSArray<NSLayoutConstraint *>*)addEdgInsetsConstraintToView:(UIView * )toView
                                                 otherRightView:(UIView * )RightView
                                                 offEdgeInsets:(UIEdgeInsets)edg
                                          identifierDictionary:(NSDictionary <NSString * ,NSString *> * )identifierDict{
    
    NSLayoutConstraint * topConstraint      = [self addTopConstraintToViewTop:toView Offset:edg.top identifier:identifierDict[YRTopIdentifier]];
    NSLayoutConstraint * leftConstraint     = [self addLeftConstraintToViewLeft:toView Offset:edg.left identifier:identifierDict[YRLeftIdentifier]];
    NSLayoutConstraint * bottomConstraint   = [self addBottomConstraintToViewBottom:toView Offset:(-edg.bottom) identifier:identifierDict[YRBottomIdentifier]];
    NSLayoutConstraint * rightConstraint    = [self addRightConstraintToViewRight:RightView Offset:(-edg.right) identifier:identifierDict[YRRightIdentifier]];
    
    return @[topConstraint,leftConstraint,bottomConstraint,rightConstraint];
}

- (NSLayoutConstraint *)addTopConstraintToViewTop:(UIView * )toView
                                           Offset:(CGFloat)offset
                                       identifier:(NSString * )identifier{
    
    return [self addConstraintmyWitthAttribute:NSLayoutAttributeTop LayoutRelation:NSLayoutRelationEqual ToView:toView toLayoutAttribute:NSLayoutAttributeTop multiplier:1.0 constant:offset identifier:identifier];
}

- (NSLayoutConstraint *)addTopConstraintToViewBottom:(UIView * )toView
                                              Offset:(CGFloat)offset
                                          identifier:(NSString * )identifier{
    
    return [self addConstraintmyWitthAttribute:NSLayoutAttributeTop LayoutRelation:NSLayoutRelationEqual ToView:toView toLayoutAttribute:NSLayoutAttributeBottom multiplier:1.0 constant:offset identifier:identifier];
}

- (NSLayoutConstraint * )addLeftConstraintToViewLeft:(UIView * )toView Offset:(CGFloat)offset identifier:(NSString * )identifier{
    
   return [self addConstraintmyWitthAttribute:NSLayoutAttributeLeft LayoutRelation:NSLayoutRelationEqual ToView:toView toLayoutAttribute:NSLayoutAttributeLeft multiplier:1.0 constant:offset identifier:identifier];
}

- (NSLayoutConstraint * )addLeftConstraintToViewRight:(UIView * )toView Offset:(CGFloat)offset identifier:(NSString * )identifier{
    
    return [self addConstraintmyWitthAttribute:NSLayoutAttributeLeft LayoutRelation:NSLayoutRelationEqual ToView:toView toLayoutAttribute:NSLayoutAttributeRight multiplier:1.0 constant:offset identifier:identifier];
}

- (NSLayoutConstraint *)addBottomConstraintToViewBottom:(UIView * )toView Offset:(CGFloat)offset identifier:(NSString * )identifier{
    
    return [self addConstraintmyWitthAttribute:NSLayoutAttributeBottom LayoutRelation:NSLayoutRelationEqual ToView:toView toLayoutAttribute:NSLayoutAttributeBottom multiplier:1.0 constant:offset identifier:identifier];
}

- (NSLayoutConstraint *)addBottomConstraintToViewTop:(UIView * )toView Offset:(CGFloat)offset identifier:(NSString * )identifier{
    
    return [self addConstraintmyWitthAttribute:NSLayoutAttributeBottom LayoutRelation:NSLayoutRelationEqual ToView:toView toLayoutAttribute:NSLayoutAttributeTop multiplier:1.0 constant:offset identifier:identifier];
}

- (NSLayoutConstraint *)addRightConstraintToViewRight:(UIView * )toView Offset:(CGFloat)offset identifier:(NSString * )identifier
{
    return [self addConstraintmyWitthAttribute:NSLayoutAttributeRight LayoutRelation:NSLayoutRelationEqual ToView:toView toLayoutAttribute:NSLayoutAttributeRight multiplier:1.0 constant:offset identifier:identifier];
}

- (NSLayoutConstraint *)addRightConstraintToViewLeft:(UIView * )toView Offset:(CGFloat)offset identifier:(NSString * )identifier
{
    return [self addConstraintmyWitthAttribute:NSLayoutAttributeRight LayoutRelation:NSLayoutRelationEqual ToView:toView toLayoutAttribute:NSLayoutAttributeLeft multiplier:1.0 constant:offset identifier:identifier];
}

- (NSLayoutConstraint *)addCenterXConstraintToViewCenterX:(UIView * )toView Offset:(CGFloat)offset identifier:(NSString * )identifier
{
    return [self addConstraintmyWitthAttribute:NSLayoutAttributeCenterX LayoutRelation:NSLayoutRelationEqual ToView:toView toLayoutAttribute:NSLayoutAttributeCenterX multiplier:1.0 constant:offset identifier:identifier];
}

- (NSLayoutConstraint *)addCenterYConstraintToViewCenterY:(UIView * )toView Offset:(CGFloat)offset identifier:(NSString * )identifier
{
    return [self addConstraintmyWitthAttribute:NSLayoutAttributeCenterY LayoutRelation:NSLayoutRelationEqual ToView:toView toLayoutAttribute:NSLayoutAttributeCenterY multiplier:1.0 constant:offset identifier:identifier];
}

- (NSLayoutConstraint *)addWidthConstraintValue:(CGFloat)Value identifier:(NSString * )identifier
{
    return [self addConstraintmyWitthAttribute:NSLayoutAttributeWidth LayoutRelation:NSLayoutRelationEqual ToView:nil toLayoutAttribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:Value identifier:identifier];
}

- (NSLayoutConstraint *)addWidthConstraintEqualToView:(UIView * )toView Offset:(CGFloat)offset identifier:(NSString * )identifier
{
    return [self addConstraintmyWitthAttribute:NSLayoutAttributeWidth LayoutRelation:NSLayoutRelationEqual ToView:toView toLayoutAttribute:NSLayoutAttributeWidth multiplier:1.0 constant:offset identifier:identifier];
}

- (NSLayoutConstraint *)addHeightConstraintValue:(CGFloat)Value identifier:(NSString * )identifier
{
    return [self addConstraintmyWitthAttribute:NSLayoutAttributeHeight LayoutRelation:NSLayoutRelationEqual ToView:nil toLayoutAttribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:Value identifier:identifier];
}

- (NSLayoutConstraint *)addHeightConstraintEqualToView:(UIView * )toView Offset:(CGFloat)offset identifier:(NSString * )identifier
{
    return [self addConstraintmyWitthAttribute:NSLayoutAttributeHeight LayoutRelation:NSLayoutRelationEqual ToView:toView toLayoutAttribute:NSLayoutAttributeHeight multiplier:1.0 constant:offset identifier:identifier];
}

- (NSArray<NSLayoutConstraint *>*)addSizeConstraintValue:(CGSize)size Identifier:(NSDictionary <NSString *,NSString *>*)identifierDict{
    NSLayoutConstraint * widthConstraint = [self addWidthConstraintValue:size.width identifier:identifierDict[YRWidthIdentifier]];
    NSLayoutConstraint * heightConstraint = [self addHeightConstraintValue:size.height identifier:identifierDict[YRHeightIdentifier]];
    
    return @[widthConstraint,heightConstraint];
    
}

#pragma mark - remove
//加YR 避免重写系统的函数
- (void)removeConstraintYR:(NSString * )identifier{
    for (NSLayoutConstraint * obj in self.superview.constraints) {
        if ([obj.identifier isEqualToString:identifier]) {
            [self.superview removeConstraint:obj];
        }
    }
}

#pragma mark - update
- (void)updateCurrentConstraint:(NSLayoutConstraint *)layoutConstraint
            newLayoutConstraint:(NSLayoutConstraint *)newLayoutConstraint{
    [self removeConstraint:layoutConstraint];
    [self.superview addConstraint:newLayoutConstraint];
}

- (void)updateConstraintWithIdentifier:(NSString *)identifier
                          newLayoutConstraint:(NSLayoutConstraint *)layoutConstraint
{
    [self removeConstraintYR:identifier];
    [self.superview addConstraint:layoutConstraint];
}

- (void)updateAllConstraintIdentifiers:(NSArray <NSString * > *)identifiers
                        NewConstraints:(NSArray <NSLayoutConstraint *>*)Constraints
{
    for (NSString * identifier in identifiers) {
        [self removeConstraintYR:identifier];
    }
    [self.superview addConstraints:Constraints];
}



@end

















