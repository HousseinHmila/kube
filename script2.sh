# Step 4: Initialize Cluster with kubeadm (Only master node)

sudo kubeadm init --control-plane-endpoint="${PUBLIC_IP}:6443" --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Step 5: Install Network Addon (flannel) (master node)
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

alias k=kubectl
k get node
