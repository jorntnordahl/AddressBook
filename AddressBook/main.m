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
        
        AdressCard *card = [[AdressCard alloc] init];
        [card setName:@"Jorn Nordahl"];
        [card setEmail:@"JornTNordahl@gmail.com"];
        
        AdressCard *card1 = [[AdressCard alloc] init];
        [card1 setName:@"Izabela Nordahl"];
        [card1 setEmail:@"Izabelan@gmail.com"];
        
        AdressCard *card2 = [[AdressCard alloc] init];
        [card2 setName:@"Lasse Nordahl"];
        [card2 setEmail:@"lasseanordahl@gmail.com"];
   
        AdressCard *card3 = [[AdressCard alloc] init];
        [card3 setName:@"Ela Nordahl"];
        [card3 setEmail:@"elanordahl@gmail.com"];
        
        AdressCard *card4 = [[AdressCard alloc] init];
        [card4 setName:@"Erik Nordahl"];
        [card4 setEmail:@"eriknordahl@gmail.com"];
        
        // address book:
        AddressBook *myBook = [[AddressBook alloc] initWithName:@"Jorns AddressBook"];
        [myBook addCard:card];
        [myBook addCard:card1];
        [myBook addCard:card2];
        [myBook addCard:card3];
        [myBook addCard:card4];
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
    
        // sorting:
        NSLog(@"Sorted Address Book:");
        [myBook sort];
        [myBook list];
    }
    return 0;
}

