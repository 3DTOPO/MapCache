//
//  ZoomableTile.swift
//  MapCache
//
//  Created by merlos on 26/09/2020.
//

import Foundation
import MapKit

///
/// Specifies a single tile and area of the tile that should upscaled
///
struct ZoomableTile {
    
    /// Path for the maximumZ supported by the tile server from wich this zoomable tile can be extracted
    let path: MKTileOverlayPath
    
    /// Rectangle area ocupied by this tile
    let rect: MKMapRect
    
    /// Delta from given tile z to desired tile z
    /// Example: maximum zoom supported by the tile set is 20 and the desired tile is in zoom level 24, the delta is 4
    let overZoom: Zoom
}

