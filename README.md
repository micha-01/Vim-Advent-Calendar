# 🎁 Vim-Advent-Calendar
A calendar all about (probably) the best editor that has ever existed:)
As you can tell, I'm just a little bit biased, but this does not mean, that you cannot form you own opinions.
So try all the things in the calendar to get a good idea of the power and capabilities of (Neo)Vim.
You're going to learn the basics, random tricks, configuration and (some) advanced usage.
Maybe it is a bit much for 24 days, but if you continue to use (Neo)Vim, you'll be amazed how great it is:)

## 🚀 Get started
1. Clone git repo using ssh: `git clone git@github.com:micha-01/Vim-Advent-Calendar.git`
2. Have a look at the prerequisites: `prerequisites.md`
3. Pull to get the password for the day: `git pull`
4. Unzip each door using the password for the given day: `unzip -P <PASSWORD> path/to/Door_<X>`.
5. Repeat the steps 3 and 4 every day until Christmas.
52. Profit:)

## ✨ Automagically open Doors
Make sure the script has execute permissions using: `chmod u+x path/to/auto_unzip.sh`

- Open current door using cron:
    1. Edit you cron jobs using `crontab -e` 
    2. Add `01 00 * * * /absolute/path/to/auto_unzip.sh --today` to it
    3. Now each door is automatically opened at 00:01 every day
- Open all doors, that can already be opened:
    1. Use the `--all` option
- Open a specific door:
    1. Use the `--door` (or `-d`) option with a given day as an integer

## 🤝 Contribution
If you spot a mistake or have an idea to improve the project, create an issue.

# 🎄 Merry Christmas!
![xkcd 378](https://imgs.xkcd.com/comics/real_programmers.png)

## 🔑 Passwords
These are the passwords for each of the 24 doors. Do not take them too seriously:)
1. NanoIsForPlebs
2. Bogosort>Quicksort
3. BoycottJavascript
4. SegmentationFault
5. CoreDumped
6. DasistdasHausvomSamichlaus
7. AlanTuring
8. IuseArchbtw
9. WingardiumLeviosa
10. P=NP
11. Rowhammer
12. MemoryLeaksWithGarbageCollection
13. unsatisfiable
14. Carmichael
15. SingularValueDecomposition
16. Sectumsempra
17. XÆA-12
18. KolmogorovComplexity
19. WebKit>Chromium
20. GNU+Linux
21. Lokinet
