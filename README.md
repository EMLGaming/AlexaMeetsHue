# AlexaMeetsHue

By EMLGaming
with very very big thanks to Jaap and Sahan for this awsome internship.

## TODO:

finish this readme<br>
work properly<br>
guide to get the env.json<br>
make video <br>
description: "My program allowes the user to use voice commands using Amazon Alexa to control your philips hue lights."<br>

## Disclaimer

**I made this project in one week at my great intership. For functionality I don't recommend using this code since there is already the official alexa app for controlling your phillips hue lights.**

## Description

My program allowes the user to use voice commands (for Amazon Alexa) to control your philips hue lights.

## Installation

**Prerequisets:**

* [Phillips hue account](https://account.meethue.com/account)<br>
* [Phillips hue developer account](https://developers.meethue.com/) This account is very hard to get if you are not partnered with phillips. You have to get verified by phillips before you get your account and that process mights take weeks.<br>
* [StdLib account](https://stdlib.com/) This is for hosting the functions alexa calls I would recommend using the recommended AWS lambda but I don't have a credit card to link. If you follow this guide exactly it is 100% free and gives the same functionality as AWS lambda.<br>
* [amazon devloper account](https://developer.amazon.com)<br>

**Get your access token:** 

You use this access token to controll your phillips hue lights from a public ip.<br>
edit accestoken.sh (use whatever text editor you like) <br>
Add your clientid and clientsecret. <br> 
you get this from https://developers.meethue.com/ when you are logged in **step by step how to get this**
now save the file <br>
```
chmod +x get accestoken.sh
./accestoken.sh
```
Follow the steps in the bash file exactly. <br>
You should now have the access token. <br>

**Edit env.json:**

Edit the env.json file and add your access token in the empty quotes. <br>

guide to get your username (the thingy you putt in the url of hue thingy)


**Setup the endpoint:**

stdlib make it work
```npm install lib.cli -g```
```lib init```
```lib create -t alexa```
```cd <username>/alexa/```
```npm install node-fetch --save```
replace the files (intents, changelight.js, env.json)
```lib up dev```
scroll up to default function and copy that url as your endpoint in alexa

**Create your alexa skill:**

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

## Changes I would make if I was going to publish

* Get the alexa app approved by amazon. This eleminates the process of you having to create the alexa app and manually add the json file.<br>
* Add more samples to make the process if calling the functions more natural. I would use beta testers to get all the samples since I don't know what users mights want to say to trigger all the functions. <br>
* Extensivly test this app on stability <br>
* Make a webserver to automate the process of getting the acces token and automaticly use it in your application. <br>
* Get the refresh token to work after 7 days so that the application keeps working after the token has expired. <br>

## Usage

When everything is setup properly you should be able to give voice commands to your Amazon Alexa device. To test say "Alexa, tell lights to turn on."<br> 
For a full list of commands go to [commandlist.txt](commandlist.txt).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
