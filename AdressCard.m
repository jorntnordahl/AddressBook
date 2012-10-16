//
//  AdressCard.m
//  AddressBook
//
//  Created by Jorn Nordahl on 10/15/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import "AdressCard.h"

@implementation AdressCard

@synthesize name, email;

-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail
{
    self.name = theName;
    self.email = theEmail;
}

-(BOOL) isEqual:(AdressCard *) theCard
{
    if ([name isEqualToString:theCard.name] == YES &&
        [email isEqualToString:theCard.email])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void) print
{
    NSLog(@"================================================");
    NSLog(@"|                                              |");
    NSLog(@"|           %-31s    |", [name UTF8String]);
    NSLog(@"|           %-31s    |", [email UTF8String]);
    NSLog(@"|                                              |");
    NSLog(@"|                                              |");
    NSLog(@"|                O          O                  |");
    NSLog(@"================================================");
}

@end
