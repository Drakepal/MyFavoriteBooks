//
//  PHPickerViewController.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 10/3/22.
//

import PhotosUI
import SwiftUI

extension PHPickerViewController {
  struct View {
    @Binding var image: Image?
  }
}

extension PHPickerViewController.View: UIViewControllerRepresentable {
  func makeCoordinator() -> some PHPickerViewControllerDelegate {
    PHPickerViewController.Delegate(image: $image)
  }

  func makeUIViewController(context: Context) -> PHPickerViewController {
    let picker = PHPickerViewController( configuration: .init() )
    picker.delegate = context.coordinator
    return picker
  }

  func updateUIViewController(_: UIViewControllerType, context _: Context) { }
}

extension PHPickerViewController.Delegate: PHPickerViewControllerDelegate {
  func picker(
    _ picker: PHPickerViewController,
    didFinishPicking results: [PHPickerResult]
  ) {
    results.first?.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
      DispatchQueue.main.async {
        if let uiImage = image as? UIImage {
          self.image = Image(uiImage: uiImage)
        }
      }
    }

    picker.dismiss(animated: true)
  }
}

private extension PHPickerViewController {
  final class Delegate {
    init(image: Binding<Image?>) {
      _image = image
    }

    @Binding var image: Image?
  }
}
