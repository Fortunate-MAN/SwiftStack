//
//  RequestsSites.swift
//  SwiftStack
//
//  Created by FelixSFD on 11.12.16.
//
//

import Foundation
import Dispatch

/**
This extension contains all requests in the SITES section of the StackExchange API Documentation.

- authors: FelixSFD, NobodyNada
*/
public extension APIClient {
	
	// - MARK: /sites
	/**
	JUST A TEST!
	
	- warning: Just a test. No parameters can be set yet!
     
     - author: NobodyNada
	*/
	public func fetchSites(
		_ parameters: [String:String] = [:],
		backoffBehavior: BackoffBehavior = .wait) throws -> APIResponse<Site> {
		
		
		var params = parameters
		params["site"] = ""
		
		return try performAPIRequest(
			"sites",
			params,
			backoffBehavior: backoffBehavior
		)
	}
    
    public func fetchSites(_ parameters: [String: String] = [:], backoffBehavior: BackoffBehavior = .wait, completionHandler: @escaping (APIResponse<Site>?, Error?) -> ()) {
        
        DispatchQueue(label: "fetchSitesQueue").async {
            var params = parameters
            params["site"] = ""
            
            do {
                let response: APIResponse<Site> = try self.performAPIRequest("sites", params, backoffBehavior: backoffBehavior)
                completionHandler(response, nil)
            } catch {
                completionHandler(nil, error)
            }
        }
    }
    
    
	
}
