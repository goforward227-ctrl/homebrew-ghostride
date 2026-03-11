cask "ghostride" do
  version "1.0.0"
  sha256 "a7082044437a2507ecad48b8d7eca6faa78262a7c8d1268f097906db029bfbd4"

  url "https://github.com/goforward227-ctrl/ghostride/releases/download/v#{version}/Ghostride-#{version}-arm64.zip"
  name "Ghostride"
  desc "Menu bar app for monitoring and approving Claude Code sessions"
  homepage "https://github.com/goforward227-ctrl/ghostride"

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  app "Ghostride.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Ghostride.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ghostride",
    "~/Library/Preferences/com.ghostride.app.plist",
  ]
end
