
import AVFoundation
import Photos

final class PluchdecaykPer {

    static func requestMicrophone(
        onAuthorized: @escaping () -> Void
    ) {
        let session = AVAudioSession.sharedInstance()

        switch session.recordPermission {
        case .granted:
            onAuthorized()

        case .denied:
            
            break

        case .undetermined:
            session.requestRecordPermission { granted in
                DispatchQueue.main.async {
                    if granted {
                        onAuthorized()
                    }
                }
            }

        @unknown default:
            break
        }
    }
    static func requestPhotoLibrary(
            onAuthorized: @escaping () -> Void
        ) {
            let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)

            switch status {
            case .authorized, .limited:
                onAuthorized()

            case .notDetermined:
                PHPhotoLibrary.requestAuthorization(for: .readWrite) { newStatus in
                    DispatchQueue.main.async {
                        if newStatus == .authorized || newStatus == .limited {
                            onAuthorized()
                        }
                    }
                }

            case .denied, .restricted:
                break

            @unknown default:
                break
            }
        }
}
