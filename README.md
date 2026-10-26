# NinjaOne Show Message

PowerShell script that displays a message box on the logged-on user's screen, deployed through NinjaOne.

## Setup

1. In NinjaOne, go to Administration > Library > Automation and add a new PowerShell script.
2. Paste the contents of `Show-Message.ps1`.
3. Add the script variables:

| Name      | Type   | Required | Description                                   |
|-----------|--------|----------|-----------------------------------------------|
| `message` | String | Yes      | Text shown in the message box                 |
| `title`   | String | No       | Window title (default: `IT Department`)       |

## Usage

Run the script against a device with **Run As** set to **Current Logged On User**. Running as System will not show anything, since the System account has no access to the user's desktop.

The script waits until the user clicks OK, then writes the result to the activity output:

```
Message shown to jdoe, user clicked: OK
```

## Notes

- Nothing is displayed if no user is logged on.
- If the user doesn't click OK, the run ends when NinjaOne's script timeout is reached.
- NinjaOne strips `!` from script variable values, so avoid it in the message.
