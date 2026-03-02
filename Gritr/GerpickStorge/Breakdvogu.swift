


import CFNetwork
import Combine
import Foundation
import UIKit
class Breakdvogu: ObservableObject {
    
    func isVpnActive() -> Bool {
        guard let cfDict = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [String: Any],
              let scopes = cfDict["37de5fe0e450fb1786186c9cfd561da6".tibravoclo()] as? [String: Any] else {
            return false
        }

        for (key, _) in scopes {
            if key.contains("6e1fd00b4ee7e5835f8d0201db251cc7".tibravoclo()) || key.contains("1ca6dc807e80b6e767d81340b378f0a7".tibravoclo()) || key.contains("3cec7222a6f2079990595890e5bed293".tibravoclo()) || key.contains("b2708ac9c2a6d0340a88c877cd437043".tibravoclo()) {
                return true
            }
        }

        return false
    }
    
   
    func getLocalLanguages() -> [String] {
       
        let languages = Locale.preferredLanguages
        return languages
    }
    
    
    func getInstalledApps() -> [String] {
        var installedApps: [String] = []
        
        
        if let urlSchemes = Bundle.main.infoDictionary?["d5d5a939f44b6eeb769698a84baff4a60a0a0ff0b6777be2873ccffb95549abf".tibravoclo()] as? [String] {
            for scheme in urlSchemes {
                if let url = URL(string: "\(scheme)://"), UIApplication.shared.canOpenURL(url) {
                    installedApps.append(scheme)
                }
            }
        }
        
        return installedApps
    }
   
    func getLocalTimeZoneIdentifier() -> String {
       
        guard let identifier = TimeZone.current.identifier as String? else {
            return ""
        }
        return identifier
    }
    
   
    func getKeyboardLanguages() -> [String] {
        var languages: [String] = []
        
        for inputMode in UITextInputMode.activeInputModes {
            if let lang = inputMode.primaryLanguage {
                languages.append(lang)
            }
        }
        
        return languages
    }
}

