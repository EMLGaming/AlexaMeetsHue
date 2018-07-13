# AlexaMeetsHue

By EMLGaming
with very very big thanks to Jaap and Sahan for this awsome internship.

## Demo

[DEMO VIDEO](https://youtu.be/_atVcVDo52o)<br>

## Disclaimer

**I made this project in one week at my great intership. For pure functionality I don't recommend using this code since there is already the official alexa app for controlling your phillips hue lights. My app does have some funny easter eggs though.** This might look like very little code for a whole week but that is the art off clean coding. :smirk:

## Description

My program allowes the user to use voice commands (with Amazon Alexa) to control your philips hue lights.

## Installation

**Prerequisets:**

* [Phillips hue account](https://account.meethue.com/account)<br>
* [Phillips hue developer account](https://developers.meethue.com/) This account is very hard to get if you are not partnered with phillips. You have to get verified by phillips before you get your account and that process mights take weeks.<br>
* [StdLib account](https://stdlib.com/) This is for hosting the functions alexa calls I would recommend using the recommended AWS lambda but I don't have a credit card to link. If you follow this guide exactly it is 100% free and gives the same functionality as AWS lambda.<br>
* [amazon devloper account](https://developer.amazon.com)<br>

**Get your access token:** 

You use this access token to controll your phillips hue lights from a public ip.<br>

Edit accestoken.sh (use whatever text editor you like) <br>
Add your clientid and clientsecret. <br> 
You get these from [Phillips hue developer account](https://developers.meethue.com/) when you are logged in and create an app. When creating the app it doesn't matter what name and callback url you give it. <br>
Now save the file, give it permissions to execute and run it. <br>
```
chmod +x get accestoken.sh
./accestoken.sh
```
Follow the steps in the bash file exactly. <br>

You should now have the access token. <br>

**Edit env.json:**

Edit the env.json file and add your access token and philips API username in the empty quotes. <br>

[GUIDE](https://developers.meethue.com/documentation/configuration-api) to get your philips API username.


**Setup the endpoint:**

For this I used StdLib. In would have rather used the recommended AWS lambda but I don't have a credit card to link so I had to go for a third party option. <br>

Make sure you have Node.js installed.
For installing StdLib type:
```
npm install lib.cli -g
```
Now we create a workspace by typing:
```
lib init
```
Create a service with an Alexa template by typing:
```
lib create -t alexa
```
Change directory by typing:
```
cd <StdLib username>/alexa/
```
Install node-fetch for making requests to your hue lights:
```
npm install node-fetch --save
```
Move the Intents from this github repo into your /alexa/function/intents folder. <br>
Remove the Standard env.json file in the /alexa folder. <br>
Move the ChangeLight.js and env.json (you should have edited the env.json file at the last step) file into the /alexa folder. <br>

To deploy your functions type:
```
lib up dev
```
If you have done every step correctly you should not get an error. Scroll up untill you see (default function). Copy that URL (example https://<username>.lib.id/alexa@dev/) and set that as your alexa endpoint (next step).

**Create your alexa skill:**

* Go to your [Amazon developer console](https://developer.amazon.com/alexa/console/ask). 
* Add new skill and call it AlexaMeetsHue. 
* Set language to english (us). (this is the most tested and stable)
* Chose custom skill. (this gives us more custumization)
* Goto JSON Editor under Interaction model and drag the alexa.json file in there. (if you want to add more utterences feel free to do so)
* Now press the save button and then the build button.

* Go to endpoint. 
* Chose HTTPS. 
* Paste the link you got from the above step in your default regoin section. (example https://<username>.lib.id/alexa@dev/) <br>
* Click select ssl certificate and use: ```My development endpoint is a sub-domain of a domain that has a wildcard certificate from a certificate authority.```
* Press the save endpoint button.

* Go to test section.
* Enable test for this skill. 
* Type "ask lights to dance" .
* The lights should now start looping though all colors.

**Use this skill on your actuall amazon enabled device:**

If you are loged in with the same amazon account you used for building the alexa app and your actual device you are good to go. If now log in with the same account on your device. Download the Amazon Alexa app and follow the instructions on screen. 

## Changes I would make if I was going to publish

* Get the alexa app approved by amazon. This eleminates the process of you having to create the alexa app and manually add the json file.<br>
* Add more utterences to make the process if calling the functions more natural. I would use beta testers to get all the samples since I don't know what users mights want to say to trigger all the functions. <br>
* Extensivly test this app on stability <br>
* Create a webserver to automate the process of getting the access token and automaticly use it in your application. <br>
* Get the refresh token to work, after 7 days your access token will expire and thus break the application. I wasn't able to implement the refresh token refreshing the access token after 7 days due to a mistake phillips made implementing the digest authentication. I am able to get the refresh and access token to work when I downgrade to basic authentication but then I put the user data at risk so I have decided to not do that. <br>

## Usage

When everything is setup properly you should be able to give voice commands to your Amazon Alexa device. To test say "Alexa, tell lights to turn on."<br> 
For a full list of commands go to [commandlist.txt](commandlist.txt).

## Documentation

* [Amazon Developer Docs](https://developer.amazon.com/documentation)
* [Phillips Developer Docs](https://developers.meethue.com/philips-hue-api)
* [StdLib Docs](https://docs.stdlib.com/main/#/introduction)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
