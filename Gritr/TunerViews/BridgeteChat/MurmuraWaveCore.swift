import AVFAudio


final class MurmuraWaveCore: NSObject, AVAudioPlayerDelegate {

    static let shared = MurmuraWaveCore()

    private var player: AVAudioPlayer?
    private(set) var playingURL: URL?

    private override init() {
        super.init()
    }

    func play(url: URL) {
        
        if playingURL == url {
            stop()
        }

        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.playback, mode: .default)
            try session.setActive(true)

            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.prepareToPlay()
            player?.play()

            playingURL = url
        } catch {
            print(error.localizedDescription)
        }
    }

    func stop() {
        player?.stop()
        player = nil
        playingURL = nil
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playingURL = nil
    }

    var isPlaying: Bool {
        player?.isPlaying == true
    }
}
