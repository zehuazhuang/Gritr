import Foundation
import AVFAudio
import Combine
final class AudioRecorderManager: ObservableObject {

    private var recorder: AVAudioRecorder?
    private var timer: Timer?

    private(set) var currentFileURL: URL?

    @Published private(set) var isRecording: Bool = false
    @Published private(set) var recordDuration: Int = 0

    func startRecording() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker])
            try session.setActive(true)
        } catch {
            print(error.localizedDescription)
            return
        }

        let fileName = UUID().uuidString + ".m4a"
        let url = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)

        currentFileURL = url
        recordDuration = 0

        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            recorder = try AVAudioRecorder(url: url, settings: settings)
            recorder?.prepareToRecord()
            recorder?.record()
            isRecording = true

            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                self?.recordDuration += 1
            }

        } catch {
            print(error.localizedDescription)
        }
    }

    func stopRecording() -> (url: URL, duration: Int)? {
        recorder?.stop()
        recorder = nil
        isRecording = false

        timer?.invalidate()
        timer = nil

        guard let url = currentFileURL else { return nil }
        return (url, recordDuration)
    }
}
