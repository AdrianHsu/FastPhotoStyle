#rm images -rf;
#rm results -rf;
#mkdir images && mkdir results;
#cd images;
#axel -n 1 http://freebigpictures.com/wp-content/uploads/shady-forest.jpg --output=content1.png;
#axel -n 1 https://vignette.wikia.nocookie.net/strangerthings8338/images/e/e0/Wiki-background.jpeg/revision/latest?cb=20170522192233 --output=style1.png;
#axel -n 1 https://github.com/luanfujun/deep-photo-styletransfer/raw/master/examples/input/in30.png --output=content1.png;
#axel -n 1 https://github.com/luanfujun/deep-photo-styletransfer/raw/master/examples/style/tar30.png --output=style1.png;
#convert -resize 25% content1.png content1.png;
#convert -resize 50% style1.png style1.png;
#cd ..;
python demo.py ; #--content_image_path='./images/content2.png' --style_image_path='./images/style2.png' --output_image_path='./results/example2.png';
