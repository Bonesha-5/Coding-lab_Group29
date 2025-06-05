__What our System Does!__

Our team has built an automated system handling logs, specifically designed to keep tabs on patient health and how resources are used in a hospital. Basically, it's like a smart assistant for all the data pouring in from medical equipment.

A quick look at what it does:

__.Grabs Data in Real-Time:__ This system constantly pulls live information from simulated heart rate monitors, temperature sensors, and even water meters. That way, we always have the most up-to-the-minute details.

__.Smart Archiving:__ We've included a neat archiving tool that lets you pick exactly which log file you want to back up. It moves the active log files into a special archive folder, gives them a clear timestamp (like heart_rate_2024-06-03_10:30:00.log), and then creates a fresh, empty log file. This keeps our current logs tidy while making sure we save all the history.

__.Generates Insightful Reports:__  Our system doesn't just collect data; it also spits out helpful reports. It digs into the archive logs to count how often each device recorded something. It can even tell you when the very first and last entries happened! These reports get added to an analysis file, which helps us understand device activity and spot trends over time.

So, in a nutshell, our system makes sure that important patient health and resource usage data are collected reliably, kept organized, and smartly analyzed. This gives hospitals valuable insights to help them run things better.


__Linux operations used__ 

To make this system work, we leveraged several powerful Linux commands and shell scripting techniques:

__.case:__ used in our sripts to handle user input for menu selections, allowing for structured decision-making based on the user's choice (e.g, selecting which log file to archive or analyze).

__.awk:__ awk helps us process log files line by line, allowing us to extract specific fields, count occurrences of devices, an identify temporal patterns.

__.mv(move):__ it allows us to relocate active log files into their designated archive folders.

__.echo:__ it is used throughout our scripts for displaying messages to the user, providing prompts, feedback, and report outputs.

__.mkdir (make directory):__ Used to create necessary directory structures.
