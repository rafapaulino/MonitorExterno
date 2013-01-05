//
//  VariaveisGlobais.m
//  ListaContatos
//
//  Created by Eduardo Lima on 8/30/12.
//  Copyright (c) 2012 IAI. All rights reserved.
//

#import "VariaveisGlobais.h"

@implementation VariaveisGlobais

//Preciso criar um metodo que permita que outras classes acessem uma instância única desta classe VariaveisGlobais

static VariaveisGlobais *_shared = nil;

+(VariaveisGlobais*)shared{
    
    //para garantir que mesmo que eu trabalhe com mais de uma thread, eu não corra o risco de duas threads chamarem esse método ao mesmo tempo e criar dois objetos diferentes. Lembrando que Singleton possui apenas uma única instância.
    @synchronized (self){
        if (_shared == nil) {
            
            //Se ainda não existe um objeto desta classe, criamos
            _shared = [[self alloc] init];
        }
    }
    
    //Seja um objeto criado neste momento, ou um objeto já existente, retornamos a referencia dessa instância compartilhada
    return _shared;
    
}

@end
