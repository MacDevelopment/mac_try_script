FiveM /try Command Script
Description
This script introduces a /try command to your FiveM server, enabling players to attempt actions such as breaking into vehicles or doors. The command provides a randomized success or failure outcome, enhancing gameplay immersion.

Features
Randomized Outcomes: Each attempt has a chance of success or failure, adding unpredictability to gameplay.

Customizable Parameters: Easily adjust the success rate and other settings to fit your server's needs.

Detailed Feedback: Players receive clear messages about the outcome of their attempts.

Installation
Download or clone this repository.

Place the script folder into your server's resources directory.

Add the following line to your server.cfg:

lua
Copy
Edit
ensure try-command

4. Restart your server.

Usage
Once installed, players can use the /try command followed by the action they wish to attempt. For example:

lua
Copy
Edit
/try break into vehicle
/try pick lock on door

The script will then process the attempt and provide feedback based on the randomized outcome.

Configuration
The script includes a configuration file where you can adjust settings such as:

Success Rate: Set the probability of a successful attempt.

Cooldown Time: Define the time players must wait before attempting another action.

Action List: Customize the list of actions players can attempt.

Edit the config.lua file to make these adjustments.

Contributing
Contributions are welcome! If you have suggestions or improvements, please fork the repository and submit a pull request.

License
This project is licensed under the MIT License.
