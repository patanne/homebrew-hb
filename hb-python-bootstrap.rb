class HbPythonBootstrap < Formula
	desc "hb-python-bootstrap"
	homepage "https://github.com/"
	url "http://san.customer.hb/repos.hb/macos/hb-python-bootstrap.tar.gz"
	sha256 "45284cde76cdd865082fb60c2b140dfda0490d4f75b601de2554486cf8499516"
	version "0.0.1"
	revision 3
  
	depends_on "curl"

	bottle :unneeded

	def install
		lib.install "hb-python-bootstrap"
#		lib.install Dir["*"]
	end
  end
  