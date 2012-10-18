//
//  AddressBook.m
//  AddressBook
//
//  Created by Jorn Nordahl on 10/15/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook

@synthesize book, bookName, cards;

-(id) initWithName: (NSString *) name
{
    self = [super init];
    
    if (self)
    {
        bookName = [NSString stringWithString:name];
        book = [NSMutableArray array];
        cards = [[NSMutableDictionary alloc]init];
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
    [cards setObject:theCard forKey:theCard.name];
}

-(void) removeCard: (AdressCard *) theCard
{
    [book removeObject:theCard];
    [cards removeObjectForKey:theCard.name];
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
    if (cards != nil)
    {
        if ([cards objectForKey:theName] != nil)
        {
            return [cards objectForKey:theName];
        }
    }
    
    return nil;
}

-(void) sort
{
    // sort using a selector:
    [book sortUsingSelector:@selector(compareNames:)];
        
    // sort using a comparator:
    [book sortUsingComparator:^NSComparisonResult(AdressCard *obj1, AdressCard *obj2) {
        NSLog(@"Comparator: %@ vs. %@", [obj1 name], [obj2 name]);
        return [[obj1 name] compare: [obj2 name]];
    }];
}

@end
