class HbPythonBootstrap < Formula
	desc "hb-python-bootstrap"
	homepage "https://github.com/"
	url "http://san.customer.hb/repos.hb/macos/hb-python-bootstrap.tar.gz"
	sha256 "dbb3dde0182335a087454ca8c6e355720d27a7144defa2f5bd5cae28256c9ce8"
	version "0.0.1"
	revision 20
  
	depends_on "curl"

	bottle :unneeded

	def sitepackages34
		prefix/"lib/python3.4/site-packages"
	end

	def sitepackages36
		prefix/"lib/python3.6/site-packages"
	end

	def sitepackages36live
		HOMEBREW_PREFIX/"lib/python3.6/site-packages"
	end

	def sitepackages37
		prefix/"lib/python3.7/site-packages"
	end

	def install
		lib.install "hb-python-bootstrap"
		libexec.install "sitecustomize.txt"

#		puts sitepackages36

		if Dir.exist?(HOMEBREW_PREFIX/"lib/python3.4/site-packages")
			sitepackages34.install_symlink libexec/"sitecustomize.txt"
		end

		if sitepackages36live.exist?
			sitepackages36.install_symlink libexec/"sitecustomize.txt" => "sitecustomize.py"
		end

		if Dir.exist?(HOMEBREW_PREFIX/"lib/python3.7/site-packages")
#			if File.exist?()
			sitepackages37.install_symlink libexec/"sitecustomize.txt"
		end
#		lib.install Dir["*"]
	end
  end
  