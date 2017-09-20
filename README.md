# Discourse Sync to Dropbox

Backups are useless unless they are off-site. This plugin syncs your automatic backups on Dropbox.


## Installation

Install the [Discourse Sync Base](https://github.com/berlindiamonds/discourse-sync-base) first

Proceed with a normal [installation of a plugin](https://meta.discourse.org/t/install-a-plugin/19157?u=falco).


## After Installation

You need to enable the plugin on Settings -> Plugins and fill you Dropbox Generated Access Token that you can get [here](https://www.dropbox.com/developers/apps/create):

![Dropbox Generated Access Token](https://cloud.githubusercontent.com/assets/1385470/19462641/1cd27538-94cd-11e6-8ec2-0ae37f3a1211.png)



## About

This is a work in progress! Feel free to use and ask questions here, or on [Meta](https://meta.discourse.org/t/discourse-backups-to-dropbox/51176?u=falco).


## Usage

When you visit ../admin/backups, you can just use the normal Backup and it will automtically synchronize your files to your Dopbox account.

![alt text](https://user-images.githubusercontent.com/15628617/30640686-23e72684-9e04-11e7-8c17-a57fabd6e661.png)

To download your backup files from dropbox to your local server, you can visit ..admin/plugins/discourse-sync-to-dropbox/downloader and you will see all your current backup files on your Dropbox acount displayed.
To download the file, just click on **Download** and you will recieve an email with the download download link.

![alt text](https://user-images.githubusercontent.com/15628617/30640746-7470897e-9e04-11e7-8c90-7081b2c80ad0.png)