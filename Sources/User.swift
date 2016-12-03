//
//  User.swift
//  SwiftStack
//
//  Created by FelixSFD on 02.12.16.
//
//

import Foundation

/**
 Represents a user on StackExchange.
 
 - author: FelixSFD
 
 - seealso: [StackExchange API](https://api.stackexchange.com/docs/types/user)
 */
public class User {
    
    // - MARK: The user-type
    
    /**
     The tpye of the user. The StackExchange API returns different types of users depending on the use-case.
     
     - note: `Type` would be swiftier, but it's a reserved keyword and doesn't work properly
     
     - author: FelixSFD
     */
    public enum UserType: String {
        /**
         This user-type can contain all available properties
         */
        case full = "full_user"
        case shallow = "shallow_user"
        case network = "network_user"
        
        /**
         This user-type could contain anything, but most likely, it is not initialized correctly.
         */
        case undefined = "undefined"
        
        /**
         Initializes the enum with `.undefined` as default value.
         */
        public init() {
            self = .undefined
        }
    }
    
    // - MARK: Public properties
    
    /**
     The `User.UserType` of the user.
     
     This does not affect the other properties. It's just for the developers to see, which data they can expect.
     */
    public var type = User.UserType.undefined
    
    
    // - MARK: Initializers
    
    /**
     Simple initializer with an `UserType` as possible parameter.
     
     - parameter type: The `UserType` the new instance should have
     
     - author: FelixSFD
     */
    public init(type: UserType) {
        self.type = type
    }
    
    /**
     Basic initializer without any parameters
     */
    public init() { }
    
    
    
    // - MARK: Values returned from API
    
}
