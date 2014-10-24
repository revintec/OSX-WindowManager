//
//  AppDelegate.m
//  winmgr
//
//  Created by revin on Oct.24,2014.
//  Copyright (c) 2014 revin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property CFMachPortRef eventTap;
@property NSTextField*output;
@property NSString*string;
@property(weak)IBOutlet NSWindow * window;
@end

@implementation AppDelegate

-(void)debugOutput:(NSString*)string{
    self.string=[self.string stringByAppendingString:string];
    [self.output setStringValue:self.string];
}
-(BOOL)requestAccessibility{
    NSDictionary *options = @{(__bridge id)kAXTrustedCheckOptionPrompt: @YES};
    BOOL accessibilityEnabled = AXIsProcessTrustedWithOptions((__bridge CFDictionaryRef)options);
    return accessibilityEnabled;
}

-(void)applicationDidFinishLaunching:(NSNotification *)notification{
    NSView *contentView = [self.window contentView];
    self.output=[contentView viewWithTag:100];
    self.string=@"";
    
    BOOL ac=[self requestAccessibility];
    [self debugOutput:ac?@"YES\n":@"NO\n"];
    
    [self startEventTap];

}

-(void)startEventTap{
    //eventTap is an ivar on this class of type CFMachPortRef
    self.eventTap=CGEventTapCreate(kCGSessionEventTap,kCGHeadInsertEventTap,kCGEventTapOptionListenOnly,kCGEventMaskForAllEvents,myCGEventCallback,NULL);
    NSLog(@"%@",self.eventTap);
    CGEventTapEnable(self.eventTap,true);
    NSLog(@"setup completed");
}

CGEventRef myCGEventCallback(CGEventTapProxy proxy,CGEventType type,CGEventRef event,void *refcon){
    NSLog(@"%@",NSStringFromPoint([NSEvent mouseLocation]));
    return event;
}

-(void)applicationWillTerminate:(NSNotification *)aNotification{
    // Insert code here to tear down your application
}
@end
