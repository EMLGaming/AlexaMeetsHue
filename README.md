# AlexaMeetsHue
------------
By EMLGaming
with very very big thanks to Jaap and Sahan

# TODO:

finish this readme
work properly
gitignore node modules and env.json and getaccestokenprivate.sh
make all the links work properly in readme
guide to get the env.json
add license
make video 
publish github reamde

# Disclaimer
**I made this project in one week at my great intership at q42. For functionality I don't recommend using this code since there is already the official alexa app for controlling your phillips hue lights. And I didn't fully beta test this.**

# Description
My program allowes you to use voice commands using Amazon Alexa to control your philips hue lights.

# Installation
Prerequisets:
if you don't have these make then all before you begin
https://account.meethue.com/account account
https://developers.meethue.com/ account (hard to get)
https://stdlib.com/ account
https://developer.amazon.com account


order you should do everything:

first get token:
chmod +x get accestoken.sh
edit accestoken.sh
add your clientsecret and clientid you get this from https://developers.meethue.com/ when you are logged in **step by step how to get this**
now save the file and run by typing 
./accestoken.sh
follow the steps very preciecely

how you should have the acces token

guide to get your username (the thingy you putt in the url of hue thingy)

add this access token to you env.json

stdlib make it work
```npm install lib.cli -g```
```lib init```
```lib create -t alexa```
```cd <username>/alexa/```
```npm install node-fetch --save```
replace the files (intents, changelight.js, env.json)
```lib up dev```
scroll up to default function and copy that url as your endpoint in alexa

add new skill call it AlexaMeetsHue
set language to english (us)
chose custom **add why**
goto JSON Editor under Interaction model and drag the alexa.json file in there
press the save button
then press the build button
goto endpoint
chose HTTPS
put the link you got from above in your default regoin section
click select ssl certificate and use My development endpoint is a sub-domain of a domain that has a wildcard certificate from a certificate authority
now press save endpoint
goto test section
enable test for skill under test section
type "ask lights to dance"
the lights should now start looping though all colors

to now use this with your actual alexa enabled device:
if you are loged in with the same amazon account you used for building the alexa app and your actual device you should be able to give the command to alexa and they should work.

done

# This I would have changed if I was going to publish this
alexa app approved by amazon
so you don't have to do all of this but this will be done for you
make the token process automatic
add more samples (use beta testers to get all the samples)
get everything tested properly

after 7 days your access token will expire so you will have to do that part again. That is because I wan't able to get up automatic refreshing of the token. This is due to phillips implementing the digest authentication wrong. I can however use basic authentication and make it refresh automaticly but then your private phillips details would have not been encrypted

# Usage
When everything is setup properly you should be able to give voice commands to your Amazon Alexa device. To test say "Alexa, tell lights to turn on." This should turn on your lights if you have setup everything properly. For a full list of commands go to commandlist.txt.

https://developers.meethue.com/philips-hue-api
Philips thinks it should be YOU who profits from your work. What you produce you own and are free to give away or sell. That also means that everything connected with use of your product is your responsibility. Philips will not accept liability if your product causes harm. It is also entirely up to you whether and on what terms to commercialize your product.
Just as “what is yours is yours”, “what is ours is ours”. The software, trademarks documentation, and any other materials we provide to help you develop hue apps, including especially the interface specifications “API” belong to Philips. It may happen that working on an app suggests an idea to you for an improvement in the API or our materials. If you suggest any improvements to us and we adopt them, they become part of the platform used by everyone, and belong to us.



need to complain about the documentation since it is horrible