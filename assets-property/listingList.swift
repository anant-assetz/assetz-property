//
//  listingList.swift
//  assetz-property
//
//  Created by Anant on 13/07/2016.
//  Copyright © 2016 Anant. All rights reserved.
//
//
//  listinList.swift
//  JsonDownload
//
//  Created by Anant on 29/06/2016.
//  Copyright © 2016 Anant. All rights reserved.
//

import Foundation
import UIKit

class listingList: UITableViewCell{
    
    //@IBOutlet weak var propCellImage: UIImageView!
    @IBOutlet weak var propCellImage2: UIImageView!
    // @IBOutlet weak var propCellName: UILabel!
    @IBOutlet weak var propCellName2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // propCellImage.layer.cornerRadius = 5.0
        // propCellImage.clipsToBounds = true
        
    }
    
    func configureCell2(property: Property) {
        //propCellImage2.image = property.imagePath
        propCellName2.text = property.propDesc
        //propCellImage2.image = property.imagePath
    }

}
