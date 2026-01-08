import SwiftUI
import SwiftfulRouting
import PhotosUI

func convertVideoToMP4(sourceURL: URL, completion: @escaping (URL?) -> Void) {
    let asset = AVAsset(url: sourceURL)
    guard let export = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetHighestQuality) else {
        completion(nil)
        return
    }

    let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let outputURL = docURL.appendingPathComponent(UUID().uuidString).appendingPathExtension("mp4")

    export.outputURL = outputURL
    export.outputFileType = .mp4
    export.shouldOptimizeForNetworkUse = true

    export.exportAsynchronously {
        switch export.status {
        case .completed:
            DispatchQueue.main.async { completion(outputURL) }
        default:
            print("视频转码失败:", export.error ?? "unknown")
            DispatchQueue.main.async { completion(nil) }
        }
    }
}

func saveVideoToDocuments(from sourceURL: URL) -> URL? {
    let fileManager = FileManager.default
    let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    let targetURL = documentsURL.appendingPathComponent(UUID().uuidString).appendingPathExtension("mp4")

    do {
        if fileManager.fileExists(atPath: targetURL.path) {
            try fileManager.removeItem(at: targetURL)
        }
        try fileManager.copyItem(at: sourceURL, to: targetURL)
        return targetURL
    } catch {
        print("保存视频失败:", error)
        return nil
    }
}

extension URL {

    func vdoSnapShot(at sec: Double = 0.1) -> UIImage? {
        let vAsset = AVAsset(url: self)
        let vGenerator = AVAssetImageGenerator(asset: vAsset)
        vGenerator.appliesPreferredTrackTransform = true

        let vTime = CMTime(seconds: sec, preferredTimescale: 600)

        do {
            let vCGImg = try vGenerator.copyCGImage(at: vTime, actualTime: nil)
            return UIImage(cgImage: vCGImg)
        } catch {
            return nil
        }
    }
}


extension UIImage {

    func stashTempJPG(tag: String = UUID().uuidString) -> URL? {
        let tempURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("\(tag).jpg")

        guard let jData = jpegData(compressionQuality: 0.8) else { return nil }

        do {
            try jData.write(to: tempURL)
            return tempURL
        } catch {
            return nil
        }
    }
}

struct VdoGrabber: UIViewControllerRepresentable {

    var onGrab: (URL) -> Void

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var cfg = PHPickerConfiguration()
        cfg.filter = .videos
        cfg.selectionLimit = 1

        let pickerCtrl = PHPickerViewController(configuration: cfg)
        pickerCtrl.delegate = context.coordinator
        return pickerCtrl
    }

    func updateUIViewController(_ uiVC: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> GrabCoordinator {
        GrabCoordinator(onGrab: onGrab)
    }

    class GrabCoordinator: NSObject, PHPickerViewControllerDelegate {

        let onGrab: (URL) -> Void

        init(onGrab: @escaping (URL) -> Void) {
            self.onGrab = onGrab
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let itemProv = results.first?.itemProvider,
                  itemProv.hasItemConformingToTypeIdentifier("public.movie") else { return }

            itemProv.loadItem(forTypeIdentifier: "public.movie", options: nil) { item, error in
                if let url = item as? URL {
                    let dstURL = FileManager.default.temporaryDirectory
                        .appendingPathComponent(UUID().uuidString + ".mp4")
                    do {
                        try FileManager.default.copyItem(at: url, to: dstURL)
                        DispatchQueue.main.async {
                            self.onGrab(dstURL)
                        }
                    } catch {
                        print("error: \(error)")
                    }
                }
            }
        }
    }
}

    struct FretwearUpload: View {
        @State private var buckerName: String = ""
        @State private var volumeContent: String = ""
        @FocusState private var ballendField: Field?
        enum Field: Hashable {
            case buckerName, volumeContent
        }
        @Environment(\.router) var router
        @State private var showPicker = false
        @State private var fingepImg: String?
        @State private var utjumboVid: String = ""
        let onBarrech : () -> Void
        var body: some View {
            ZStack{
                Image("gritr_backg")
                                .resizable()
                                .frame(maxWidth: .infinity,maxHeight: .infinity)
                                .ignoresSafeArea()
                
                    VStack{
                        HStack{
                            Button(action: {
                                router.dismissScreen()
                                            }) {
                                                Image("gritr_back")
                                                    .resizable()
                                                    .frame(width: 8,height: 16)
                                                    .frame(width: 40, height: 40)
                                                    
                                            }
                                            .background(
                                                .white.opacity(0.1)
                                            )
                                            .clipShape(Circle())
                            Spacer()
                            Text("Upload")
                                .font(.system(size: 36, weight: .black))
                                .foregroundColor(.white)
                                .kerning(1.2)
                            Spacer()
                            Spacer().frame(width: 40, height: 40)
                            
                           
                        }
                        ScrollView{
                            VStack(alignment:.leading,spacing: 16){
                                Spacer().frame( height: 30)
                                Text("Video:")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                                ZStack() {
                                    if let fingepImg,
                                       let uiImg = UIImage(contentsOfFile: fingepImg) {
                                        Image(uiImage: uiImg)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(height: 240)
                                            .frame(maxWidth: .infinity)
                                            .clipped()
                                    }
                                    Button(action: {
                                        PluchdecaykPer.requestPhotoLibrary {
                                            showPicker = true
                                                    }
                                                   }) {
                                                       Image("gritr_baiadd")
                                                                       .resizable()
                                                                       .frame(width: 20, height: 20)
                                                           .frame(width: 60, height: 60)
                                                           
                                                   }
                                                   .background(
                                                    Color.white.opacity(0.2)
                                                   )
                                                   .clipShape(Circle())
                                                   .sheet(isPresented: $showPicker) {
                                                       VdoGrabber { videoURL in
                                                           // 转码为 mp4
                                                           convertVideoToMP4(sourceURL: videoURL) { mp4URL in
                                                               guard let mp4URL = mp4URL else { return }
                                                               utjumboVid = mp4URL.path

                                                               // 生成缩略图
                                                               if let nchordImage = mp4URL.vdoSnapShot(),
                                                                  let progreURL = nchordImage.stashTempJPG() {
                                                                   fingepImg = progreURL.path
                                                               }
                                                           }
                                                       }
                                                           }
                                    
                                  
                                                  
                                    
                                }
                                .frame(height: 240)
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(20)
                                .padding(.bottom,14)
                                Text("Copywriting:")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                                ZStack(alignment: .topLeading) {
                                    if volumeContent.isEmpty {
                                        Text("Enter...")
                                            .foregroundColor(.white.opacity(0.5))
                                            .padding(.leading, 16)
                                            .padding(.top, 12)
                                    }
                                    
                                    TextEditor(text: $volumeContent)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.top, 8)
                                        .frame(height: 149)
                                        .background(Color.clear)
                                        .focused($ballendField, equals: .volumeContent)
                                        .scrollContentBackground(.hidden)
                                }
                                .frame(height: 149)
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(20)
                                .padding(.bottom,14)
                                
                                Spacer()
                                Button(action: {
                                    
                                    if(utjumboVid != "" && volumeContent != ""){
                                        SustainStorge.shared.addBluegrasPost(
                                            AvelguitarPosts(
                                                alternatPostId: SustainStorge.shared.vibratoPosts.count+1,
                                                wnstrokeWena: volumeContent,
                                                prebendImg: fingepImg ?? "",
                                                staccatoDiz: utjumboVid,
                                                gerstyleUserId: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId,
                                                harmonicLikes: []
                                            )
                                        )
                                    }
                                    router.dismissScreen()
                                    onBarrech()
                                    ToastManager.shared.show("success.")
                                 
                                }) {
                                    Text("Upload")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(.black)
                                        .frame(height: 50)
                                        .frame(maxWidth: .infinity)
                                }
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(stops: [
                                            .init(color: Color(red: 255/255, green: 102/255, blue: 222/255), location: 0.0),
                                            .init(color: Color(red: 255/255, green: 203/255, blue: 125/255), location: 0.3455),
                                            .init(color: Color(red: 171/255, green: 254/255, blue: 255/255), location: 0.6389),
                                            .init(color: Color(red: 115/255, green: 211/255, blue: 255/255), location: 1.0)
                                        ]),
                                        startPoint: .trailing,
                                        endPoint: .leading
                                    )
                                )
                                .cornerRadius(60)
                                .padding(.bottom,35)
                                
                            }.frame(maxWidth: .infinity,alignment: .leading)
                        }
                    }.padding(.horizontal,16)
              
            }.onTapGesture {
                ballendField = nil
            }
        }
    }
