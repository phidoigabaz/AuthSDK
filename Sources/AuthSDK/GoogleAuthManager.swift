//
//  File.swift
//  AuthSDK
//
//  Created by MobileDev@ on 2/14/25.
//

import Foundation
import GoogleSignIn

public class GoogleAuthManager {
    
    public init() {}

    public func signIn(presentingViewController: UIViewController, completion: @escaping (GIDGoogleUser?, Error?) -> Void) {
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
            completion(signInResult?.user, error)
        }
    }

    public func signOut() {
        GIDSignIn.sharedInstance.signOut()
    }

    public func getCurrentUser() -> GIDGoogleUser? {
        return GIDSignIn.sharedInstance.currentUser
    }
}
