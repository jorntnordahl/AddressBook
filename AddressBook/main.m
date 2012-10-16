//
//  main.m
//  AddressBook
//
//  Created by Jorn Nordahl on 10/15/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AdressCard.h"
#import "AddressBook.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *aName = @"Jorn Nordahl";
        NSString *aEmail = @"JornTNordahl@gmail.com";
        
        AdressCard *card = [[AdressCard alloc] init];
        [card setName:aName];
        [card setEmail:aEmail];
        
        AdressCard *card1 = [[AdressCard alloc] init];
        [card1 setName:@"Izabela Nordahl"];
        [card1 setEmail:@"Izabelan@gmail.com"];
        
        
        // address book:
        AddressBook *myBook = [[AddressBook alloc] initWithName:@"Jorns AddressBook"];
        [myBook addCard:card];
        [myBook addCard:card1];
        NSLog(@"Entries: %li", [myBook entries]);
        [myBook list];
        
        
        // searching for address card by name:
        NSString *search = @"Jorn Nordahl";
        AdressCard *foundCard = [myBook lookup:search];
        NSLog(@"Found Card: ");
        if (foundCard == nil)
        {
            NSLog(@"Unable to find AdressCard with name '%@'", search);
        }
        else
        {
            [foundCard print];
        }
        
        // remove card:
        [myBook removeCard:foundCard];
        
        NSLog(@"The following entries are left in the address book:");
        [myBook list];
    
        
        
    }
    return 0;
}

