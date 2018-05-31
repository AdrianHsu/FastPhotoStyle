#rm images -rf;
#rm results -rf;
#mkdir images && mkdir results;
#cd images;
#axel -n 1 http://freebigpictures.com/wp-content/uploads/shady-forest.jpg --output=content1.png;
#axel -n 1 https://vignette.wikia.nocookie.net/strangerthings8338/images/e/e0/Wiki-background.jpeg/revision/latest?cb=20170522192233 --output=style1.png;
#wget https://raw.githubusercontent.com/luanfujun/deep-photo-styletransfer/master/examples/input/in30.png -O content1.png;
#wget https://raw.githubusercontent.com/luanfujun/deep-photo-styletransfer/master/examples/style/tar30.png -O style1.png;
#convert -resize 25% content1.png content1.png;
#convert -resize 50% style1.png style1.png;
#cd ..;
cp $1 ./images/content1.png;
cp $2 ./images/style1.png;

