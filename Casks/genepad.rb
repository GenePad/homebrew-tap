cask "genepad" do
  version "0.7.1"
  sha256 "fbeb5f176d3b32eaa95f3999067f2316a0aec1a4a9c00a0c40b1c90228a98e80"

  # 与应用内 updater / 官网一键脚本共用同一份 .app.tar.gz（同文件同哈希）；
  # 0.7.1 起 .app.zip 停产（macOS 渠道精简为 dmg + .app.tar.gz）
  url "https://genepad.cn/release/mac/GenePad_#{version}_Darwin_arm64.app.tar.gz",
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
