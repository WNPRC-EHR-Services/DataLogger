This procedure covers how to install the DataLogger ASTM Instrument data collector on a Mac system!  This has worked for allowing any modern Mac system with an Apple Silicon chip to receive data from an ASTM instrument, and store it in a local MariaDB database so that the data can be easily read by other systems!  

Versions that are known to work include:
-MacOS 15.3.1 (on an Apple M2 Mac mini)
-Perl 5.34
-MariaDB 11.7.2 (installed with Brew)
-Perl modules: (run "perldoc perllocal" to see the list!)
-Data::UUID: 1.227
-Device::SerialPort: 1.04
-Config::Tiny: 2.30
-DBI:  1.647
-DBD::MariaDB: 1.23
-Data::Uniqid: 0.12

____________________________
SETUP INSTRUCTIONS::
____________________________

Use the Sabrent Serial Device
-Connect one of the new Sabrent FTDI USB to serial adapters
-Run the command:  ls /dev | grep serial
-It'll show all the serial devices
-Confirm that there is a /dev/tty.usbserial-A10LJXIG device. (The TTY is for calling into Unix systems, the CU is for calling out of them.)

Confirm that you've got the X Code Command Line Tools installed:
-Open a terminal
-Run:  xcode-select --install
-Accept the license
-Once the software is installed click Done

Grant the Terminal full disk access
-Go into System Settings -> Privacy and Security
-Go into Full Disk Access
-Click the Plus
-Add Applications -> Terminal

Install the Brew Tools and MariaDB (MySQL variant)
-If not already installed - Install Brew with the following command:  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
-Once installed launch a Terminal and run:  echo >> /Users/*username*/.zprofile
-Then run:  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/*username/.zprofile
-Then run:  eval "$(/opt/homebrew/bin/brew shellenv)"
-Next run: brew install mariadb
-Next run: brew services start mariadb

Install the Perl CPANM tools:
-Run sudo perl -MCPAN -e shell
-Hit enter to use defaults
-When prompted for the approach, enter "sudo"
-Once it's done you'll be at a cpan prompt
-Run:  o conf init
-Hit Enter to configure automatically
-It will write the config
-Run the command:  install CPAN
-(say Allow to any security prompts that come up)
-Run the command:  reload CPAN
-Type: exit

Restart the computer!

Get back into a perl shell by running:  sudo perl -MCPAN -e shell
-Run:  install Device::SerialPort
-Run:  install Data::UUID
-Run: install Data::Uniqid
-Run: install Config::Tiny
-Type "exit" To leave the perl prompt
-Run: sudo perl -MCPAN -e "CPAN::Shell->notest('install', 'DBI')"
-Run: sudo perl -MCPAN -e "CPAN::Shell->notest('install', 'DBD::MariaDB')"
-Once that finishes proceed with the steps below!

Set up Local MariaDB MySQL database:
-Launch a terminal
-In a terminal run: mysql
At the mysql prompt, run the command:  ALTER USER 'root'@'localhost' IDENTIFIED BY '*a new password that only you know*';
-Next Run:  CREATE DATABASE ASTM;
-Type exit to quit!
-Set up source folder:
-Set up a new folder in your home directory called "Datalogger-src"
-Copy in all the files from this repository!  (DataLogger.Standalone.pl, DataLogger.conf, DataLogger.err,  Chemistry-Analyzer-Schema-ASTM.sql)
-Open up a terminal and CD to that directory
-Run:  mysql -u root -p ASTM < Chemistry-Analyzer-Schema-ASTM.sql
-That will restore the ASTM database structure, but not the data!

Create ASTM User:
-Run mysql -u root -p (to get into a MySQL prompt)
-Run:  CREATE USER 'astm'@'%.%.%.%' IDENTIFIED BY '*a password only you know*';
-Run:  grant all on *.* to astm@'%.%.%.%';
-Run: CREATE USER 'astm'@'localhost' IDENTIFIED BY '*a password only you know';
-Run: grant all on *.* to astm@'localhost';
-Type exit
-Now the ASTM database structure exists and the astm user can access the database from the local machine!

Run the script:
-Launch a terminal
-CD to the ~/Datalogger-src directory
-Run:  nano Datalogger.conf
-Update the "device" to match what you found above (e.g.  tty.usbserial-A10LJXIG
-Run:  ./Datalogger.Standalone.pl
-It will say Open Serial Port, Waiting for Transmission!
-When the instrument outputs data, it will be received by the script, copied to a text file, and uploaded to the local MariaDB database!
