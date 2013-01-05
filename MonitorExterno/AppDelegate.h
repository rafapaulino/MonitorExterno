//
//  AppDelegate.h
//  MonitorExterno
//
//  Created by Rafael Brigagão Paulino on 16/10/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VariaveisGlobais.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UIAlertViewDelegate>
{
    MPMoviePlayerController *player;
}

@property (strong, nonatomic) UIWindow *window;

//como teremos um monitor externo, que será uma area adicional onde poderemos desenvolver parte do app, assim como essa tela principal, essa tela adicional tembém terá uma uiWindow

@property (strong, nonatomic) UIWindow *windowExterna;


//vamos declarar um UIScreen que vai controlar o monitor externo
@property (nonatomic, strong) UIScreen *screenExterna;

@end
