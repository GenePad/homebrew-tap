cask "genepad" do
  version "0.6.4"
  sha256 "598ac12fbcd9fe1e4b43452b08faf110149444eb2079c955c1d44ecb47336b0e"

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
