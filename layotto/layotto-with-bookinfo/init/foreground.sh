FILE=/ks/wait-background.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done; bash ${FILE}
export ISTIO_VERSION=1.10.6
git clone https://github.com/LXPWing/layotto.git

git clone https://github.com/LXPWing/preview-server-k8s-yml.git

curl -L https://istio.io/downloadIstio | TARGET_ARCH=x86_64 sh -

echo "export PATH=/root/istio-${ISTIO_VERSION}/bin:\$PATH" >> .bashrc
export PATH=/root/istio-${ISTIO_VERSION}/bin:$PATH
istioctl install --set profile=demo -y --manifests=/root/istio-${ISTIO_VERSION}/manifests --set .values.global.proxy.image="layotto/proxyv2:latest" --set meshConfig.defaultConfig.binaryPath="/usr/local/bin/mosn"