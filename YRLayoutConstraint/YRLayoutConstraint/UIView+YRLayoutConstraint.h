//
//  UIView+YRLayoutConstraint.h
//  MoveService
//
//  Created by Luck on 17/3/30.
//  Copyright © 2017年 hongmw. All rights reserved.
//

#import <UIKit/UIKit.h>

//约束标识 KEY
static NSString * YRTopIdentifier     = @"YRTopConstraintIdentifier";
static NSString * YRLeftIdentifier    = @"YRLeftConstraintIdentifier";
static NSString * YRBottomIdentifier  = @"YRBottomConstraintIdentifier";
static NSString * YRRightIdentifier   = @"YRRightConstraintIdentifier";
static NSString * YRWidthIdentifier   = @"YRWidthConstraintIdentifier";
static NSString * YRHeightIdentifier  = @"YRHeightConstraintIdentifier";


@interface UIView (YRLayoutConstraint)

/**
 给View添加 EdgeInsets约束

 @param toView 依赖View
 @param edg 具体偏移量
 @param identifierDict 各个约束的标识 Dictionary *
        KEY:YRTopIdentifier
            YRLeftIdentifier
            YRBottomIdentifier
            YRRightIdentifier
      value:自定义字符串
 @return NSArray<NSLayoutConstraint *> *  使用 addConstraints:函数添加约束
 */
- (NSArray<NSLayoutConstraint *> * )addEdgeInsetsConstraintToView:(UIView * )toView
                                                    offEdgeInsets:(UIEdgeInsets)edg
                                             identifierDictionary:(NSDictionary <NSString * ,NSString *> * )identifierDict;
/**
 * 给View添加EdgeInsets 约束
 *
 * top方向的约束可以和其他方向的约束于不同的View
   当 TopView == ToView 时等同 addEdgeInsetsConstraintToView:offEdgeInsets:

 @param toView 依赖View
 @param topView top依赖View
 @param edg 具体偏移量
 @param identifierDict 各个约束的标识 Dictionary *
        KEY:YRTopIdentifier
            YRLeftIdentifier
            YRBottomIdentifier
            YRRightIdentifier
      value:自定义字符串

 @return NSArray<NSLayoutConstraint *> *  使用 addConstraints:函数添加约束
 */
- (NSArray<NSLayoutConstraint *>*)addEdgInsetsConstraintToView:(UIView * )toView
                                                  otherTopView:(UIView * )topView
                                                 offEdgeInsets:(UIEdgeInsets)edg
                                          identifierDictionary:(NSDictionary <NSString * ,NSString *> * )identifierDict;

/**
 *   给View添加EdgeInsets 约束
 * 
 *   left方向的约束可以和其他方向的约束于不同的View
     当 leftView == ToView 时等同 addEdgeInsetsConstraintToView:offEdgeInsets:

 @param toView 依赖View
 @param leftView left依赖View
 @param edg 具体偏移量
 @param identifierDict 各个约束的标识 Dictionary *
    KEY:YRTopIdentifier
        YRLeftIdentifier
        YRBottomIdentifier
        YRRightIdentifier
  value:自定义字符串
 

 @return NSArray<NSLayoutConstraint *> *  使用 addConstraints:函数添加约束
 */
- (NSArray<NSLayoutConstraint *>*)addEdgInsetsConstraintToView:(UIView * )toView
                                                 otherLeftView:(UIView * )leftView
                                                 offEdgeInsets:(UIEdgeInsets)edg
                                          identifierDictionary:(NSDictionary <NSString * ,NSString *> * )identifierDict;

/**
 *  给View添加EdgeInsets 约束
 *
 *   Bottom方向的约束可以和其他方向的约束于不同的View
     当 BottomView == ToView 时等同 addEdgeInsetsConstraintToView:offEdgeInsets:
 
 @param toView 依赖View
 @param BottomView Bottom依赖View
 @param edg 具体偏移量
 @param identifierDict 各个约束的标识 Dictionary *
    KEY:YRTopIdentifier
        YRLeftIdentifier
        YRBottomIdentifier
        YRRightIdentifier
  value:自定义字符串
 
 @return NSArray<NSLayoutConstraint *> *  使用 addConstraints:函数添加约束
 */
- (NSArray<NSLayoutConstraint *>*)addEdgInsetsConstraintToView:(UIView * )toView
                                                   otherBottom:(UIView * )BottomView
                                                 offEdgeInsets:(UIEdgeInsets)edg
                                          identifierDictionary:(NSDictionary <NSString * ,NSString *> * )identifierDict;

/**
 *  给View添加EdgeInsets 约束
 *
 *   Right方向的约束可以和其他方向的约束于不同的View
     当 RightView == ToView 时等同 addEdgeInsetsConstraintToView:offEdgeInsets:
 
 @param toView 依赖View
 @param RightView Right依赖View
 @param edg 具体偏移量
 @param identifierDict 各个约束的标识 Dictionary *
    KEY:YRTopIdentifier
        YRLeftIdentifier
        YRBottomIdentifier
        YRRightIdentifier
  value:自定义字符串
 
 @return NSArray<NSLayoutConstraint *> *  使用 addConstraints:函数添加约束
 */
- (NSArray<NSLayoutConstraint *>*)addEdgInsetsConstraintToView:(UIView * )toView
                                                otherRightView:(UIView * )RightView
                                                 offEdgeInsets:(UIEdgeInsets)edg
                                          identifierDictionary:(NSDictionary <NSString * ,NSString *> * )identifierDict;

/**
 给View添加Top方向的约束,并依赖toView的Top方向约束

 @param toView 依赖View
 @param offset 偏移量
 @param identifier 该约束的标识
 @return NSLayoutConstraint *      使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint *)addTopConstraintToViewTop:(UIView * )toView
                                           Offset:(CGFloat)offset
                                       identifier:(NSString * )identifier;



/**
 *  给View添加Top方向的约束,并依赖toView的Bottom方向约束
 
 @param toView 依赖View
 @param offset 偏移量
 @param identifier 该约束的标识
 @return NSLayoutConstraint *      使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint *)addTopConstraintToViewBottom:(UIView * )toView
                                              Offset:(CGFloat)offset
                                          identifier:(NSString * )identifier;


/**
 *  给View添加left方向的约束,并依赖toView的left方向约束

 @param toView 依赖View
 @param offset 偏移量
 @param identifier 该约束的标识
 @return NSLayoutConstraint *  使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint * )addLeftConstraintToViewLeft:(UIView * )toView
                                              Offset:(CGFloat)offset
                                          identifier:(NSString * )identifier;

/**
 *  给View添加left方向的约束,并依赖toView的Right方向约束
 
 @param toView 依赖View
 @param offset 偏移量
 @param identifier 该约束的标识
 @return NSLayoutConstraint *  使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint * )addLeftConstraintToViewRight:(UIView * )toView
                                               Offset:(CGFloat)offset
                                           identifier:(NSString * )identifier;

/**
 *  给View添加Bottom方向的约束,并依赖toView的Bottom方向约束

 @param toView 依赖View
 @param offset 偏移量
 @param identifier 该约束的标识
 @return NSLayoutConstraint *  使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint *)addBottomConstraintToViewBottom:(UIView * )toView
                                                 Offset:(CGFloat)offset
                                             identifier:(NSString * )identifier;

/**
    给View添加Bottom方向的约束,并依赖toView的Top方向约束

 @param toView 依赖View
 @param offset 偏移量
 @param identifier 该约束的标识
 @return NSLayoutConstraint *  使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint *)addBottomConstraintToViewTop:(UIView * )toView
                                              Offset:(CGFloat)offset
                                          identifier:(NSString * )identifier;

/**
    给View添加Right方向的约束,并依赖toView的Right方向约束

 @param toView 依赖View
 @param offset 偏移量
 @param identifier 该约束的标识
 @return NSLayoutConstraint *  使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint *)addRightConstraintToViewRight:(UIView * )toView
                                               Offset:(CGFloat)offset
                                           identifier:(NSString * )identifier;

/**
 *  给View添加Right方向的约束,并依赖toView的Left方向约束

 @param toView 依赖View
 @param offset 偏移量
 @return NSLayoutConstraint *  使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint *)addRightConstraintToViewLeft:(UIView * )toView
                                              Offset:(CGFloat)offset
                                          identifier:(NSString * )identifier;

/**
 * 给View添加CenterX约束,并依赖toView的CenterX约束

 @param toView 依赖View
 @param offset 偏移量
 @param identifier 该约束的标识
 @return NSLayoutConstraint *  使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint *)addCenterXConstraintToViewCenterX:(UIView * )toView
                                                   Offset:(CGFloat)offset
                                               identifier:(NSString * )identifier;

/**
   给View添加CenterY约束,并依赖toView的CenterY约束

 @param toView 依赖View
 @param offset 偏移量
 @param identifier 该约束的标识
 @return NSLayoutConstraint *  使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint *)addCenterYConstraintToViewCenterY:(UIView * )toView
                                                   Offset:(CGFloat)offset
                                               identifier:(NSString * )identifier;

/**
   给View添加Width约束

 @param Value Width值
 @param identifier 该约束的标识
 @return NSLayoutConstraint *  使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint *)addWidthConstraintValue:(CGFloat)Value identifier:(NSString * )identifier;

/**
   给View添加Width约束,并等于toView的Width

 @param toView 依赖View
 @param offset 偏移量
 @param identifier 该约束的标识
 @return NSLayoutConstraint *  使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint *)addWidthConstraintEqualToView:(UIView * )toView
                                               Offset:(CGFloat)offset
                                           identifier:(NSString * )identifier;

/**
 * 给View添加Height约束

 @param Value Height 值
 @param identifier 该约束的标识
 @return NSLayoutConstraint *  使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint *)addHeightConstraintValue:(CGFloat)Value identifier:(NSString * )identifier;

/**
 * 给View添加Height约束,并等于toView的Height

 @param toView 依赖View
 @param offset 偏移量
 @param identifier 该约束的标识
 @return NSLayoutConstraint *  使用addConstraint:函数添加约束
 */
- (NSLayoutConstraint *)addHeightConstraintEqualToView:(UIView * )toView
                                                Offset:(CGFloat)offset
                                            identifier:(NSString * )identifier;

/**
 *  给View添加size约束,并返回WidthConstraint约束和HeightConstraint 约束 数组

 @param size CGSize 约束的大小
 @param identifierDict 约束的标识
        KEY:YRWidthIdentifier
            YRHeightIdentifier
      value:字符串
 @return  NSArray *       使用addConstraints:函数添加约束
 */
- (NSArray<NSLayoutConstraint *>*)addSizeConstraintValue:(CGSize)size Identifier:(NSDictionary <NSString *,NSString *>*)identifierDict;

#pragma mark - removeConstraint

/**
 *  根据约束标识移除一个约束

 @param identifier 约束的标识
 */
- (void)removeConstraintYR:(NSString * )identifier;

/**
 * 更新一个约束

 @param layoutConstraint 目前的约束
 @param newLayoutConstraint 更新后的约束
 */
- (void)updateCurrentConstraint:(NSLayoutConstraint *)layoutConstraint
            newLayoutConstraint:(NSLayoutConstraint *)newLayoutConstraint;

/**
 * 根据标识更新一个约束

 @param identifier 约束标识
 @param layoutConstraint 新的约束
 */
- (void)updateConstraintWithIdentifier:(NSString *)identifier
                          newLayoutConstraint:(NSLayoutConstraint *)layoutConstraint;

/**
 * 更新一组约束

 @param identifiers 数组约束标识
 @param Constraints 新的一组约束
 */
- (void)updateAllConstraintIdentifiers:(NSArray <NSString * > *)identifiers
                        NewConstraints:(NSArray <NSLayoutConstraint *>*)Constraints;
@end

















