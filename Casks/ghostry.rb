cask "ghostry" do
  version "1.1.0"
  sha256 "24afd9f1b27a64d143f14b5213af0df7b85474921524292ca10fed231548538b"

  url "https://github.com/goforward227-ctrl/ghostry/releases/download/v#{version}/Ghostry.zip"
  name "Ghostry"
  desc "Menu bar app for monitoring and approving Claude Code sessions"
  homepage "https://github.com/goforward227-ctrl/ghostry"

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  app "Ghostry.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Ghostry.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ghostry",
    "~/Library/Preferences/com.ghostry.app.plist",
  ]
end
