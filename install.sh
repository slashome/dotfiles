#!bin/bash

# #################### #
#                      #
#   IMPORT RESOURCES   #
#                      #
# #################### #

source ./scripts/core/colors.sh
source ./scripts/core/tools.sh
source ./program_list.sh


# ################### #
#                     #
#   INSTALL SCRIPTS   #
#                     #
# ################### #

createLink ./scripts $HOME/scripts
createLink scripts/script-launcher.sh /usr/bin/sl 1

createLink scripts/src/bin/qb /usr/bin/qb 1

# #################### #
#                      #
#   INSTALL PROGRAMS   #
#                      #
# #################### #

# Check if trizen is installed
if [ ! hash trizen 2>/dev/null ]; then
    echo "Please install trizen first"
    exit 0
fi

for P in "${PROGRAMS[@]}"
do
    echo -e "${BLUE}Check state of program ${ORANGE}$P${NC}"
    RESULT=$(trizen -Qi $P 2>&1)
    RESULT="${RESULT:0:6}"

    if [ $RESULT == "error:" ]; then
        echo -e " > Program $P not found. Installing ..."
        trizen -S $P
    fi

    if [ -d ./$P/ ]; then
        if [ -f ./$P/install.sh ]; then
            echo -e "${PURPLE} > ${GREEN}Installation script founded for ${ORANGE}$P${NC}"
            source ./$P/install.sh
        fi
    fi
done

exit 0


