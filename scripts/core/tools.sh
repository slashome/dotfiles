#!/usr/bin/env bash

#
#
#
get_spaces()
{
    FULLNAME=$1
    LONGEST_NAME=$2
    NUM_SPACES=$((${#LONGEST_NAME} - ${#FULLNAME} + 2))

    SPACES=$(printf '%*s' "$NUM_SPACES" | tr ' ' " ")

    echo "$SPACES"
}

get_description()
{
    DESC=$(sed '2q;d' $1)
    if [[ ${DESC:0:1} != '#' ]]
    then
        NEW_STR="No description"
    else
        NEW_STR=${DESC#"#"}
    fi
    echo "$NEW_STR"
}

get_longest_name()
{
    LONGEST_NAME=""

    for DIR in $ROOT_PATH/src/*
    do
        if [[ -d $DIR ]]; then
            for FILE in $DIR/*
            do
                if [[ -f $FILE ]]; then
                    DIRNAME=${DIR##*/}
                    FILENAME=${FILE##*/}
                    SCRIPTNAME=${FILENAME%.*}
                    FULLNAME="$DIRNAME:$SCRIPTNAME"
                    if [ ${#FULLNAME} -ge ${#LONGEST_NAME} ];
                    then
                        LONGEST_NAME=$FULLNAME
                    fi
                fi
            done
        fi
    done
}

function getScreenCount()
{
  COUNT=$(grep -Rl "curl" ./ | wc -l)
  echo $COUNT
  exit
}

function createFolder()
{
  DST=$1

  if [ -d $DST ]; then
    printf $" ${RED}/!\ Warning, directory exist, do you want to remove it ? ${WHITE}[Y/n]${NC} "
    read -n 1 -r
    if [[ $REPLY =~ ^[Nn]$ ]]; then
      echo -e "${RED} > ${WHITE}Existing directory NOT removed"
      return 0
    else
      echo -e "${RED} > ${ORANGE}Existing directory removed${NC}"
      rm -rf $DST
    fi

    mkdir -p $DST
  fi

  return 1
}

function createLink()
{
  SRC=$HOME/dotfiles/$1
  DST=$2
  IS_ADMIN=${3:-empty}

  if [ "$IS_ADMIN" == "empty" ]; then
    IS_ADMIN=0
  fi

  if [ ! -L $DST ]; then

    echo -e "${RED} > ${GREEN}Creating link for $SRC > $DST${NC}"

    if [ -f $DST ]; then
      printf -e $" ${RED}/!\ Warning, file exist, do you want to remove it ? ${WHITE}[Y/n]${NC} "
      read -n 1 -r
      if [[ $REPLY =~ ^[Nn]$ ]]; then
        echo -e "${RED} > ${WHITE}Existing file NOT removed"
        return 0
      else
        echo -e "${RED} > ${ORANGE}Existing file removed${NC}"
        rm $DST
      fi
    fi
  
    if [ -d $DST ]; then
      printf $" ${RED}/!\ Warning, directory exist, do you want to remove it ? ${WHITE}[Y/n]${NC} "
      read -n 1 -r
      if [[ $REPLY =~ ^[Nn]$ ]]; then
        echo -e "${RED} > ${WHITE}Existing directory NOT removed"
        return 0
      else
        echo -e "${RED} > ${ORANGE}Existing directory removed${NC}"
        rm $DST
      fi
    fi

    echo -e "${RED} > ${GREEN}Link created${NC}"
    if [ $IS_ADMIN -eq 1 ]; then
      sudo ln -s $SRC $DST
    else
      ln -s $SRC $DST
    fi

    return 1

  fi
}
