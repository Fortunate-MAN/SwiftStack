//
//  RequestsQuestions.swift
//  SwiftStack
//
//  Created by NobodyNada on 17.12.16.
//
//

import Foundation
import Dispatch

/**
This extension contains all requests in the SITES section of the StackExchange API Documentation.

- author: NobodyNada, FelixSFD
*/
public extension APIClient {
	
	// - MARK: /questions/{ids}
    /**
     Fetches questions synchronously.
	
	 - parameter ids: The question IDs to fetch.
     
     - parameter parameters: The dictionary of parameters used in the request
     
     - parameter backoffBehavior: The behavior when an APIRequest has a backoff
     
     - returns: The list of sites as `APIResponse<Question>`
     
     - author: NobodyNada
     */
	public func fetchQuestions(
		_ ids: [Int],
		parameters: [String:String] = [:],
		backoffBehavior: BackoffBehavior = .wait) throws -> APIResponse<Question> {
		
		guard !ids.isEmpty else {
			fatalError("ids is empty")
		}
		
		
		return try performAPIRequest(
			"questions/\(ids.map {String($0)}.joined(separator: ";"))",
			parameters: parameters,
			backoffBehavior: backoffBehavior
		)
	}
    
    /**
	 Fetches questions asynchronously.
	
	 - parameter ids: The question IDs to fetch.
	
	 - parameter parameters: The dictionary of parameters used in the request
	
	 - parameter backoffBehavior: The behavior when an APIRequest has a backoff
	
	 - parameter completion
	
      - author: NobodyNada
     */
    public func fetchQuestions(
		_ ids: [Int],
		parameters: [String: String] = [:],
		backoffBehavior: BackoffBehavior = .wait,
		completionHandler: @escaping (APIResponse<Question>?, Error?) -> ()) {
        
        queue.async {
            do {
				let response: APIResponse<Question> = try self.fetchQuestions(
					ids,
					parameters: parameters,
					backoffBehavior: backoffBehavior
				)
				
                completionHandler(response, nil)
            } catch {
                completionHandler(nil, error)
            }
        }
    }
	
	
	/**
	Fetches a question synchronously.
	
	- parameter ids: The question IDs to fetch.
	
	- parameter parameters: The dictionary of parameters used in the request
	
	- parameter backoffBehavior: The behavior when an APIRequest has a backoff
	
	- returns: The list of sites as `APIResponse<Question>`
	
	- author: NobodyNada
	*/
	public func fetchQuestion(
		_ id: Int,
		parameters: [String:String] = [:],
		backoffBehavior: BackoffBehavior = .wait) throws -> APIResponse<Question> {
		
		return try fetchQuestions([id], parameters: parameters, backoffBehavior: backoffBehavior)
	}
	
	/**
	Fetches a question asynchronously.
	
	- parameter ids: The question IDs to fetch.
	
	- parameter parameters: The dictionary of parameters used in the request
	
	- parameter backoffBehavior: The behavior when an APIRequest has a backoff
	
	- parameter completion
	
	- author: NobodyNada
	*/
	public func fetchQuestion(
		_ id: Int,
		parameters: [String: String] = [:],
		backoffBehavior: BackoffBehavior = .wait,
		completionHandler: @escaping (APIResponse<Question>?, Error?) -> ()) {
		
		fetchQuestions([id], parameters: parameters, backoffBehavior: backoffBehavior, completionHandler: completionHandler)
	}
    
    
    // - MARK: /questions/{ids}/comments
    
    /**
     Fetches `Comment`s on `Question`s synchronously.
     
     - parameter ids: The question IDs to fetch.
     
     - parameter parameters: The dictionary of parameters used in the request
     
     - parameter backoffBehavior: The behavior when an `APIRequest` has a backoff
     
     - returns: The list of comments as `APIResponse<Comment>`
     
     - authors: NobodyNada, FelixSFD
     */
    public func fetchCommentsOn(
        questions ids: [Int],
        parameters: [String:String] = [:],
        backoffBehavior: BackoffBehavior = .wait) throws -> APIResponse<Comment> {
        
        guard !ids.isEmpty else {
            fatalError("ids is empty")
        }
        
        
        return try performAPIRequest(
            "questions/\(ids.map {String($0)}.joined(separator: ";"))/comments",
            parameters: parameters,
            backoffBehavior: backoffBehavior
        )
    }
    
    /**
     Fetches `Comment`s on `Question`s asynchronously.
     
     - parameter ids: The question IDs to fetch.
     
     - parameter parameters: The dictionary of parameters used in the request
     
     - parameter backoffBehavior: The behavior when an `APIRequest` has a backoff
     
     - parameter completionHandler:
     
     - authors: NobodyNada, FelixSFD
     */
    public func fetchCommentsOn(
        questions ids: [Int],
        parameters: [String:String] = [:],
        backoffBehavior: BackoffBehavior = .wait,
        completionHandler: @escaping (APIResponse<Comment>?, Error?) -> ()) {
        
        queue.async {
            do {
                let response: APIResponse<Comment> = try self.fetchCommentsOn(questions: ids, parameters: parameters, backoffBehavior: backoffBehavior)
                
                completionHandler(response, nil)
            } catch {
                completionHandler(nil, error)
            }
        }
    }
    
    /**
     Fetches `Comment`s on a single `Question` synchronously.
     
     - parameter id: The question ID to fetch.
     
     - parameter parameters: The dictionary of parameters used in the request
     
     - parameter backoffBehavior: The behavior when an `APIRequest` has a backoff
     
     - returns: The list of comments as `APIResponse<Comment>`
     
     - authors: NobodyNada, FelixSFD
     */
    public func fetchCommentsOn(
        question id: Int,
        parameters: [String:String] = [:],
        backoffBehavior: BackoffBehavior = .wait) throws -> APIResponse<Comment> {
        return try fetchCommentsOn(questions: [id], parameters: parameters, backoffBehavior: backoffBehavior)
    }
    
    /**
     Fetches `Comment`s on a single `Question` asynchronously.
     
     - parameter id: The question ID to fetch.
     
     - parameter parameters: The dictionary of parameters used in the request
     
     - parameter backoffBehavior: The behavior when an `APIRequest` has a backoff
     
     - parameter completionHandler:
     
     - authors: NobodyNada, FelixSFD
     */
    public func fetchCommentsOn(
        question id: Int,
        parameters: [String:String] = [:],
        backoffBehavior: BackoffBehavior = .wait,
        completionHandler: @escaping (APIResponse<Comment>?, Error?) -> ()) {
        
        fetchCommentsOn(questions: [id], parameters: parameters, backoffBehavior: backoffBehavior, completionHandler: completionHandler)
    }
	
}
