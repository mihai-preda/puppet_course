# create a swap file
class profile::swap_file {
  swap_file::files { '5GB Swap':
    ensure       => present,
    swapfile     => '/mnt/swap',
    swapfilesize => '4GB',
  }
}
