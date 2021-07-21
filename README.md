yc compute instance create --name reddit-app --hostname reddit-app --memory=4 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --metadata serial-port-enable=1 --metadata-from-file user-data=./metadata.yaml --ssh-key ~/.ssh/id_rsa.pub

testapp_IP = 130.193.43.80
testapp_port = 9292

testapp_IP = 130.193.49.61
testapp_port = 9292
