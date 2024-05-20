#!/bin/sh

envFile=$HOME/.local/share/redshift-env.sh
changeValue=300


# if [ ! -f "$envFile" ]; then
#     # Создание файла с указанным содержанием
#     echo 'export REDSHIFT=off' > "$envFile"
#     echo 'export REDSHIFT_TEMP=1100' >> "$envFile"
# 	echo 'created file'
# fi
#
# envFile=$HOME/.local/share/redshift-env.sh
echo "$REDSHIFT_TEMP"



changeMode() {
  sed -i "s/REDSHIFT=$1/REDSHIFT=$2/g" $envFile 
  REDSHIFT=$2
  echo $REDSHIFT
}

changeTemp() {
  if [ "$2" -gt 1000 ] && [ "$2" -lt 25000 ]
  then
    sed -i "s/REDSHIFT_TEMP=$1/REDSHIFT_TEMP=$2/g" $envFile 
    redshift -P -O $((REDSHIFT_TEMP+changeValue))
else
	echo "error with if"
  fi
}

case $1 in 
  toggle) 
    if [ "$REDSHIFT" = on ];
    then
      changeMode "$REDSHIFT" off
      redshift -x
    else
      changeMode "$REDSHIFT" on
	  changeTemp $((REDSHIFT_TEMP)) $((REDSHIFT_TEMP))
      # redshift -O "$REDSHIFT_TEMP"
    fi
    ;;
  increase)
	# echo "inc - $((REDSHIFT_TEMP+changeValue))"
	echo $((REDSHIFT_TEMP)) $((REDSHIFT_TEMP+changeValue))
    changeTemp $((REDSHIFT_TEMP)) $((REDSHIFT_TEMP+changeValue))
	echo "inc - $((REDSHIFT_TEMP+changeValue))" >> inc.txt
	echo "inc - $((REDSHIFT_TEMP+changeValue))"
    ;;
  decrease)
    changeTemp $((REDSHIFT_TEMP)) $((REDSHIFT_TEMP-changeValue));
    ;;
  temperature)
    case $REDSHIFT in
      on)
		echo "==$REDSHIFT_TEMP"
        printf "%dK" "$REDSHIFT_TEMP"
        ;;
      off)
        printf "off"
        ;;
    esac
    ;;
esac
