# assuming you have a reset yubi key via ykman openpgp reset, ykman piv reset
# and ykman oath reset if you know you have the keys or recovery codes needed

# very generally go cached on pin and touch everytime

# this will register the secret keys on the card
# gpg --card-status

# admin > passwd set pins (pins never go in pw vault)
gpg --edit-card

ykman openpgp set-touch SIG FIXED
ykman openpgp set-touch AUT FIXED
ykman openpgp set-touch ENC FIXED

