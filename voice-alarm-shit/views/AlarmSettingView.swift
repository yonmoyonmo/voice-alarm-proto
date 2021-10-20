//
//  AlarmSettingView.swift
//  voice-alarm-shit
//
//  Created by yonmo on 2021/10/20.
//

import SwiftUI

struct AlarmSettingView: View {
    @ObservedObject var audioRecorder: AudioRecorder
    
    @State var title: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("alarm title", text:$title).padding().textFieldStyle(.roundedBorder)
                if audioRecorder.recording == false {
                    Button(action: {
                        self.audioRecorder.startRecording(title: "\(title)")
                    }) {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    }
                }else{
                    Button(action: {
                        self.audioRecorder.stopRecording()
                    }) {
                        Image(systemName: "stop.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    }
                }
                RecordingsList(audioRecorder: audioRecorder)
            }
            .navigationBarTitle("set voice alarm")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct AlarmSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmSettingView(audioRecorder: AudioRecorder())
    }
}
