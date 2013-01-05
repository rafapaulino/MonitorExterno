//
//  AppDelegate.m
//  MonitorExterno
//
//  Created by Rafael Brigagão Paulino on 16/10/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //verificar se tem algum monitor externo
    //uiscreen é a classe responsavel por contrlar os monitores presentes e gerenciar os seus tamanhos
    //elaapresenta um metodo de classe que retorna o array com s monitores presentes no app
    if ([[UIScreen screens] count] > 1)
    {
        //se entrar aqui temos mais do que um monitor
        
        //o indice 0 do rray sempre é a telado aparelho
        _screenExterna = [[UIScreen screens] objectAtIndex:1];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Monitor detectado!" message:@"Escolha a resolucao" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
        
        //captar quantas resolucoes existem no monitor externo
        //dentro do screenexterna temos um array chamado avaliablemodes onde está presente as resolucoes disponiveis
        for (UIScreenMode *resolucao in _screenExterna.availableModes)
        {
            //para cada resolucao encontrada, vamos adicionar um botao no alerta
            [alert addButtonWithTitle:[NSString stringWithFormat:@"%.0f X %.0f", resolucao.size.width, resolucao.size.height]];
            
        }
        [alert show];
    }
    
    
    //_window.backgroundColor = [UIColor yellowColor];
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//metodo acionado quando o usuario clica em um botao do alerta
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   //usar a escolha do usuario para definir qual vai ser a resolucao da tela externa
    _screenExterna.currentMode = [_screenExterna.availableModes objectAtIndex:buttonIndex];
    
    //vamos criar a window externa se baseando no tamanho da screen
    _windowExterna = [[UIWindow alloc] initWithFrame:[_screenExterna bounds]];
    
    //agora que a screenExterna já tem uma rssolucao definida e a window ja foi criada no tamanho dela, podemos falar para a windowExterna que ela vai pertencer a screenExterna
    _windowExterna.screen = _screenExterna;
    
    _windowExterna.backgroundColor = [UIColor greenColor];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"meuFilme" ofType:@"m4v"];
    
    NSURL *url = [NSURL fileURLWithPath:path];
    
    player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    //setar o tamanho do vídeo para o tamanho da windowExterna
    player.view.frame = _windowExterna.frame;
    
    [player setScalingMode:MPMovieScalingModeAspectFit];
    
    [_windowExterna addSubview:player.view];
    
    //guardar a instancia do player no variaveis globais
    [VariaveisGlobais shared].video = player;
    
    [_windowExterna makeKeyAndVisible];
}

@end
