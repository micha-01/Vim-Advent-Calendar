# 🎁 Vim-Advent-Calendar
A calendar all about (probably) the best editor there has ever existed:)
As you can tell, I'm just a little bit biased, but this does not mean, that you cannot form you own opinions.
So try all the things in the calendar to get a good idea of the power and capabilities of (Neo)Vim.
You're going to learn the basics, random tricks, configuration and (some) advanced usage.
Maybe it is a bit much for 24 days, but if you continue to use (Neo)Vim, you'll be amazed how great it is:)

## 🚦 Get started
1. Clone git repo using ssh: `git clone git@github.com:micha-01/Vim-Calendar.git`
2. Have a look at the prerequisites: `prerequisites.md`
3. Pull to get the password for the day: `git pull`
4. Unzip each door using the password for the given day: `unzip -P <PASSWORD> path/to/Door_<X>`.
5. Repeat the steps 3 and 4 for 23 times.
52. Profit:)

## 🪄 Automagically open Doors
If you'd like to automatically open the current door (i.e. unzip the door), do the following:
1. Set `AUTO_UNZIP=true` in `auto_unzip.sh`
2. Add execution permissions using `chmod u+x path/to/auto_unzip.sh`
3. Add the following to your cron jobs using `crontab -e`:
    `01 00 * * * absolute/path/to/auto_unzip.sh`

Now each door is automatically opened at 00:01 every day.

## 🔒 Passwords
1. NanoIsForPlebs
2. Bogosort>Quicksort

# 🎄 Merry Christmas!
![xkcd 378](https://imgs.xkcd.com/comics/real_programmers.png)
