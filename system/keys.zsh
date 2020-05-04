# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias privatekey="more ~/.ssh/id_rsa | pbcopy | echo '=> Private key copied to pasteboard.'"
