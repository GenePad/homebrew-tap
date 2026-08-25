cask "genepad" do
  version "0.6.7"
  sha256 "2914f121789c8b33fae469542ac48ec5299bd079d724e6f900f2d85ea1bd9628"

  url "https://genepad.cn/release/mac/macos-app.zip",
      verified: "genepad.cn"

  name "GenePad"
  desc "DNA sequence viewer and editor"
  homepage "https://genepad.cn"

  livecheck do
    url "https://genepad.cn/update.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on arch: :arm64

  app "GenePad.app"

  zap trash: [
    "~/Library/Application Support/com.genepad.desktop",
    "~/Library/Preferences/com.genepad.desktop.plist",
    "~/Library/Caches/com.genepad.desktop",
    "~/Library/WebKit/com.genepad.desktop",
    "~/Library/Saved Application State/com.genepad.desktop.savedState",
  ]
end
