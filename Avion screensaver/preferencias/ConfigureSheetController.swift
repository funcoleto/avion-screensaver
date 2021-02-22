


import Cocoa

class ConfigureSheetController : NSObject {
    
    @IBOutlet var window: NSWindow!
    
    @IBOutlet weak var contador: NSTextField!

    @IBOutlet weak var btMas: NSButton!
    @IBOutlet weak var btMenos: NSButton!
    
    
    
    var valorLabel: CGFloat = CGFloat(1)
    
    override init() {
        super.init()
        let myBundle = Bundle(for: ConfigureSheetController.self)
        myBundle.loadNibNamed("ConfigureSheet", owner: self, topLevelObjects: nil)
        
        cargarValor()
        self.contador.stringValue = "\(self.valorLabel)"
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Do your UI init here!
       // canvasColorWell.color = Preferences.canvasColor.nsColor
    }

    @IBAction func subir(_ sender: NSButton) {
        var nume = valorLabel
        nume = valorLabel + 0.1
        valorLabel = nume
        self.contador.stringValue = "\(nume)"
        guardarValor()
    }
    
  
    @IBAction func bajar(_ sender: NSButton) {
        
        if(valorLabel > 0 ){
            
        
        
        
        var nume = valorLabel
        nume = valorLabel - 0.1
        valorLabel = nume
        self.contador.stringValue = "\(nume)"
        guardarValor()
        }else{
            valorLabel = 0
            self.contador.stringValue = "0"
            guardarValor()
        }
        
    }
    
    func cargarValor() {
        var ud = UserDefaults.standard
        var val = ud.float(forKey: "nube")
        self.valorLabel = CGFloat(val)
        
    }
    
    
    func guardarValor() {
        var ud = UserDefaults.standard
        ud.set(self.valorLabel, forKey: "nube")
        
    }
    
    
   
    @IBAction func closeConfigureSheet(_ sender: AnyObject) {
        // Remember to close anything else first
        NSColorPanel.shared.close()
        guardarValor()
        // Now close the sheet (this works on older macOS versions too)
        window?.sheetParent?.endSheet(window!)
        
        // Remember, you are still in memory at this point until you get killed by parent.
        // If your parent is System Preferences, you will remain in memory as long as System
        // Preferences is open. Reopening the sheet will just wake you up.
        //
        // An unfortunate side effect of this is that if your user updates to a new version with
        // System Preferences open, they will see weird things (ui from old version running
        // new code, etc), so tell them not to do that!
    }
    
    
    
    
}
