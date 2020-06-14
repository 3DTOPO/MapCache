//
//  MapCacheTests.swift
//  MapCache_Tests
//
//  Created by merlos on 23/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//
// https://github.com/Quick/Quick

import Quick
import Nimble
import MapCache
import MapKit
import Swifter

class MapCacheTests: QuickSpec {
    override func spec() {
        // setup a server
        let server = HttpServer()
        beforeSuite {
           let server = HttpServer()
           server["/ok/:path"] = { .ok(.text("\($0)"))}
            server["/error/:path"] = { _ in
                   return .notFound
            }
           do {
             try server.start(1980, forceIPv4: true)
             print("MapCacheTestServer:: started ( port = \(try server.port()) )")
           } catch {
             print("MapCacheTestServer:: server start error: \(error)")
           }
          }

        
        afterSuite {
            server.stop()
            print("MapCacheTestServer:: server stopped")
        }
        describe("MapCache") {
            let urlTemplate = "a{x}b{y}c{z}d{s}"
            var config = MapCacheConfig(withUrlTemplate: urlTemplate)
            config.subdomains = ["a"]
            let cache = MapCache(withConfig: config)
            let path = MKTileOverlayPath(x: 1, y: 2, z: 3, contentScaleFactor: 1.0)
            
            it("can create the tile url") {
                let url = cache.url(forTilePath: path)
                expect(url.absoluteString) == "a1b2c3da"
            }
            
            it("can generate the key for a path") {
                let key = cache.cacheKey(forPath: path)
                expect(key) == "\(urlTemplate)-1-2-3"
            }
            
            it("can generate the key for a path") {
                let key = cache.cacheKey(forPath: path)
                expect(key) == "\(urlTemplate)-1-2-3"
            }
            
            
            /*
            it("can do maths") {
                expect(2) == 2
            }
            
            it("can read") {
                //expect("number") == "string"
            }
            
            it("will eventually fail") {
                expect("time").toEventually( equal("time") )
            }
            
            context("these will pass") {
                
                it("can do maths") {
                    expect(23) == 23
                }
                
                it("can read") {
                    expect("🐮") == "🐮"
                }
                
                it("will eventually pass") {
                    var time = "passing"
                    
                    DispatchQueue.main.async {
                        time = "done"
                    }
                    
                    waitUntil { done in
                        Thread.sleep(forTimeInterval: 0.5)
                        expect(time) == "done"
                        
                        done()
                    }
                }
            }*/
        }
    }
}
