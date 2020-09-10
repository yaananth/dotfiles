# ssh to ghub enterprise dev 
# with actions
alias sshdev="ssh -A build@yaananth-3b866d94a.service.bpdev-us-east-1.github.net"

alias sshactions="ssh -p122 admin@brcrista-0d9683d62bcbe9e07.qaboot.net"

alias temp="ssh -p122 admin@solmazabbaspour-0fc43ce39acca33d8.qaboot.net"

alias sshperf="ssh -p122 admin@actions-perf.ghe-test.net"
alias sshbash="ssh -p122 admin@brcrista-0f09ed49c22c754f5.ghe-test.net"
alias sshbashme="ssh -p122 admin@yaananth-0e3d61648fca66032.qaboot.net"

alias sshs="ssh -p122 admin@brcrista-0650fb1b1719fc276.qaboot.net"
alias sshm="ssh -p122 admin@yaananth-077e586b5c3e6e2b8.ghe-test.org"
alias sshl="ssh -p122 admin@yaananth-0b3c858286ab7eb8a.ghe-test.net"
alias sshxl="ssh -p122 admin@yaananth-0dfaca5e1abbb7f28.qaboot.net"

#http://yaananth-04334502d138dcd53.qaboot.net/
#IbFrhk035
#41ea87ebf2b1271a8b93450352dbebf8b9060b56
alias sshplay="ssh -p122 admin@yaananth-04334502d138dcd53.qaboot.net"

alias octofapi="security find-generic-password -wa octofactory  | pbcopy | echo '=> Octofactory API key copied to pasteboard.'"
alias octoflogin="echo 'docker login octofactory.githubapp.com' | pbcopy | echo '=> docker login octofactory.githubapp.com copied to pasteboard.'"
alias addmyssh="curl https://github.com/yaananth.keys | tee -a ~/.ssh/authorized_keys"