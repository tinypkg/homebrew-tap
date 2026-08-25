# typed: false
# frozen_string_literal: true

cask "go-pkg" do
  arch arm: "arm64", intel: "amd64"

  version "1.27.0"
  sha256 arm:   "59dba31a035ddd56268904b353177053dbf5c64e893b15902733e5128ad46cbd",
         intel: "19520f0a374f1a4090866b636cf40428c28f760d20b623d4ad71ecb36157a57f"

  # Official download URL from go.dev
  url "https://go.dev/dl/go#{version}.darwin-#{arch}.pkg"
  name "Go"
  desc "Go programming language (official pkg installer)"
  homepage "https://go.dev/"

  # Automatically check for new stable releases from official API
  livecheck do
    url "https://go.dev/dl/?mode=json"
    strategy :json do |json|
      json.filter_map do |release|
        next unless release["stable"] == true

        release["version"]&.delete_prefix("go")
      end
    end
  end

  pkg "go#{version}.darwin-#{arch}.pkg"

  # Post-installation: create symlinks in Homebrew's bin directory
  postflight do
    # Get all Go binaries (go, gofmt, etc.)
    go_bin_dir = "/usr/local/go/bin"
    next unless Dir.exist?(go_bin_dir)

    Dir.children(go_bin_dir).each do |binary|
      source = "#{go_bin_dir}/#{binary}"
      target = "#{HOMEBREW_PREFIX}/bin/#{binary}"

      # Create symbolic link for each binary
      system_command "/bin/ln",
                     args: ["-sf", source, target],
                     sudo: false
    end
  end

  # Pre-uninstall: clean up symbolic links before removing Go
  uninstall_preflight do
    go_bin_dir = "/usr/local/go/bin"
    next unless Dir.exist?(go_bin_dir)

    Dir.children(go_bin_dir).each do |binary|
      target = "#{HOMEBREW_PREFIX}/bin/#{binary}"
      # Only remove if it's a symlink pointing to Go installation
      if File.symlink?(target) && File.readlink(target).start_with?("/usr/local/go/")
        File.unlink(target)
      end
    end
  end

  uninstall pkgutil: "com.googlecode.go"

  caveats <<~EOS
    Go has been installed via the official macOS pkg installer.

    Installation details:
      - Go root: /usr/local/go
      - Binaries: #{HOMEBREW_PREFIX}/bin/go, gofmt
      - Documentation: /usr/local/go/doc

    Symbolic links have been created automatically.
    Open a new terminal to start using Go.
  EOS
end
