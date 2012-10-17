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

//just my opinion - this is a little java-y
//although it makes sense from a "is this equal to that" standpoint
//you have made the choice to allow you application to 
//contain more than one instance of the object
//for a given email and name
//this is obviously a valid design choice.
//but if you dont allow copies of the objects to compete
//with the live set of objects in memory
//you almost never have to do this
//maybe because its C I always try to leverage
// == pointers are more usable in C than in Java
//and therefor you dont ever have to worry about the 
//pointer location changing I just find it simpler
//to never create duplicate objects if possible
//maybe you need this for sorting but I thought there was a different comparator
//function for that
//unless theres really a need I would implement this as
//return theCard == self;
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

-(NSComparisonResult) compareNames: (id) element
{
    //AdressCard *myCard = (AdressCard *) element;
    //NSLog(@"Sorting: %s vs. %s", [name UTF8String], [[element name] UTF8String]);
    //NSLog(@"Sorting: %@ vs. %@", self.name, [myCard name]);
    NSComparisonResult result = [name compare: [element name]];
//I may be wrong here but I have no clue as to why a C string (void**) is needed here
//NSLog which is just printf will print a string using %@ with no call to UTF8String needed
//maybe the formatter params you have required it but I dont see why exactly
//unless you are doing raw IO or calling into C libraries C strings are almost never needed in obj C.
    NSLog(@"Sorting: %-15s vs. %-15s = %li", [name UTF8String], [[element name] UTF8String], result);
    return result;
}

//toString in obj C is an override of -(NSString *)description from NSObject
//so this should be renamed and logged from calling code - as a bonus the debugger will print
//your objects out for you nicely if you implement description
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
