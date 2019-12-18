# https://docs.ceph.com/docs/master/install/manual-deployment/
{
  # ceph-authtool --create-keyring /tmp/ceph.mon.keyring --gen-key -n mon. --cap mon 'allow *'
  demo = {
    deployment.keys.ceph_mon_keyring.text =
      builtins.readFile ./secrets/ceph_mon_keyring;
    deployment.keys.ceph_mon_keyring.user = "ceph";
    #deployment.keys.ceph_mon_keyring.group  = "ceph";
    deployment.keys.ceph_mon_keyring.permissions = "0600";

    users.groups.keys.members = [ "ceph" ];
  };
}

