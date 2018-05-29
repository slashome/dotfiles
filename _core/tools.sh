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
      printf $" ${RED}/!\ Warning, directory exist, do you want to remove it ? ${WHITE}[y/N]${NC} "
      read -n 1 -r
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED} > ${ORANGE}Existing directory removed${NC}"
        rm $DST
      else
        echo -e "${RED} > ${WHITE}Existing directory NOT removed"
        return 0
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
