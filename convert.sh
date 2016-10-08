#---------------------------------------------------------------
# Конвертер xxhdpi image или an App Icon (launcher)
# Создание размеров определенных dpis для drawable
#
# Требуется поместить папку где лежат изображения
#
# Пример:
# ./convert.sh ic_launcher.png
# Или
# ./convert.sh name_image.png
#---------------------------------------------------------------

echo " Создание размеров определенных dpis для "$1" ..."

if [ ! -d drawable-xxhdpi ]; then 
    echo " папка drawable-xxhdpi создана"
    mkdir drawable-xxhdpi
fi
if [ ! -d drawable-xhdpi ]; then 
    echo " папка drawable-xhdpi создана"
    mkdir drawable-xhdpi
fi
if [ ! -d drawable-hdpi ]; then 
    echo " папка drawable-hdpi создана"
    mkdir drawable-hdpi
fi
if [ ! -d drawable-mdpi ]; then 
    echo " папка drawable-mdpi создана"
    mkdir drawable-mdpi
fi


if [ $1 = "ic_launcher.png" ]; then
    echo " App icon найдена"

    convert ic_launcher.png -resize 144x144 drawable-xxhdpi/ic_launcher.png
    convert ic_launcher.png -resize 96x96 drawable-xhdpi/ic_launcher.png
    convert ic_launcher.png -resize 72x72 drawable-hdpi/ic_launcher.png
    convert ic_launcher.png -resize 48x48 drawable-mdpi/ic_launcher.png
    rm -i ic_launcher.png
else
    convert $1 -resize 67% drawable-xhdpi/$1
    convert $1 -resize 50% drawable-hdpi/$1
    convert $1 -resize 33% drawable-mdpi/$1
    mv $1 drawable-xxhdpi/$1

fi

echo " Выполнено"