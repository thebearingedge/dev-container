apt-get install -y git

mkdir -p /home/dev/.local

curl -sL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o /home/dev/.local/git-completion.bash

cat << 'EOF' >> /home/dev/.bashrc

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] λ "

source /home/dev/.local/git-completion.bash

EOF
