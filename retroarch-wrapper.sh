#!/bin/sh

rm -f /media/data/local/bin/*_libretro*.sh

if [ "$1" = "--clean" ]; then
  exit 0
fi

chmod 777 /media/data/local/bin/retroarch_rg350_odbeta

for corepath in /media/data/local/home/.retroarch/cores/*.so; do
  core=`basename ${corepath}`

  filename="/media/data/local/bin/${core%.*}.sh"

  echo "#!/bin/sh" > ${filename}
  echo "/media/data/local/bin/retroarch_rg350_odbeta -L /media/data/local/home/.retroarch/cores/${core} --config /media/data/local/home/.retroarch/retroarch.cfg \${1}" >> ${filename}

  chmod 777 ${filename}
done
