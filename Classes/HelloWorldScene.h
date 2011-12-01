//
//  HelloWorldLayer.h
//  study_Scrolllayer
//
//  Created by lee living on 11-2-24.
//  Copyright LieHuo Tech 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorld Layer
@interface HelloWorld : CCLayer
{
	NSMutableArray *pageIndexArray;
}

// returns a Scene that contains the HelloWorld as the only child
+(id) scene;

@end
