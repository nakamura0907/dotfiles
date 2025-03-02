source "qemu" "debian-bookworm" {
  # required
  iso_url      = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.9.0-amd64-netinst.iso"
  iso_checksum = "sha512:9ebe405c3404a005ce926e483bc6c6841b405c4d85e0c8a7b1707a7fe4957c617ae44bd807a57ec3e5c2d3e99f2101dfb26ef36b3720896906bdc3aaeec4cd80"

  ssh_username = "root"
  ssh_password = "password"

  # Qemu Specific Configuration
  # accelerator = "kvm"
  accelerator = "tcg"
  headless    = true

  # Http directory configuration
  http_directory = "http"
}

build {
  sources = ["source.qemu.debian-bookworm"]
}
