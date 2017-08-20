//
//  AppDelegate.h
//  YRLayoutConstraint
//
//  Created by 洪绵卫 on 2017/8/20.
//  Copyright © 2017年 洪绵卫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

