FILE=/ks/wait-background.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done; bash ${FILE}
export ISTIO_VERSION=1.10.6
docker pull layotto/preview_server:latest
docker run -d -p 9080:8080 --name layotto-preview-server layotto/preview_server:latest
git clone https://github.com/layotto/istio.git

git clone https://github.com/LXPWing/preview-server-k8s-yml.git

curl -L https://istio.io/downloadIstio | TARGET_ARCH=x86_64 sh -

#rm -rf /root/istio/bin
#cp -r /root/istio-${ISTIO_VERSION}/bin /root/istio/bin

echo "export PATH=/root/istio-${ISTIO_VERSION}/bin:\$PATH" >> .bashrc
export PATH=/root/istio-${ISTIO_VERSION}/bin:$PATH
istioctl install --set profile=demo -y --manifests=/root/istio-${ISTIO_VERSION}/manifests --set .values.global.proxy.image="layotto/proxyv2:latest" --set meshConfig.defaultConfig.binaryPath="/usr/local/bin/mosn"