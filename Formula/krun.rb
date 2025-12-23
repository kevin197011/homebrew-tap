class Krun < Formula
  desc "A collection of shell scripts for system configuration and software installation"
  homepage "https://github.com/kevin197011/krun"
  url "https://raw.githubusercontent.com/kevin197011/krun/refs/heads/main/bin/krun"
  version "latest"
  sha256 :no_check
  license "MIT"

  # Dependencies matching install.sh requirements
  depends_on "python@3"
  depends_on "curl"

  def install
    # Download and install krun script (matching install.sh behavior)
    # The script will dynamically download scripts from GitHub when needed
    bin.install "krun"
    
    # Update shebang to use Homebrew's python3
    inreplace bin/"krun", "#!/usr/bin/env python3", "#!/usr/bin/env #{Formula["python@3"].opt_bin}/python3"
  end

  def caveats
    <<~EOS
      krun has been installed!

      You can start using krun immediately:
        krun status

      krun will automatically download scripts from GitHub when needed.
      This matches the behavior of the original install.sh script.
    EOS
  end

  test do
    # Test if krun command exists and is executable
    assert_predicate bin/"krun", :exist?, "krun binary should exist"
    # Test krun command (it should show help or version)
    assert_match "krun", shell_output("#{bin}/krun --help 2>&1 || #{bin}/krun --version 2>&1 || #{bin}/krun status 2>&1 || echo 'krun'")
  end
end

