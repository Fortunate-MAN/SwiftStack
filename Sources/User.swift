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
     
     - author: FelixSFD
     */
    public enum UserInfoType: String {
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
    
    /**
     The type of the user/account as returned form the API.
     
     - author: FelixSFD
     
     - seealso: [StackExchange API](https://api.stackexchange.com/docs/types/user)
     */
    public enum UserType: String {
        case unregistered = "unregistered"
        case registered = "registered"
        case moderator = "moderator"
        case doesNotExist = "does_not_exist"
    }
    
    // - MARK: Public properties
    
    /**
     The `User.UserType` of the user.
     
     This does not affect the other properties. It's just for the developers to see, which data they can expect.
     */
    public var type = User.UserInfoType.undefined
    
    
    // - MARK: Initializers
    
    /**
     Simple initializer with an `UserInfoType` as possible parameter.
     
     - parameter type: The `UserType` the new instance should have
     
     - author: FelixSFD
     */
    public init(type: UserInfoType) {
        self.type = type
    }
    
    /**
     Basic initializer without any parameters
     */
    public init() { }
    
    
    
    // - MARK: Values returned from API
    
    public var about_me: String?
    
    public var accept_rate: Int?
    
    public var account_id: Int?
    
    public var age: Int?
    
    public var answer_count: Int?
    
    public var badge_counts: BadgeCount?
    
    public var creation_date: Date?
    
    public var display_name: String?
    
    public var down_vote_count: Int?
    
    public var is_employee: Bool?
    
    public var last_access_date: Date?
    
    public var last_modified_date: Date?
    
    public var link: URL?
    
    public var location: String?
    
    public var profile_image: URL?
    
    public var question_count: Int?
    
    public var reputation: Int?
    
    public var reputation_change_day: Int?
    
    public var reputation_change_month: Int?
    
    public var reputation_change_quarter: Int?
    
    public var reputation_change_week: Int?
    
    public var reputation_change_year: Int?
    
    public var timed_penalty_date: Date?
    
    public var up_vote_count: Int?
    
    public var user_id: Int?
    
    public var user_type: UserType = .doesNotExist
    
    public var view_count: Int?
    
    public var website_url: String?
    
}
