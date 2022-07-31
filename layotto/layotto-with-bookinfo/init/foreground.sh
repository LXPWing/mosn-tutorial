FILE=/ks/wait-background.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done; bash ${FILE}
docker pull layotto/preview_server:latest
docker run -d -p 9080:8080 --name layotto-preview-server layotto/preview_server:latest
git clone https://github.com/layotto/istio.git
ls
echo "export PATH=/root/istio/bin:\$PATH" >> .bashrc
export PATH=/root/istio/bin:$PATH
istioctl install --set profile=demo -y --manifests=/root/istio/manifests --set .values.global.proxy.image="layotto/proxyv2:latest" --set meshConfig.defaultConfig.binaryPath="/usr/local/bin/mosn"