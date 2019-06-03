//
//  String+MapCacheSpecs.swift
//  MapCache_Tests
//
//  Created by merlos on 02/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import MapCache


class String_DiskCacheSpecs: QuickSpec {
    override func spec() {
        describe("String") {
            it("can calculate MD5") {
                let hello = "Hello"
                expect(hello.toMD5()) == "8b1a9953c4611296a827abf8c47804d7"
            }
            it("can escape file name") {
                let url = "http://xuz.com/c?a=1&b=2&c=1%20_"
                print(url.escapedFilename())
            }
            
            it("can calculate MD5 filename") {
                let filename = "hello.pdf" // => MD5(hello.pdf) =  205bae5d34f9013544c01a6cf95cd7dd
                expect(filename.MD5Filename()) == "205bae5d34f9013544c01a6cf95cd7dd.pdf"
            }
        }
    }
}
