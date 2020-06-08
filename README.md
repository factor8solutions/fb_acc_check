# fb_acc_check 


## Please read this!

The script is the late night version written in a hurry to grasp the size of the problem of fake facebook accounts appearing in the PHillipines. 

See: [FB Post OfficeofCybercrimePH](https://www.facebook.com/OfficeofCybercrimePH/posts/1212247179115128) (links to facebook!)

The script can not detect if an account is fake or not. It simple checks if accounts are existent.

We are working on a solution to run this multithreaded for mass account detection. Kindergarten bailed again - need to wait until the evening...

## Usage

Clone the repo:

`git clone https://github.com/factor8solutions/fb_acc_check/`

Make the script executeable:

`cd fb_acc_check && chmod +x check_user.sh`

Run the Script:

- `./check_user firstname lastname lowNumber highNumber output_filename`

The script will check accounts with the pattern:

`https://facebook.com/firstname.lastname.number`
`https://facebook.com/lastname.firstname.number`

in the range from `lowNumber` to `highNumber`

If `output_filename` is not given it will create afile with the pattern `firstname.lastname.lowNumber-highNumber.datetime`

### Example:

`./check_user peter pan 0 100`

Will check all accounts with the pattern `peter.pan.0` to `peter.pan.100` and `pan.peter.0` to `pan.peter.100` (including `peter.pan` and `pan.peter` !) with the output file `peter.pan.0-100.somedatetime` (eg. `peter.pan.0-100.060820200837`)

### What numbers to scan for?

We scanned some accounts from 0-1000000 last night and had hits all over the board. 1,2,3,4,5,6 digit numbers in combination with the firstname lastname variation. SCan as broad as you can. It might take a while to check 2.000.000 links...

## How to contribute

The script itself will be abandoned soon we think and replaced with a more sophisticated program. If you find obvious errors, feel free to patch them and create a pull request.

### Known Fake Accounts

If you know of fake accounts please let us know. We need something to shoot at with the script/solution. We are especially looking for:

- Fake accounts with another pattern than first.last.number (there are already other patterns known, but we are not sure yet)
- Anything that can help us finding a pattern of how and when these accounts are created (acountXY appeared at... etc.)
- Anything that might help finding patterns in account behauvior (adding friends, messages, etc.)

### FB stuff

Since facebook doesn't answer us on the numbering pattern for new accounts so far we are looking for:

- People who are willing to create a certain amount of accounts with the same name to bruteforce the numbering pattern
- People with insight into the FB API to find a way to check when accounts were created
- People who have time to check, possibly thousands, of account links to see if they are really fake (`peter.pan.1` might not be a fake account but `peter.pan.526` might be. Finding possible fake accounts is just half the rent...)

### Scan results

We are interested in your scan results. Please send them to us to create an extensive list of fake accounts to allow us to rescan accounts to find patterns. We will try to organize this a little better in the evening today (June 08 2020). 

## Contact

You can send us a Mail to [info@factor8.io](mailto:info@factor8.io?subject=FB%20Fake%20Accounts)

Facebook: [factor8solutions](https://www.facebook.com/factor8solutions/)
Twitter: [factor8io](https://twitter.com/factor8io)

Signal: +85296116985








