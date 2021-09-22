To setup files on a new Linux instance:

- Install GNU Stow.
- Clone the repository in the home folder.
  This should create a `~/dotfiles` folder.
- Change directory to the new one.
- Run `stow *` (or individually with `stow <package>` to install only a single subfolder.
