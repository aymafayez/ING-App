//
//  Mocks.swift
//  ING APPTests
//
//  Created by Guest2 on 12/8/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

class mockURLSession: URLSession {
    var lastURL: URL!
    var nextDataTask = MockURLSessionDataTask()
    var nextData: Data?
    var nextError: URLError?
    var nextResponse: URLResponse?
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastURL = request.url
        completionHandler(nextData, nextResponse, nextError)
        return nextDataTask
    }
}


class MockURLSessionDataTask: URLSessionDataTask{
    var resumeIsCalled: Bool = false
    override func resume() {
        resumeIsCalled = true
    }
}
