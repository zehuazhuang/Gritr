



import SwiftUI
import SwiftfulRouting
import _PhotosUI_SwiftUI

struct AmbientEdit: View {
    @State private var picpokName: String = SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].aidrivenName
    @FocusState private var knowitchbField: Field?
    enum Field: Hashable {
        case picpokName
    }
    @Environment(\.router) var router
    @State private var avatarImage: UIImage?      // 存储选中的头像
        @State private var showImagePicker = false    // 控制是否显示相册
        @State private var selectedItem: PhotosPickerItem? // PHPicker 选中的 item
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
                    Text("Edit")
                        .font(.system(size: 36, weight: .black))
                        .foregroundColor(.white)
                        .kerning(1.2)
                    Spacer()
                    Spacer().frame(width: 40, height: 40)
                }
                .padding(.bottom,23)
               
                VStack(spacing:16){
                        Spacer().frame(height: 30)
                        ZStack(alignment:.bottomTrailing){
                            Group {
                                                      if let avatarImage {
                                                          Image(uiImage: avatarImage)
                                                              .resizable()
                                                      } else {
                                                          if let rdinatImg = UIImage(contentsOfFile: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].strumAvatar) {
                                                                  Image(uiImage: rdinatImg)
                                                                      .resizable()
                                                                     
                                                              } else {
                                                                  Image(SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].strumAvatar)
                                                                      .resizable()
                                                                     
                                                              }
                                                          
//                                                          Image()
//                                                              .resizable()
                                                      }
                                                  }
                                                  .frame(width: 115, height: 115)
                                                  .clipShape(Circle())
                                                  .overlay(
                                                      Circle()
                                                          .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                                                  )
                                                  .onTapGesture {
                                                      showImagePicker = true
                                                  }
                            Image("gritr_shanga")
                                .resizable()
                                .frame(width: 34, height: 34)
                        }
                        Spacer().frame(height: 50)
                        HStack{
                            Text("Name:")
                                                    .font(.system(size: 18, weight: .bold))
                                                    .foregroundColor(.white)
                            Spacer()
                        }
                        ZStack(alignment: .leading) {
                            if picpokName.isEmpty {
                                Text("Enter username")
                                    .foregroundColor(.white.opacity(0.5))
                                    .padding(.leading, 16)
                            }
                            
                            TextField("", text: $picpokName)
                                .foregroundColor(.white)
                                .padding(16)
                                .focused($knowitchbField, equals: .picpokName)

                        }
                        .frame(height: 52)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(20)
                        .padding(.bottom,14)
                
                        Spacer()
                        Button(action: {
                           
                            
                            SustainStorge.shared.updaNaturalUser(by: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId) { user in
                                user.aidrivenName = picpokName
                                if let avatarImage {
                                   
                                    let timeStamp = Int(Date().timeIntervalSince1970)
                                    let fileName = "avatar_\(timeStamp).jpg"
                                    if let savedURL = saveImageToLocal(avatarImage, fileName: fileName) {
                                        user.strumAvatar = savedURL.path
                                        print("头像路径：\(user.strumAvatar)")
                                    }
                                    
                                 
                                }
                                
                            }
                            
                            
                            
                                       }) {
                                           Text("Save")
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
                                       .padding(.bottom,6)
                    }
               
            }.padding(.horizontal,16)
        }.onTapGesture {
            knowitchbField = nil
        }.photosPicker(isPresented: $showImagePicker, selection: $selectedItem, matching: .images)
            .onChange(of: selectedItem) { newItem in
                if let newItem {
                    Task {
                        if let data = try? await newItem.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            avatarImage = uiImage
                        }
                    }
                }
            }
    }
    func saveImageToLocal(_ image: UIImage, fileName: String) -> URL? {
        // 获取文档目录
        guard let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        let fileURL = documents.appendingPathComponent(fileName)
        
        // 将 UIImage 转成 JPEG 数据
        guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }
        
        do {
            try data.write(to: fileURL)
            print("图片已保存到：\(fileURL)")
            return fileURL
        } catch {
            print("保存图片失败：\(error)")
            return nil
        }
    }
}

