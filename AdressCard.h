//
//  AdressCard.h
//  AddressBook
//
//  Created by Jorn Nordahl on 10/15/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdressCard : NSObject

//again imo copy is extraneous just retain the strings
//also declaring multiple props on one line is Im pretty sure against obj C code style
//at least as some people interpret it
@property (copy, nonatomic) NSString *name, *email;

//personal style but I would omit this in favor of a constructor
//taking the needed parameters
//then just create a new one and swap the instance out of the array
//then you have a nice cheap immutable object *if you make the above props readonly*
//in obj C readonly, and immutability are always the default choice.
//sometimes the real world necessitates this though
//if you want a mutable object just use the props

-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail;

//toString is called -(NSString *)description in objective C its an override from NSObject
//no need to declare it in the header
-(void) print;

@end
