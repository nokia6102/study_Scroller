//
//  HelloWorldLayer.m
//  study_Scrolllayer
//
//  Created by lee living on 11-2-24.
//  Copyright LieHuo Tech 2011. All rights reserved.
//

// Import the interfaces
#import "HelloWorldScene.h"
#import "CCScrollLayer.h"

// HelloWorld implementation
@implementation HelloWorld

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorld *layer = [HelloWorld node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (void)testCallback:(id)sender
{
	int a;
	a = 1;
}

- (void)setPageIndex:(int)pageIndex
{
	if ([pageIndexArray objectAtIndex:pageIndex] == nil)
	{
		return;
	}
	
	for (CCLabelTTF *lab in pageIndexArray)
	{
		lab.color = ccGRAY;
	}
	
	((CCLabelTTF *)[pageIndexArray objectAtIndex:pageIndex]).color = ccWHITE;
}

- (void)onPageMoved:(CCScrollLayer *)scrollLayer
{
	[self setPageIndex:scrollLayer.currentScreen - 1];
}

- (void)initScrollLayer
{
	// get screen size
	CGSize screenSize = [CCDirector sharedDirector].winSize;
	
	/////////////////////////////////////////////////
	// PAGE 1
	////////////////////////////////////////////////
	// create a blank layer for page 1
	CCLayer *pageOne = [[CCLayer alloc] init];
	
	// create a label for page 1
//	CCLabelTTF *label = [CCLabelTTF labelWithString:@"Page 1" fontName:@"Arial Rounded MT Bold" fontSize:44];
//	label.position =  ccp( screenSize.width /2 , screenSize.height/2 );
  CCMenuItem *menu1=[CCMenuItemImage itemFromNormalImage:@"image1.png" selectedImage:nil target:self selector:@selector(testCallback:)];
  menu1.position = ccp(screenSize.width/2, screenSize.height/2);
	// add label to page 1 layer
	[pageOne addChild:menu1];
	
	/////////////////////////////////////////////////
	// PAGE 2
	////////////////////////////////////////////////
	// create a blank layer for page 2
	CCLayer *pageTwo = [[CCLayer alloc] init];
	
	// create a custom font menu for page 2
//	label = [CCLabelTTF labelWithString:@"Page 2" fontName:@"Arial Rounded MT Bold" fontSize:44];
//	CCMenuItemLabel *titem = [CCMenuItemLabel itemWithLabel:label  target:self selector:@selector(testCallback:)];
//	CCMenu *menu = [CCMenu menuWithItems: titem , nil];
  CCMenuItem *menu2=[CCMenuItemImage itemFromNormalImage:@"image2.png" selectedImage:nil target:self selector:@selector(testCallback:)];
  
	menu2.position = ccp(screenSize.width/2, screenSize.height/2);
	
	// add menu to page 2
	[pageTwo addChild:menu2];
	////////////////////////////////////////////////
	
	/////////////////////////////////////////////////
	// PAGE 3
	////////////////////////////////////////////////
	// create a blank layer for page 1
	CCLayer *pageThree = [[CCLayer alloc] init];
	
	// create a label for page 3
//	label = [CCLabelTTF labelWithString:@"Page 3" fontName:@"Arial Rounded MT Bold" fontSize:44];
//	label.position =  ccp( screenSize.width /2 , screenSize.height/2 );
	CCMenuItem *menu3=[CCMenuItemImage itemFromNormalImage:@"image3.png" selectedImage:nil target:self selector:@selector(testCallback:)];
  menu3.position = ccp(screenSize.width/2, screenSize.height/2);
	// add label to page 3 layer
	[pageThree addChild:menu3];
	
	// now create the scroller and pass-in the pages (set widthOffset to 0 for fullscreen pages)
	CCScrollLayer *scroller = [[CCScrollLayer alloc] initWithLayers:[NSMutableArray arrayWithObjects: pageOne,pageTwo,pageThree,nil] 
														widthOffset: 200];
	
	// finally add the scroller to your scene
	[self addChild:scroller];
	
	// page moved delegate
	{
		NSMethodSignature* signature = 
		[[self class] instanceMethodSignatureForSelector:@selector(onPageMoved:)];
		
		NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
		
		[invocation setTarget:self];
		[invocation setSelector:@selector(onPageMoved:)];
		
		scroller.onPageMoved = invocation;
	}
}

- (void)initPageIndex:(int)defaultPage    //--下方的小点
			  maxPage:(int)maxPage
{
	CGPoint indexPos = ccp(200, 30);
	CGPoint offsetPos = ccp(20, 0);
	for (int i = 0; i < maxPage; ++i)
	{
		CCLabelTTF *lab = [CCLabelTTF labelWithString:@"." 
											 fontName:@"Arial" 
											 fontSize:64];
		
		lab.position = ccpAdd(indexPos, ccpMult(offsetPos, i));
		[self addChild:lab];
		[pageIndexArray addObject:lab];
	}
	
	[self setPageIndex:defaultPage];
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) 
	{
		pageIndexArray = [[NSMutableArray alloc] init];
		
		[self initScrollLayer];
		
		[self initPageIndex:0 maxPage:3];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	[pageIndexArray release];
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
