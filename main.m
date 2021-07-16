// https://www.cocoawithlove.com/2010/09/minimalist-cocoa-programming.html

#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[])
{
    // memory management
    [NSAutoreleasePool new];

    // create an NS Application
    [NSApplication sharedApplication];

    // set presentation policy to regular
    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

    // create menu bar
    id menubar = [[NSMenu new] autorelease];
    id appMenuItem = [[NSMenuItem new] autorelease];
    [menubar addItem:appMenuItem];
    [NSApp setMainMenu:menubar];

    // create menu item
    id appMenu = [[NSMenu new] autorelease];
    id appName = [[NSProcessInfo processInfo] processName];
    id quitTitle = [@"Quit " stringByAppendingString:appName];
    id quitMenuItem = [[[NSMenuItem alloc] initWithTitle:quitTitle action:@selector(terminate:) keyEquivalent:@"q"] autorelease];
    [appMenu addItem:quitMenuItem];
    [appMenuItem setSubmenu:appMenu];

    // create a window
    id window = [[[NSWindow alloc]
                  initWithContentRect:NSMakeRect(0, 0, 200, 200)
                    styleMask:NSTitledWindowMask
                      backing:NSBackingStoreBuffered
                        defer:NO
    ] autorelease];

    // set position, only x is applied, y seems to have no effect
    [window cascadeTopLeftFromPoint:NSMakePoint(20,20)];

    // set title
    [window setTitle:appName];

    // Makes the window the key window. shows window
    // Moves the window to the front of its level,
    // without changing either the key window or the main window.
    [window makeKeyAndOrderFront:nil];

    // run
    [NSApp run];
    return 0;
}