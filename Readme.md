## VSCode Presentations

Many of us in the community want people to migrate away from PowerShell ISE and start using VSCode as their primary editor. There is one problem, many still use ISE for their Demos and Preentations.

I think back to when I was new to PowerShell. I remember seeing a presentation by [Dave Wyatt](https://twitter.com/MSH_Dave), and he was using [ISESteroids](http://www.powertheshell.com/isesteroids/). It blew me away and I had to have it. I immediately went out and got ISESteroids just simplay by seeing someone like Dave use some of it's advanced features. We need to set this example with VSCode if we want to spread adoption.

### VSCode Unique Features

If I had seen Editor Commands when watching a Demo, I would have dropped what I was doing and gone and got VSCode, similar to how I reacted to ISESteroids. This has to be one of the most useful features that are being underutilized in the VSCode PowerShell Extension. When coupled with things like [Plaster Templates](https://github.com/PowerShell/Plaster) or pipeline tasks, it has become one of my most used tools that I am constantly using throughout the day.

Editor Commands also can be embedded in modules. You can add a simple piece of code to check for the $PSEditor variable and then dot source your Editor Commands if the exist. You could also put these in your VSCode PowerShell Profile. This also could be used to make Demos and Presentations ditributable via PSGallery.

![Demo](/images/Demo.gif)

### Access Editor Commands

I set the Keyboard Shortcut *Show Additional Commands from PowerShell Modules* to *Alt+P*.

### Demo 1

This example opens a PowerPoint in your Demo Folder. We often have a PowerPoint in our Demo, so why not open it with style

### Demo 2

This is a simple example of opening a file in the Editor. I open the example psm1 module file to show an example of adding support to your modules.

### Demo 3

This Demo opens the Helpers.ps1 file to show the helper commands for taking input or prompting for choice. When [David Wilson](https://twitter.com/daviwil) released the integrated console support, it broke Editor Commands ability to tie into the Command Palette. Luckily, [Patrick Meinecke](https://twitter.com/SeeminglyScienc) came up with a work around a while back and got it working (You are awesome man!).

### Demo 4

This is just a quick example of using the *Open-EditorFile* to open a file in the Editor.

### Demo 5

This shows how you can use the Helper Commands to prompt for choice. It gives you a selection of your PowerShell Profiles and will open the one you select using the *$PSEditor.Workspace.OpenFile()* Method.

### Demo 6

This is another simple example showing how you can run commands and have the output go to the terminal.

## Notes

I have also been throwing around the idea of making a Plaster Template for VSCode Presentations. There are several ways you could do this, and I would need to play around with it some. I would love some feedback on this, or maybe this could be something the community could work on together.