sbt-repo
========
This project used for cnrd dev vm. The dev vm accesses only github.com.
Please follow below steps to establish dev env.

Prepare software:
--------
 - JDK1.7 http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
 - Git
 - Intellij Idea and Scala plugin for Idea

Set up dev env:
--------
 - Clone sbt-repo from github.
```
git clone https://github.com/JSpaceTeam/sbt-repo.git
```
 - Run sbt-init.sh to setup wording directory.
 - Under js-easy-rest directory run sbt.
 - After enter sbt, run gen-idea to create IDEA project configuration.

 If there is something wrong, please delete ivy/cache/net.juniper folder and update sbt again.
