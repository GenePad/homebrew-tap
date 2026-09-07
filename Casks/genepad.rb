cask "genepad" do
  version "0.6.9"
  sha256 "7aa5b5cce31bc8e4b37494cb6fd99379e26eb16f056c9af97b1367e250888769"

  url "https://genepad.cn/release/mac/macos-app.zip",
      verified: "genepad.cn"

  name "GenePad"
  desc "DNA sequence viewer and editor"
  homepage "https://genepad.cn"

  # 应用带内置 updater(tauri-plugin-updater)原地自更新;声明后 brew outdated/upgrade
  # 不再用 cask 钉死的旧 zip 覆盖自更新版本(--greedy 除外),version/sha256 bump 照旧
  auto_updates true

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
