//
//  VariaveisGlobais.h
//  ListaContatos
//
//  Created by Eduardo Lima on 8/30/12.
//  Copyright (c) 2012 IAI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VariaveisGlobais : NSObject

//onde o arquivo que representa o array de contatos foi salvo em disco
@property (nonatomic, strong) MPMoviePlayerController *video;

+(VariaveisGlobais*)shared;

@end
