let
  d = import ./ssh.nix;
in
{
  haproxy = d;
}
