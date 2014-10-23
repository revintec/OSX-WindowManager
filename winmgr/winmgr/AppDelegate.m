//
//  AppDelegate.m
//  winmgr
//
//  Created by revin on Oct.24,2014.
//  Copyright (c) 2014 revin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSAlert*a=[NSAlert alertWithMessageText:@"XXX" defaultButton:@"default" alternateButton:@"alternate" otherButton:@"other" informativeTextWithFormat:@"aaaa%@",@"bbbb"];
    [a runModal];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
