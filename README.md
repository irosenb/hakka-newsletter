# Setup 

This describes how to run this Jekyll site locally. 

First, clone this repo to your desktop. Then, install the gem for jekyll by running `gem install jekyll`. `cd` into the hakka-newsletter repo and then run `jekyll serve -w`. Go to localhost:4000, and if you see "Your new Jekyll site" at the top, you're good to go! 

## Making new newsletter 

I've included a rake task that lets you create a newsletter automatically. Run `rake new_newsletter` in the command line, and there will be a prompt to put in the newsletter name. Alternatively, you can do `rake new_newsletter[title]`, replacing title with your newsletter name. Note that this tries to automatically open the file in Sublime Text with `subl`. If you don't have it set up, there are instructions [here](https://www.sublimetext.com/docs/2/osx_command_line.html) about how to set it up. 

## Pushing 

Since this isn't a blog, you can push changes as much as you want. Commit the changes you've been working on, then `git push` to Github. 

## Pulling

Sometimes, other people might work on the newsletter as well. If so, do a `git pull` of the changes so that you can work on the most recent changes. 

# Writing

## Reading time

For convienence, I've included a filter that retrieves the reading time of an article. All you have to do is write `{{ "YOUR_LINK" | reading_time }}`, putting a link inside the quotes. It must be on the same line as the h2 link.   

