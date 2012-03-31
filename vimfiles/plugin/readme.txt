README for sdvim.vim

Installation:

Once you have installed vim6.0+, you just need to copy sdvim.vim to plugins
directory in vim directory.

Usage:

In gvim you should see SD menu in toolbar. You can also call the functions.
The functions of use are
1. SDCheckOut() - This function can be used to checkout current file.
2. SDShowHistory() - Shows the history for the currently opened file.
    By default the history is folded to open fold, use "zo". Also enter
    is pressed on the history line, the changes are diffed.
3. SDdiff() - Diffs the current file with the checked in version.
4. SDdiffopened() - Shows the list of all the opened file and diffs the
    file when the file is selected entered.
5. SDRevertChanges() - Reverts the current file if opened for edit.
6. SDAdd() - Adds the current file.
7. SDCreateChangelist() - Creates the changelist as a file and opens it.
    Prompts for submitting when closing changelist.


To call a function use call <function name> when in normal mode.
