cask "nudge" do
  version "1.0.0"
  sha256 "1635c14dd2b3c3c3466033d79c3900e7329f7d92053accc1dc1214fe00ed6393"

  url "https://github.com/SagenKoder/nudge/releases/download/v#{version}/Nudge-#{version}.dmg"
  name "Nudge"
  desc "Window snapper with five shortcuts and no menu bar icon"
  homepage "https://github.com/SagenKoder/nudge"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Nudge.app"

  uninstall quit:       "com.sagenkoder.nudge",
            login_item: "Nudge"

  zap trash: "~/Library/Preferences/com.sagenkoder.nudge.plist"

  caveats <<~EOS
    Open Nudge once to grant the Accessibility permission it needs to move windows.
    It then starts at login by itself.
  EOS
end
