//
//  IntentHandler.swift
//  Siri Intents Extension
//
//  Created by Adrien Maranville on 7/15/17.
//  Copyright © 2017 Adrien Maranville. All rights reserved.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"

class IntentHandler: INExtension, INSendMessageIntentHandling {
    
    func resolveContent(forSendMessage intent: INSendMessageIntent, with completion: @escaping (INStringResolutionResult) -> Swift.Void) {
        if let content = intent.content {
            print("Content: \(content)")
            let response = INStringResolutionResult.success(with: content)
            completion(response)
        } else {
            let response = INStringResolutionResult.needsValue()
            completion(response)
        }
    }
    func handle(sendMessage intent: INSendMessageIntent, completion: @escaping (INSendMessageIntentResponse) -> Swift.Void) {
        
    }
    
    func confirm(sendMessage intent: INSendMessageIntent, completion: @escaping (INSendMessageIntentResponse) -> Swift.Void) {
        
        let isLoggedIn = true
        if isLoggedIn {
            completion(INSendMessageIntentResponse(code: .success, userActivity: nil))
        } else {
            completion(INSendMessageIntentResponse(code: .failureRequiringAppLaunch, userActivity: nil))
        }
        
    }

    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}

