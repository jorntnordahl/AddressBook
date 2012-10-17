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
        
        //again I would make this a constructor call rather than set the props after the fact
        //also if you really use a default constructor like this
        //you can do [AdressCard new];  its the equivalent of alloc init..
        AdressCard *card = [[AdressCard alloc] init];

        //although many obj C library methods will force you
        //to use this syntax its actually against modern obj C 
        //coding conventions to call properties not using dot syntax
        //I think it has something to do with Apple's key value coding shit
        //its not bad or wrong, but generally preferred to use the property
        //not call the method explcitly - this is pretty java-y
//its also a bit superficial but it cuts down on bracket nesting and is just easier to read
        //card.name = @"Jorn Nordahl";
        //card.email = @"foo@foo.com";
        [card setName:@"Jorn Nordahl"];
        [card setEmail:@"JornTNordahl@gmail.com"];
        
//One more comment on this allocation scheme - you will almost never write code in the main 
//file thats ok its just an example - but in general this allocation scheme should include
//a call to autorelease on allocation - (except for ARC projects)
//the reason is that normally you are *not* in a main method and alloc increments the retain
//count of the object which means this object will not be drained from the autorelease pool

//better
//AdressCard *card1 = [[AdressCard new] autorelease];

//this will not release the object but it will decrement the retain count
//so that the autorelease pool can dealloc it when the stack unwinds.
//the key thing to remember is that an autoreleased object will NEVER be released
//as long as a pointer to it is on the current stack of a thread
//so theres no risk in it being released prematurely
//since you add the object to NSArray which like all obj C collections
//does an internal "retain" on the object you should create these as autorelease instances.
//except for very intensive recurisve type functions you almost always use autorelease
//in a non ARC project and retain the object in the caller if you need to hold on to it.
//just food for thought.
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
        //myBook.book.count;
        NSLog(@"Entries: %li", [myBook entries]);
        [myBook list];
        
        
        // searching for address card by name:
        NSString *search = @"Jrn Nordahl";
        AdressCard *foundCard = [myBook lookup:search];
        NSLog(@"Found Card: ");
        if (foundCard == nil)
        {
            NSLog(@"Unable to find AdressCard with name '%@'", search);
        }
        else
        {
            //NSLog(foundCard.description);
            [foundCard print];
        }
        
        // remove card:
        [myBook removeCard:foundCard];
        
        NSLog(@"The following entries are left in the address book:");
        //if this prints all the elements I would make it a -(NSString *)description override and 
        //NSLog the description
        [myBook list];
    
        // sorting:
        NSLog(@"Sorted Address Book:");
        [myBook sort];
        [myBook list];
        
    }
    return 0;
}

