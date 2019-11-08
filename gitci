#! /bin/bash
# this scripts backs up all git repos on my locals
POSITIONAL=()
while [[ $# -gt 0 ]]
do key="$1"

case $key in
  -b|--blog) #  check if blog has unstaged commits
  blogmit="$2"
  shift # past argument
  shift # past value
  ;;
  -p|--papers) #  check if papers has unstaged commits
  papersmit="$2"
  shift # past argument
  shift # past value
  ;;
  -n|--niw)  # NIW?
  niwmit="$2"
  shift # past arg
  shift # past value
  ;;
  -s|--sup)  # superchicko?
  supmit="$2"
  shift # past arg
  shift # past value
  ;;
  *) # unknown option
  POSITIONAL+=("$1") # save in array for later use
  shift # past arg
  ;;
esac
done
set -- "${POSITION[@]}" # restore positional parameters

parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

if [[ -z "$blogmit" ]]; then
  echo -e "usage: `basename $0` [-b|--blog] [-p|--papers]  [-n|--niw] [-s|--sup]\n\t
                            -b push/pull blog directory  [y/n] \t
                            -p push/pull papers directory  [y/n] \t
                            -n push/pull niw directory  [y/n] \t
                            -s push/pull superchicko directory [y/n] \n\t"
  exit 1
fi

# source aliases
shopt -s expand_aliases
source ~/.zsh_aliases

is_yes() {
        yesses={y,Y,yes,Yes,YES}
        if [[ $yesses =~ $1 ]]; then
                echo 1
        fi
        }

is_no() {
        noses={n,N,no,No,No}
        if [[ $noses =~ $1 ]]; then
                echo 1
        fi
        }

if [[ $(is_yes $blog) ]]; then
   echo -e "\n>>>>>>>>>>>>>>>>>>==============================="
   echo -e "Git in blog"
   echo -e ">>>>>>>>>>>>>>>>>>===============================\n"
   blog  # assumes blog as alias
   git add -A; git commit -m "auto commit";
   git pull origin master; git push origin master
fi

if [[ $(is_yes $papers) ]]; then
   echo -e "\n>>>>>>>>>>>>>>>>>>==============================="
   echo -e "Git in papers"
   echo -e ">>>>>>>>>>>>>>>>>>===============================\n"
   # cd ~/Documents/Papers  # assumes papers as an alias
   papers
   git add -A; git commit -m "auto commit";
   git pull origin master; git push origin master
fi

if [[ $(is_yes $niw) ]]; then
   echo -e "\n>>>>>>>>>>>>>>>>>>==============================="
   echo -e "Git in NIW"
   echo -e ">>>>>>>>>>>>>>>>>>===============================\n"
   # cd ~/Desktop/Personals  # assumes papers as an alias
   niw
   git add -A; git commit -m "auto commit";
   git pull origin master; git push origin master
fi

if [[ $(is_yes $sup) ]]; then
   echo -e "\n>>>>>>>>>>>>>>>>>>==============================="
   echo -e "Git in Superchicko"
   echo -e ">>>>>>>>>>>>>>>>>>===============================\n"
   # cd ~/catkin_ws/src/superchicko  # assumes papers as an alias
   sup
   git add -A; git commit -m "auto commit";
   git pull origin $parse_git_branch; git push origin $parse_git_branch
fi

   echo -e "\n>>>>>>>>>>>>>>>>>>==============================="
   echo -e "We are done now"
   echo -e ">>>>>>>>>>>>>>>>>>===============================\n"