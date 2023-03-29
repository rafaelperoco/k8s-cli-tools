#!/bin/bash
PROC_TYPE=`uname -m`
SYS_TYPE=`uname -s | tr '[:upper:]' '[:lower:]'`
cd ~
curl -OL https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
if [ -f ~/.zshrc ]; then
  echo 'export PATH=$PATH:~/bin' >> ~/.zshrc
  echo '[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases' >> ~/.zshrc
fi
if [ -f ~/.bashrc ]; then
  echo 'export PATH=$PATH:~/bin' >> ~/.bashrc
  echo '[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases' >> ~/.bashrc
fi

mkdir -p ~/bin
cd ~/bin

if [ -f ./kubectl ]; then
  echo "kubectl already exists"
else
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/$SYS_TYPE/$PROC_TYPE/kubectl"
chmod +x ./kubectl
fi

if [ -f ./kubectx ]; then
  echo "kubectx already exists"
else
curl -LO https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubectx_v0.9.4_${SYS_TYPE}_${PROC_TYPE}.tar.gz
tar -xzf kubectx_v0.9.4_${SYS_TYPE}_${PROC_TYPE}.tar.gz
rm kubectx_v0.9.4_${SYS_TYPE}_${PROC_TYPE}.tar.gz
chmod +x ./kubectx
fi
if [ -f ./kubens ]; then
  echo "kubens already exists"
else
curl -LO https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubens_v0.9.4_${SYS_TYPE}_${PROC_TYPE}.tar.gz
tar -xzf kubens_v0.9.4_${SYS_TYPE}_${PROC_TYPE}.tar.gz
rm kubens_v0.9.4_${SYS_TYPE}_${PROC_TYPE}.tar.gz
chmod +x ./kubens
fi

if [ -f ./helm ]; then
  echo "helm already exists"
else
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
rm get_helm.sh
fi

if [ -f ./k9s ]; then
  echo "k9s already exists"
else
curl -LO https://github.com/derailed/k9s/releases/download/v0.27.3/k9s_${SYS_TYPE}_${PROC_TYPE}.tar.gz
tar -xzf k9s_${SYS_TYPE}_${PROC_TYPE}.tar.gz
rm k9s_${SYS_TYPE}_${PROC_TYPE}.tar.gz
chmod +x ./k9s
fi

if [ -f ./kind ]; then
  echo "kind already exists"
else
curl -OL https://github.com/kubernetes-sigs/kind/releases/download/v0.17.0/kind-${SYS_TYPE}-${PROC_TYPE}
chmod +x ./kind-${SYS_TYPE}-${PROC_TYPE}
mv ./kind-${SYS_TYPE}-${PROC_TYPE} ./kind
fi