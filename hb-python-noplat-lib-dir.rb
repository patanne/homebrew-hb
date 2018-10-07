class HbPythonNoplatLibDir < Formula
	desc "hb-python-noplat-lib, the directory version"
	homepage "https://github.com/"
	url "http://san.customer.hb/repos.hb/macos/homebrew/packages/hb-python-noplat-lib-0.0.0-dir.tar.gz"
	sha256 "66416e8d75d291c4d798f2ef93647470c4ec1ad235321a698ed3bd99f0db32ed"
	version "0.0.0"
	revision 1
  
	depends_on "curl"
	depends_on "python37"

	bottle :unneeded

	def install
		lib.install "hb-python-noplat-lib-0.0.0"
	end
  end
  