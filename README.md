### Editing the lab manual: how to get started
All Git jargon is in **bold**.

1. Prerequisites 
  1. Download [GitHub Desktop](https://desktop.github.com/). Or you can use the equivalent commandline tool, Git.
  1. Follow GitHub Desktop instructions to **clone** this repository to your machine. 
  2. Get yourself added by the repository owner so that you have **collaborator** status. This will allow you to make changes to the repository.
  3. To make sure at any given time that your local copy of the files are up-to-date, execute a **pull** -- this pulls updates from GitHub's server.
1. The workflow. _(See also: the summary in [GitHub Desktop's overview](https://desktop.github.com/))_
  2. When you want to make a series of alterations/additions to the files, create a new **branch** on GitHub Desktop (or on the GitHub repository website, or in the commandline) and give it a descriptive name. This name explains the nature of the changes you intend to make. For instance, a likely branch name might be 'Converting-some-images-to-TeX'.
    3. _What is a branch?_: You can think of a branch as a parallel working copy of the repository, but which is a safe sandbox in which you can mess around and not worry about affecting other peoples' work. When you feel the branch's latest state is mature and is ready to be incorporated back into the **master branch**, you will merge your branch back into the master (see below), and then **delete** your branch. 
  3. As you make new changes to files in your branch (this includes both editing old files and adding/deleting files), every time you want to save your work, execute a **commit**. A commit basically records a snapshot of your branch; you will be able to roll back to any commit you've made, should you need to. With each commit you make, be sure to add a brief description of what changes you've just made.
    4. Before each commit, also, I recommend you compile the whole TeX file. This lets you be sure you haven't left LaTeX bugs in your work. 
  4. When you feel your branch is ready to be incorporated back into the master branch, create for it a **Pull Request**. A pull request contains a description of your changes and allows other collaborators to consider your changes and give feedback. If all looks good, someone (Aaron doesnt understand yet who besides the owner has this permission) will **merge** your branch into the master branch. At this point, your branch has served its purpose and should be **deleted**. Note: 'deleting' a branch only means that no one will use it for any new work; 'deleted' branches will, however, remain available for rolling back.
  5. Everyone else should make sure to pull the latest working copy of the repository down to their machines.
  

### Recommended tutorials on the Git/GitHub workflow: 
1. Another nice, high-level guide from GitHub: https://guides.github.com/introduction/flow/
2. An explanation of what commits and branches are actually doing to the files on your computer: https://git-scm.com/book/en/v1/Git-Branching-What-a-Branch-Is


### Caveats/Misc
1. Be careful about moving files around! If you move a file tracked by Git to another location, or if you rename it, sometimes Git struggles with differentiating this from the file simply being deleted and new one created. Sometimes GitHub Desktop seems to understand, sometimes not. Tread carefully!




