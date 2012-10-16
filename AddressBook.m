//
//  AddressBook.m
//  AddressBook
//
//  Created by Jorn Nordahl on 10/15/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook

@synthesize book, bookName;

-(id) initWithName: (NSString *) name
{
    self = [super init];
    
    if (self)
    {
        bookName = [NSString stringWithString:name];
        book = [NSMutableArray array];
    }
    
    return self;
}

-(id) init
{
    return [self initWithName:@"NoName"];
}

-(void) addCard: (AdressCard *) theCard
{
    [book addObject:theCard];
}

-(void) removeCard: (AdressCard *) theCard
{
    [book removeObject:theCard];
}



-(NSUInteger) entries
{
    return [book count];
}

-(void) list
{
    if ([book count] > 0)
    {
        for (AdressCard *theCard in book)
        {
            [theCard print];
        }
    }
    else
    {
        NSLog(@"Address Book is empty...");
    }
}

-(AdressCard *) lookup: (NSString *) theName
{
    for (AdressCard *nextCard in book)
    {
        if ( [nextCard.name caseInsensitiveCompare:theName] == NSOrderedSame)
        {
            return nextCard;
        }
    }
    
    return nil;
}

-(void) sort
{
    [book sortUsingSelector:@selector(compareNames:)];
    
    
    //[book sortUsingComparator:^NSComparisonResult(AdressCard *obj1, AdressCard *obj2) {
    //    return [obj1.name compare: [obj2.name]];
    //}];
}

@end
