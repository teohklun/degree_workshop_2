mkdir -p ~/osrm/maps && cd ~/osrm/maps
wget http://download.geofabrik.de/asia/malaysia-singapore-brunei-latest.osm.pbf
sudo docker pull osrm/osrm-backend
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo docker pull osrm/osrm-backend
ls
sudo docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-extract -p /opt/car.lua /data/malaysia-singapore-brunei-latest.osm.pbf
ls
sudo docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-contract  /data/malaysia-singapore-brunei-latest.osm.pbf
dir
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
sudo docker run -t -i -p 5000:5000 -v "${PWD}:/data" osrm/osrm-backend osrm-routed --algorithm mld /data/malaysia-singapore-brunei-latest.osrm
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/north-america-latest.osrm
sudo docker run -d -p 80:5000 --rm --name server -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:80/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
sudo docker logs -f osrm
sudo docker logs -f server
sudo docker run -d -p 80:5000 --rm --name server -v "${PWD}:/data" osrm/osrm-backend osrm-
sudo docker run -d -p 80:5000 --rm --name server -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
sudo docker logs -f server
dir
cd osrm
dir
cd maps
sudo docker logs -f server
sudo docker run -t -i -p 5000:5000 -v "${PWD}:/data" osrm/osrm-backend osrm-routed --algorithm mld /data/malaysia-singapore-brunei-latest.osrm
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/north-america-latest.osrm
sudo docker pull osrm/osrm-backend
docker run osrm/osrm-backend
docker run osrm/osrm-backendsudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/north-america-latest.osrm
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/north-america-latest.osrm
docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-partition /data/malaysia-singapore-brunei-latest.osrm
sudo docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: P
ost http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/create: dial unix /var/run/docker.sock: connect: permission 
denied.
sudo docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: P
ost http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/create: dial unix /var/run/docker.sock: connect: permission 
denied.
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world
sudo docker run hello-world
docker run hello-world
sudo docker run hello-world
sudo docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-partition /data/malaysia-singapore-brunei-latest.osrm
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/north-america-latest.osrm
dir
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-customize /data/malaysia-singapore-brunei-latest.osrm
sudo docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: P
ost http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/create: dial unix /var/run/docker.sock: connect: permission 
denied.
sudo docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-customize /data/berlin-latest.osrm
sudo docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-customize /data/malaysia-singapore-brunei-latest.osrm
sudo docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-contract --thread 8 /data/malaysia-singapore-brunei-latest.osrm
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
sudo docker logs -f osrm
curl "http://localhost:80/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
export EXTERNAL_IP=$(gcloud compute instances describe $INSTANCE_NAME --zone=$GCP_ZONE --format='get(networkInterfaces[0].accessConfigs[0].natIP)')
export EXTERNAL_IP=$(gcloud compute instances describe instance-5 --zone=asia-southeast1-c --format='get(networkInterfaces[0].accessConfigs[0].natIP)')
sudo export EXTERNAL_IP=$(gcloud compute instances describe instance-5 --zone=asia-southeast1-c --format='get(networkInterfaces[0].accessConfigs[0].natIP)')
DIR
dir
cd osrm/maps
dir
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
sudo docker logs -f osrm 
cd osrm/maps
dir
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
dir
git clone https://github.com/VROOM-Project/vroom.git
cd vroom
dir
cd src
make
apt-get install -y pkg-config
sudo apt-get install -y pkg-config
make
sudo apt-get install libboost-all-dev
make
dpkg --list | grep compiler
uname -a 
make
sudo apt-get install libssl-dev
make
cd ..
vroom INPUT
dir
cd ../
dir
vroom INPUT
cd vroom
dir
cd libvroom_examples
dir
cd makefile
dir
cd makefile
ls
ls -d
vroom
vroom -h
dir
cd ../
dir
cd bin
dir
cd vroom
dir
vroom INPUT
cd vroom
dir
vroom INPUT
vroom -h
cd ../
dir
cd ../
cd bin/vroom
cd bin
dir
cd vroom
dir
cd bin
dir
cd vroom
ls
ls -l vroom
ls -lh vroom
git
git checkout 1.6
git checkout v1.6.0
cd ../
dir
cd vroom
git checkout v1.6.0
cd bin
dir
vroom -h
cd ../
git checkout matser
cd ../
dir
cd vroom
git checkout latest
git status
git checkout master
cd ../
dir
git clone https://github.com/VROOM-Project/vroom-express.git
cd vroom-express
npm install
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
cd ../
dir
cd osrrm
cd osrm
dir
cd maps
dir
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/north-america-latest.osrm
cd ../
dir
cd maps
dir
cd ../
dir
cd osrm
dir
cd maps
dir
cd osrm
dir
cd maps
dir
cd ../
dir
rm -r maps
y
dir
cd maps
wget https://download.geofabrik.de/asia/malaysia-singapore-brunei-latest.osm.pbf maps/
sudo docker pull osrm/osrm-backend
dir
cd ../
dir
cd ..//
dir
cd ../
dir
cd tcofeeder1
sudo docker pull osrm/osrm-backend
cd osrm
dir
sudo docker pull osrm/osrm-backend
dir
cd maps
dir
sudo docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-extract --threads 8 -p /opt/car.lua /data/malaysia-singapore-brunei-latest.osm.pbf
sudo docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-contract --thread 8 /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:80/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:80/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd ../
dir
cd ../
d9r
dir
cd vroom-express
dir
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:80
npm start
npm install
curl -L https://npmjs.org/install.sh | sudo sh
node -v
cd ../
git clone https://github.com/joyent/node.git
cd node
./configure
dir
make
cd ../
dir
cd node
ls
dir
cd ../
rm -r nnode
rm -r node
y
$ curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install nodejs npm
sudo apt update
sudo apt install nodejs npm
nodejs --version
sudo apt-get install -f
sudo apt update
sudo apt INSTALL
sudo apt update
sudo apt install nodejs npm
sudo apt-get install aptitude
sudo apt-get update
sudo apt-get clean
sudo apt-get autoremove
sudo apt install nodejs npm
sudo apt --fix-broken install
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -f
sudo apt-get install npm
dpkg --get-selections | grep hold
sudo aptitude install npm
npm
sudo apt-get update
npm install
sudo npm install npm -g
sudo apt-get install curl software-properties-common
curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -
sudo apt-get install nodejs
node -v 
npm -v 
npm install
dir
cd vroom-express
npm install
npm audit fix
npm start
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
cd ../
cd osrm
dir
cd maps
dir
cd ../
dir
cd vroom-express/
dir
npm start
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
cd vroom
dir
vroom input
vroom INPUT
vroom
make
cd ../
dir
rm -r vroom
y
ygit clone https://github.com/VROOM-Project/vroom.git
git clone https://github.com/VROOM-Project/vroom.git
cd vroom
git checkout v1.6.0
cd src/
make
makecd ..
cd ..
vroom
vroom -h
$ vroom -h
vroom -h
dir

cd bin
dor
vrpp, =h
vroom -h
dir
cd vroom
file vroom
ls
objdump -x vroom
cd ../
dir
cd lib
dir
g++ --version
g++ -std=c++0x ....
-std=c++0x
g++ -std=c++0x
git checkout v1.6.0
vroom
cd ../
dir
cd src
make
dir
cd ../
dir
rm -r vroom
y
git clone https://github.com/VROOM-Project/vroom.git
cd vroom
git checkout v1.6.0
cd src
dir
make
dir
cd ../
dir
vroom
aptitude search boost
sudo apt install libboost1.68-dev
sudo apt-get install libboost-all-dev
sudo apt-get update
dir
vroom
vroom INPUT
cd ../
rm -r vroom
g++ -version
g++ -v
cd vroom-express
dir
cd bin
dir
docker
docker -h
docker images
dokcer info osrm/osrm-backend
docker info osrm/osrm-backend
cd vroom-express
npm start
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
npm start
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
curl "http://localhost:80/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:80/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
cd vroom
dir
cd vroom-express
git clone https://github.com/VROOM-Project/vroom.git
cd vroom
dir
cd src
make
dir
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
dir
cd ../
dir
cd bin
git clone https://github.com/VROOM-Project/vroom-express.git
cd vroom-express
npm install
npm start
cd ~
dir
cd vroom-express
dir
rm -r vroom
cd ../
dir
vroom
git clone https://github.com/VROOM-Project/vroom.git
cd vroom
cd src/
make
cd ..
vroom
cd ../
vroom
cd vroom
dir
cd bin
sudo chmond +x ./vroom
sudo chmod +x ./vroom
vroom
./vroom
./vroom -h
vroom
echo $path
export PATH=$PATH:~/vroom/bin/vroom
vroom
echo $path
export PATH=$PATH:/vroom/bin/vroom
echo $PATH

export PATH=$PATH:/vroom/bin
vroom
echo $PATH
cd ../
vroom
vroom -h
cd bin
./vroom
export PATH=$PATH:~/vroom/bin
vroom
cd ../
vroom
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
npm start
cd vroom-express
npm start
curl "http://localhost:80/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:80
curl "http://localhost:80/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
export PATH=$PATH:~/vroom/bin
vroom
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
curl "http://127.0.0.1:5000/route/v1/driving/13.388860,52.517037;13.385983,52.496891?steps=true"
curl "http://127.0.0.1:80/route/v1/driving/13.388860,52.517037;13.385983,52.496891?steps=true"
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:80/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
dir
cd osrm
dir
cd maps
dir
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:80/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd ../
curl "http://localhost:80/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
dir
cd vroom-express
npm start
cd ../
cd vroom-express/
npm start
export PATH=$PATH:~/vroom/bin
npm start
vroom -h
vroom -a
vroom input
vroom INPUT
curl "http://localhost:80/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:80
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:80:5000
npm start
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true" 
cd osrm
cd maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true" 
cd //
cd ~
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true" 
cd vroom-express/
npm start
export PATH=$PATH:~/vroom/bin
npm start
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
dir
ls
osrm
cd osrm
cd maps

sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true" 
cd ../
echo 'export PATH="$PATH":/~/vroom/bin' >> ~/.bashrc
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:5000
cd ../
cd ~
dir
cd vroom-express
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:5000
npm start
echo 'export PATH="$PATH":/~/vroom/bin' >> ~/.bashrc
npm start
cd ~
export PATH=$PATH:~/vroom/bin
cd vroom-express
npm start
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
dir
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
curl "http://127.0.0.1:80/route/v1/driving/13.388860,52.517037;13.385983,52.496891?steps=true"
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true" 
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
dir
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' https://35.213.166.175/
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' https://35.213.166.175/:3000
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' https://10.148.0.5:3000
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://10.148.0.5:3000
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://35.213.166.175/:3000
dir
cd ../
dir
cd tcofeeder1
dir
cd ../
cd../
cd ../
dir
cd etc
dir
cd sysconfig
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://35.213.166.175/:3000
curl http://35.213.166.175/:3000:80
curl http://35.213.166.175/:3000
$ sudo wget http://localhost
cd ~
$ sudo wget http://localhost
sudo apt install apache2
sudo ufw app list
sudo apt install curl
curl -4 icanhazip.com
http://35.213.166.175/:3000
http://35.213.166.175/
curl -4 http://35.213.166.175
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://35.213.166.175/:3000
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://10.148.0.5:3000
cd osrm
cd maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://35.213.166.175/:3000
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
cd ../
cd vroom-express
dir
node src/index.js
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://35.213.166.175/:3000
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://35.213.166.175:3000
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd vroom
export PATH=$PATH:~/vroom/bin
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://localhost:3000
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true" 
npm start
cd ../
cd vroom-express
npm start
node src/index.js
cd osrm
cd maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../
dir
cd vroom
dir
npm start
export PATH=$PATH:~/vroom/bin
npm start
cd ../
dir
cd vroom-express
npm start
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://35.213.166.175:3000
dir
git clone https://github.com/VROOM-Project/vroom-frontend.git
cd vroom-frontend
npm install
npm run serve
cd osrm
cd maps
dir
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../
dir
export PATH=$PATH:~/vroom/bin
dir
cd vroom
cd ../
cd vroom-express
npm start
dir
cd osrm
cd maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../
dir
cd ../
export PATH=$PATH:~/vroom/bin
cd vroom-express
npm start
dir
dkir
dir
ls
nano config.yml
cd ../
dir
cd vroom
dir
cd ../
cd vroom-express
dir
cd src
dir
nano config.js
dir
nano config.js
dir
nano config.js
cd ../
dir
npm start
cd src
dir
nano config.js
cd ../
dir
cd ../
dir
cd vroom-frontend
dir
cd src
dir
cd config
dir
nano api.js
cd ../
dir
cd ../
dir
cd vroom-express
dir
npm start
cd vroom-frontend
dir
npm run serve
dir
cd vroom-frontend
npm run serve
cd vroom-express
npm start
cd ../
export PATH=$PATH:~/vroom/bin
cd vroom-express
npm start
dir
cd osrm
dir
cd maps
dir
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
export PATH=$PATH:~/vroom/bin
cd vroom-express
cd ../
export PATH=$PATH:~/vroom/bin
dir
cd vroom-express
npm start
cd vroom-frontend
dir
npm serve run
npm run serve
export PATH=$PATH:~/vroom/bin
dir
cd vroom-express
npm start
export PATH=$PATH:~/vroom/bin
cd vroom-express
npm start
cd vroom-express
npm start
cd osrm
dir
cd maps
dir
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../
dir
cd ../
export PATH=$PATH:~/vroom/bin
cd vroom-frontend
npm run serve
dir
cd src
cd config
dir
nano api.js
cd ../../
dir
npm run serve
cd vroom-express
npm start
cd ../
export PATH=$PATH:~/vroom/bin
cd vroom-express
npm start
dir
cd src
dir
nano config.js
cd ../../
dir
npm start
cd osrm
dir
cd maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
export PATH=$PATH:~/vroom/bin
cd vroom-express
npm start
cd src
dir
cd config.js
nano config.js
cd ../../
dir
cd vroom-express
npm start
cd vroom-frontend
npm run serve
cs osrm/maps
cd osrm
cd maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../c../
cd ../../
export PATH=$PATH:~/vroom/bin
cd vroom-express
npm start
top
lscpu
cd vroom-frontend
npm run serve
dir
cd osrm
cd maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../
cd.//
cd ../
cd vroom-express
cd ../
export PATH=$PATH:~/vroom/bin
cd vroom-express
npm start
top
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --shared-memory=yes -t 16 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd ../../
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --shared-memory=yes -t 16 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
docker
docker images
docker history
docker history osrm/osrm-backend
or 
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --shared-memory=yes -t 14 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd ..
cd
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 -t 14 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd
export PATH=$PATH:~/vroom/bin
cd vroom-express
npm start
top
dir
cd vroom
dir
cd src
dir
cd structures
dir
cd cl_args.cpp
nano cl_args.cpp
cd ../../
cd ../
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
export PATH=$PATH:~/vroom/bin
dir
cd ../../
dir
cd vroom-express
npm start
dir
cd vroom/bin
dir
nano vroom
ls
ls vroom
cd ../
dir
cd src
dir
nano main.cpp
cd structure
dir
cd structures/
dir
nano c1_args.cpp
cd ../
cd structures
dir
nano c1_args.cpp
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 -t 14 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
top
cd ../../
dir
top
cd vroom
dir
cd src
dir
cd structures
dir
nano c1_args.cpp
cd ../
cd ../../
export PATH=$PATH:~/vroom/bin
cd vroom
cd ../
cd vroom-express
npm start
top
dir
export PATH=$PATH:~/vroom/bin
cd osrm/maps
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 -t 14 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
dir
cd vroom
dir
cd vroom/bin
dir
cd bin
dir
rm test.js.save
rm test.js.save.1
vroom -i test.js
dir
rm test.js
cat > test.js
nano test.js
vroom -i test.js
dir
cd ../
dir
cd src
dir
cd structures
dir
nano c1_args.cpp
cd ../../
dir
cd bin
dir
vroom -i test.js
vroom -i test.js -t 500
cd ../../
dir
cd vroom-express
dir
ls
cd src
dir
rm config.js.save
dir
nano config.js
dir
nano config.js
cd ../
dir
npm start
dir
cd src
nano index.js
nano config.js
cd ../../
dir
cd vroom-express
dir
npm start
dir
cd src
dir
nano config.js
nano index.js
dir
cd../
dir
cd ../
dir
cd ../
dir
cd vroom-express
npm start
dir
d src
dir
cd src
dir
nano config.js
nano index.js
nano config.js
cd ../
dir
npm start
dir
cd vroom-frontend
dir
cd src
dir
cd ../
npm run serve
top
cd vroom-frontend/
dir
npm start serve
dir
npm serve start
npm start serve
dir
npm run serve
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd osrm
dir
cd maps
dir
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
export PATH=$PATH:~/vroom/bin
dir
cd vroom-express
dir
cd src
dir
nano config.js
nano index.js
nano config.js
cd ../
export PATH=$PATH:~/vroom/bin
dir
cd vroom-express
npm start
cd vroom-frontend
npm run serve
cd vroom-express
npm start
export PATH=$PATH:~/vroom/bin
cd ../
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../
dir
cd vroom-frontend/
dir
npm start serve
cd ../
cd vroom-express/
npm start
export PATH=$PATH:~/vroom/bin.
export PATH=$PATH:~/vroom/bin
dir
cd vroom-express/
npm start
top
cd vroom
dir
cd bin
dir
nano test.js
cat > simple.js
nano simple.jg
dir
vroom -i 'simple.js'
vroom -i simple.js
cd ../
export PATH=$PATH:~/vroom/bin
vroom -i 'simple.js'
nano simple.js
vroom -i 'simple.js'
nano simple.js
vroom -i 'simple.js'
dir
cd src
dir
cd utils
dir
cd ../
dir
cd ../
cd bin
vroom -i 'simple.js' -g
cd ,,.
dir
cd ../
dir
cd src
dir
cd ../
dir
cd src
dir
cd ../
cd bin
dir
cd ../
dir
cd lib
dir
cd ../
dir src
cd ../
cd scr
cd scrip
cd scripts
dir
cd src
dir
cd vroom-express/
dir
ls
cd src
dir
cd config.js
anno config.js 
nano config.js 
nano index.js
cd ../
dir
cd ../
cd vroom
dir
cd bin
dir
vroom -i 'simple.js'
cd ../
cd vroom-express/
cd src
dir
nano index.js
nano config.js
nano index.js
top
cd osrm/maps
dir
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
dir
cd vroom-f
npm start serve
cd ../../
dir
cd vroom-frontend/
npm start serve
npm serve start
npm start serve
dir
npm run serve
cd vroom-express
dir
cd ../
cd vroom-frontend/
npm run serve
sudo nano /etc/ssh/sshd_config
cd ~/.ssh
dir
nano authorized_keys 
cd ~
dir
cd sorm
cd osrm/maps
dir
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
dir
cd ../../
dir
cd vroom-express
cd ../
export PATH=$PATH:~/vroom/bin
cd vroom-express/
npm start
dir
cd ../osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd ../
dir
cd ../
cd vroom-e
cd vroom-express/
dir
npm start
cd vroom-f
dir
cd vroom-
dir
cd vroom-
cd vroom-frontend
dir
cd ../
dir
cd osrm/maps
dir
docker
docker port
docker container
docker container ls
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
docker container ls
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 -t 14 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
docker container ls
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
docker ps
docker ps -a
cd osrm/maps
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
dir
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd ../../
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd osrm.maps
dir
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
dir
nano
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
curl "http://localhost:80/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd ../../
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd osrm.maps
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
dir
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
dir
export PATH=$PATH:~/vroom/bin
dir
cd vroom-express/
npm start
dir
cd vroom-frontend/
npm run serve
top
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
dir
cd ..../
cd ../../
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
dir
export PATH=$PATH:~/vroom/bin
cd vroom-express
npm start
dir
cd ../
dir
cd vroom
dir
cd bin
vroom
vroom -i simple.js
dir
nano test.js
rm -r test.js
dir
cat > test.js
dir
nano test.js
rm -r test.js
cat > test.js
vroom -i test.js 
dir
nano test.js
vroom -i morning
dir
nano morning.json
vroom -i morning.json
vroom -i morning.json -t 500
cd ../../
dir
cd vroom-express
npm start
cd vroom-frontend/
npm run serve
export PATH=$PATH:~/vroom/bin
dir
cd osrm/maps
dir
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd ../../
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
export PATH=$PATH:~/vroom/bin
dir
cd vroom-ex
cd vroom-express/
npm start
top
cd vroom-frontend/
npm run serve
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
dir
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd ../../
cd ~
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
export PATH=$PATH:~/vroom/bin
cd vroom-express/
dir
npm start
dir
cd vroom-frontend/
npm run serve
cd osrm.maps
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
curl "http://localhost:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
dir
export PATH=$PATH:~/vroom/bin
dir
cd vroom-express
npm start
dir
cd vrooom-frontend
cd vroom-frontend/
npm run serve
cd vroom-frontend/
npm run serve
ls
cd osrm
ls
cd ../
cd osrm.maps
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../
ls
export PATH=$PATH:~/vroom/bin
cd vroom-express
npm start
curl --header "Content-Type:application/json" --data '{"vehicles":[{"id":0,"start":[2.3526,48.8604],"end":[2.3526,48.8604]}],"jobs":[{"id":0,"location":[2.3691,48.8532]},{"id":1,"location":[2.2911,48.8566]}],"options":{"g":true}}' http://35.213.166.175:3000
cd vroom-frontend/
npm run serve
ls
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
cd vroom-express/
npm start
cd ../
export PATH=$PATH:~/vroom/bin
cd vroom-express/
npm start
export PATH=$PATH:~/vroom/bin
cd vroom-express\
cd vroom-express/
vroom start
npm start
cd vroom-frontend/
dir
npm run serve
export PATH=$PATH:~/vroom/bin
cd vroom-express/
npm start
cd vroom-frontend/
npm run serve
export PATH=$PATH:~/vroom/bin
cd vroom-express/
npm start
cd osrm/maps
export PATH=$PATH:~/vroom/bin
cd ../../
export PATH=$PATH:~/vroom/bin
cd vroom-express/
npm start
cd vroom-frontend/
npm run serve
dir
cd osrm
dir
cd maps
dir
sudo docker run -d -p 80:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 1000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd ../../
dir
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
dir
cd vroom-frontend/
dir
nano index.html
cd ../
dir
nano index.html
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd osrm/maps
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
curl "http://35.213.166.175:5000/route/v1/driving/-80.868670,35.388501;-80.974886,35.236367?steps=true"
dir
cd vroom-expres
npm start
dir
cd vroom
dir
cd ../
dir
cd vroom-express/
npm start
export PATH=$PATH:~/vroom/bin
cd ../
dir
export PATH=$PATH:~/vroom/bin
cd vroom-frontend/
npm start
cd ../
cd vroom-express/
npm start
dir
cd vroom-
cd vroom-frontend/
npm run serve
dir
cd vroom-frontend/
npm run serve
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
dir
cd ../../
dir
cd vroom-express/
npm start
cd ../
export PATH=$PATH:~/vroom/bin
cd vroom-
cd vroom-express/
npm start
dir
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
dir
cd vroom-express/
export PATH=$PATH:~/vroom/bin
cd ../
export PATH=$PATH:~/vroom/bin
cd vroom-express/
npm start
dir
cd vroom-frontend/
npm run serve
dir
cd vroom-frontend/
npm run serve
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
export PATH=$PATH:~/vroom/bin
cd vroom-express/
npm start
dir
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
export PATH=$PATH:~/vroom/bin
cd vroom-express/
npm start
cd vroom-frontend/
npm start
npm run serve
dir
export PATH=$PATH:~/vroom/bin
cd vroom-express/
npm start
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
cd vroom-express/
export PATH=$PATH:~/vroom/bin
cd ../../
cd ~
export PATH=$PATH:~/vroom/bin
cd vroom-express/
npm start
cd vroom-frontend/
npm run serve
cd osrm.maps
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../
cd vroom-frontend/
npm run serve
export PATH=$PATH:~/vroom/bin
dir
cd vroom-express/
npm start
npm run serve
cd vroom-frontend/
npm run serve
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd osrm/maps
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
dir
export PATH=$PATH:~/vroom/bin
cd vroom-express/
npm start
npm run serve
cd vroom-frontend/
npm run serve
export PATH=$PATH:~/vroom/bin
cd vroom-express/
npm start
dir
cd ../
dir
cd ../
dir
sudo apt-get update
sudo apt-get install apache2 php libapache2-mod-php
dir
sudo service httpd start
sudo sh -c 'echo "[YOUR_PHP_CODE]" > /var/www/html/phpinfo.php'
dir
cd ../
dir
cd ../
dir
cd etc
dir
cd  /opt/lampp
cd ../
dir
cd etc
dir
cd lampp
cd apache2
dir
nano apache2.conf
cd ../
dir
cd ../
cd var
dir
cd www
dir
cd html
dir
nano index.html
dir
chmod -R 777 ./
chmod -R 777 .
sudo chmod -R 777.
sudo chmod -R 777 .
dir
cd ../
dir
sudo chmod -R 777 .
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd osrm/maps
dir
sudo docker run -d -p 5000:5000 --rm --name osrm -v "${PWD}:/data" osrm/osrm-backend osrm-routed --max-table-size 5000 --algorithm ch /data/malaysia-singapore-brunei-latest.osrm
cd ../../
c
export PATH=$PATH:~/vroom/bin
cd vroom-express/
npm start
