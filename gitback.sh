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

# echo -e "Clean current directory? [yn]"
# read res

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
   echo -e "Git in blog"
   blog  # assumes blog as alias
   git add -A; git commit -m "auto commit";
   git pull origin master; git push origin master
fi

if [[ $(is_yes $papers) ]]; then
   echo -e "Git in papers"
   papers  # assumes papers as an alias
   git add -A; git commit -m "auto commit";
   git pull origin master; git push origin master
fi

if [[ $(is_yes $niw) ]]; then
   echo -e "Git in niw"
   niw  # assumes papers as an alias
   git add -A; git commit -m "auto commit";
   git pull origin master; git push origin master
fi

if [[ $(is_yes $sup) ]]; then
   echo -e "Git in sup"
   sup  # assumes papers as an alias
   git add -A; git commit -m "auto commit";
   git pull origin $parse_git_branch; git push origin $parse_git_branch
fi

echo -e "\nWe are done integrating for now\n"